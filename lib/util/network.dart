import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sphia/app/config/sphia.dart';
import 'package:sphia/app/log.dart';
import 'package:sphia/app/notifier/config/sphia_config.dart';
import 'package:sphia/app/notifier/core_state.dart';
import 'package:sphia/app/notifier/proxy.dart';
import 'package:sphia/app/state/core_state.dart';
import 'package:sphia/core/helper.dart';
import 'package:validator_regex/validator_regex.dart';

part 'network.g.dart';

@riverpod
class NetworkUtil extends _$NetworkUtil {
  @override
  void build() {}

  static Future<bool> isServerAvailable(int port, {int maxRetry = 3}) async {
    for (var i = 0; i < maxRetry; i++) {
      try {
        final socket = await Socket.connect('localhost', port);
        await socket.close();
        return true;
      } catch (_) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
    return false;
  }

  Future<HttpClientResponse> getHttpResponse(String url) async {
    final sphiaConfig = ref.read(sphiaConfigNotifierProvider);
    final proxyState = ref.read(proxyNotifierProvider);
    final client = HttpClient();
    // init userAgent
    final userAgent = sphiaConfig.getUserAgent();
    client.userAgent = userAgent;
    if (proxyState.coreRunning &&
        (sphiaConfig.updateThroughProxy ||
            url == 'https://api.ip.sb/ip' ||
            url.contains('sphia'))) {
      final coreState = ref.read(coreStateNotifierProvider).valueOrNull;
      if (coreState == null) {
        logger.e('Core state is null');
        throw Exception('Core state is null');
      }

      late final int port;
      if (proxyState.customConfig) {
        port = coreState.customHttpPort;
        if (port == -1) {
          logger.w('HTTP port is not set');
        } else {
          final proxyUrl = '${sphiaConfig.listen}:${port.toString()}';
          client.findProxy = (uri) => 'PROXY $proxyUrl';
        }
      } else {
        port = coreState.routing.name == 'sing-box'
            ? sphiaConfig.mixedPort
            : sphiaConfig.httpPort;
        final proxyUrl = '${sphiaConfig.listen}:${port.toString()}';

        if (sphiaConfig.authentication) {
          final user = sphiaConfig.user;
          final password = sphiaConfig.password;
          client.findProxy = (uri) => 'PROXY $user:$password@$proxyUrl';
        } else {
          client.findProxy = (uri) => 'PROXY $proxyUrl';
        }
      }
    }
    final uri = Uri.parse(url);
    try {
      final request = await client.getUrl(uri);
      final response = await request.close();
      client.close();
      return response;
    } on Exception catch (e) {
      throw Exception('Failed to get response from $url\n$e');
    }
  }

  Future<Uint8List> downloadFile(String url) async {
    try {
      logger.i('Downloading from $url');
      final response = await getHttpResponse(url);
      final bytes = await consolidateHttpClientResponseBytes(response);
      logger.i('Downloaded ${bytes.length} bytes from $url');
      return bytes;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<String> getIp() async {
    try {
      logger.i('Getting ip');
      final response = await getHttpResponse('https://api.ip.sb/ip');
      final responseBody =
          (await response.transform(utf8.decoder).join()).trim();
      final isValidIp = Validator.ipAddress(responseBody);
      if (!isValidIp) {
        throw Exception('Invalid ip: $responseBody');
      }
      return responseBody;
    } on Exception catch (e) {
      logger.e('Failed to get ip: $e');
      throw Exception('Failed to get ip: $e');
    }
  }

  Future<String> getLatestVersion(String coreName) async {
    final apiUrl =
        '${coreRepositories[coreName]!.replaceAll('https://github.com', 'https://api.github.com/repos')}/releases/latest';
    final response = await getHttpResponse(apiUrl);
    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      final version = jsonDecode(responseBody)['tag_name'];
      if (version != null) {
        if (coreName == 'sphia') {
          return version.split('v').last;
        }
        return version;
      } else {
        throw Exception('Failed to parse version');
      }
    } else {
      throw Exception('Failed to connect to Github');
    }
  }

  Future<String> getSphiaChangeLog() async {
    const url =
        'https://api.github.com/repos/YukidouSatoru/sphia/releases/latest';
    final response = await getHttpResponse(url);
    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      final changeLog = jsonDecode(responseBody)['body'];
      if (changeLog != null) {
        return changeLog;
      } else {
        throw Exception('Failed to parse change log');
      }
    } else {
      throw Exception('Failed to connect to Github');
    }
  }
}
