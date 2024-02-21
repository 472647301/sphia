import 'dart:convert';
import 'dart:core';

import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:sphia/app/database/database.dart';
import 'package:sphia/app/provider/sphia_config.dart';
import 'package:sphia/core/core.dart';
import 'package:sphia/core/hysteria/config.dart';
import 'package:sphia/util/system.dart';

class HysteriaCore extends Core {
  HysteriaCore()
      : super('hysteria', ['-c', p.join(tempPath, 'hysteria.json')],
            'hysteria.json');

  @override
  Future<void> configure() async {
    final parameters = HysteriaConfigParameters(servers.first);
    final jsonString = await generateConfig(parameters);
    await writeConfig(jsonString);
  }

  @override
  Future<String> generateConfig(ConfigParameters parameters) async {
    final server = (parameters as HysteriaConfigParameters).server;
    if (server.protocol == 'hysteria') {
      final sphiaConfig = GetIt.I.get<SphiaConfigProvider>().config;
      final hysteriaConfig = HysteriaConfig(
        server: '${server.address}:${server.port}',
        protocol: server.hysteriaProtocol ?? 'udp',
        obfs: server.obfs,
        alpn: server.alpn,
        auth: server.authType != 'none'
            ? (server.authType == 'base64' ? server.authPayload : null)
            : null,
        authStr: server.authType != 'none'
            ? (server.authType == 'str' ? server.authPayload : null)
            : null,
        serverName: server.serverName,
        insecure: server.allowInsecure ?? false,
        upMbps: server.upMbps ?? 10,
        downMbps: server.downMbps ?? 50,
        recvWindowConn: server.recvWindowConn,
        recvWindow: server.recvWindow,
        disableMtuDiscovery: server.disableMtuDiscovery ?? false,
        socks5: Socks5(
          listen: '127.0.0.1:${sphiaConfig.additionalSocksPort}',
          timeout: 300,
          disableUdp: !sphiaConfig.enableUdp,
        ),
      );

      return jsonEncode(hysteriaConfig.toJson());
    } else {
      throw Exception(
          'Hyteria does not support this server type: ${server.protocol}');
    }
  }
}

class HysteriaConfigParameters extends ConfigParameters {
  final Server server;

  HysteriaConfigParameters(this.server);
}
