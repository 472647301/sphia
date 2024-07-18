import 'package:path/path.dart' as p;
import 'package:sphia/app/database/database.dart';
import 'package:sphia/app/log.dart';
import 'package:sphia/core/helper.dart';
import 'package:sphia/core/rule/extension.dart';
import 'package:sphia/core/rule/sing.dart';
import 'package:sphia/core/sing/config.dart';
import 'package:sphia/server/hysteria/server.dart';
import 'package:sphia/server/server_model.dart';
import 'package:sphia/server/shadowsocks/server.dart';
import 'package:sphia/server/trojan/server.dart';
import 'package:sphia/server/xray/server.dart';
import 'package:sphia/util/system.dart';

class SingBoxGenerate {
  static Future<Dns> dns({
    required String remoteDns,
    required String directDns,
    required String dnsResolver,
    required String serverAddress,
    required bool ipv4Only,
  }) async {
    if (directDns.contains('+local://')) {
      directDns = directDns.replaceFirst('+local', '');
    }

    final dnsRules = <SingBoxDnsRule>[
      if (serverAddress != '127.0.0.1') ...[
        SingBoxDnsRule(
          domain: [serverAddress],
          server: 'local',
        )
      ],
      SingBoxDnsRule(
        domain: ['geosite:geolocation-!cn'],
        server: 'remote',
      ),
      SingBoxDnsRule(
        domain: ['geosite:cn'],
        server: 'local',
      ),
    ];

    return Dns(
      servers: [
        DnsServer(
          tag: 'remote',
          address: remoteDns,
          addressResolver: 'resolver',
          detour: 'proxy',
          strategy: ipv4Only ? 'ipv4_only' : null,
        ),
        DnsServer(
          tag: 'local',
          address: directDns,
          addressResolver: 'resolver',
          detour: 'direct',
          strategy: ipv4Only ? 'ipv4_only' : null,
        ),
        DnsServer(
          tag: 'resolver',
          address: dnsResolver,
          detour: 'direct',
        ),
      ],
      rules: dnsRules,
      finalTag: 'remote',
    );
  }

  static Route route(List<Rule> rules, bool configureDns) {
    List<SingBoxRule> singBoxRules = [];
    singBoxRules.add(SingBoxRule(
      processName: CoreHelper.getCoreFileNames(),
      outbound: 'direct',
    ));
    if (configureDns) {
      singBoxRules.add(
        SingBoxRule(
          protocol: ['dns'],
          outbound: 'dns-out',
        ),
      );
    }
    for (var rule in rules) {
      singBoxRules.add(rule.toSingBoxRule()
        ..outbound = CoreHelper.determineOutboundTag(rule.outboundTag));
    }
    return Route(
      geoip: Geoip(path: p.join(binPath, 'geoip.db')),
      geosite: Geosite(path: p.join(binPath, 'geosite.db')),
      rules: singBoxRules,
      autoDetectInterface: true,
      finalTag: 'proxy',
    );
  }

  static Inbound mixedInbound(
      String listen, int listenPort, List<User>? users) {
    return Inbound(
      type: 'mixed',
      listen: listen,
      listenPort: listenPort,
      users: users,
      domainStrategy: 'prefer_ipv4',
    );
  }

  static Inbound tunInbound({
    required String? inet4Address,
    required String? inet6Address,
    required int mtu,
    required String stack,
    required bool autoRoute,
    required bool strictRoute,
    required bool sniff,
    required bool endpointIndependentNat,
  }) {
    return Inbound(
      type: 'tun',
      inet4Address: inet4Address,
      inet6Address: inet6Address,
      mtu: mtu,
      autoRoute: autoRoute,
      strictRoute: strictRoute,
      stack: stack,
      sniff: sniff,
      endpointIndependentNat: endpointIndependentNat,
    );
  }

  static Outbound generateOutbound(ServerModel server) {
    late Outbound outbound;
    switch (server.protocol) {
      case 'socks':
      case 'vmess':
      case 'vless':
        outbound = xrayOutbound(server as XrayServer);
        break;
      case 'shadowsocks':
        outbound = shadowsocksOutbound(server as ShadowsocksServer);
        break;
      case 'trojan':
        outbound = trojanOutbound(server as TrojanServer);
        break;
      case 'hysteria':
        outbound = hysteriaOutbound(server as HysteriaServer);
        break;
      default:
        throw Exception(
            'Sing-Box does not support this server type: ${server.protocol}');
    }
    return outbound;
  }

  static Outbound xrayOutbound(XrayServer server) {
    if (server.protocol == 'socks') {
      return socksOutbound(server);
    } else if (server.protocol == 'vmess' || server.protocol == 'vless') {
      return vProtocolOutbound(server);
    } else {
      throw Exception(
          'Sing-Box does not support this server type: ${server.protocol}');
    }
  }

  static Outbound socksOutbound(XrayServer server) {
    return Outbound(
      type: 'socks',
      server: server.address,
      serverPort: server.port,
      version: '5',
    );
  }

  static Outbound vProtocolOutbound(XrayServer server) {
    final utls = UTls(
      enabled: server.fingerprint != null && server.fingerprint != 'none',
      fingerprint: server.fingerprint,
    );
    final reality = Reality(
      enabled: server.tls == 'reality',
      publicKey: server.publicKey ?? '',
      shortId: server.shortId,
    );
    final tls = Tls(
      enabled: server.tls == 'tls',
      serverName: server.serverName ?? server.address,
      insecure: server.allowInsecure,
      utls: utls,
      reality: reality,
    );
    Transport? transport;
    if (server.transport != 'tcp') {
      if (server.transport == 'ws') {
        if (server.path != null && server.path!.contains('?ed=')) {
          final splitPath = server.path!.split('?ed=');
          final path = splitPath.first;
          final earlyData = int.tryParse(splitPath.last);
          if (earlyData == null) {
            logger.w('Invalid early data: ${splitPath.last}');
          }
          transport = Transport(
            type: 'ws',
            earlyDataHeaderName: "Sec-WebSocket-Protocol",
            maxEarlyData: earlyData,
            path: path,
            headers: Headers(
              host: server.host ?? server.address,
            ),
          );
        } else {
          transport = Transport(
            type: 'ws',
            path: (server.path ?? '/'),
          );
        }
      } else {
        transport = Transport(
          type: server.transport,
          host: server.transport == 'httpupgrade'
              ? (server.host ?? server.address)
              : null,
          path: server.transport == 'httpupgrade' ? (server.path ?? '/') : null,
          serviceName:
              server.transport == 'grpc' ? (server.serviceName ?? '/') : null,
        );
      }
    }
    return Outbound(
      type: server.protocol,
      server: server.address,
      serverPort: server.port,
      uuid: server.authPayload,
      flow: server.flow,
      alterId: server.protocol == 'vmess' ? server.alterId : null,
      security: server.protocol == 'vmess' ? server.encryption : null,
      tls: tls,
      transport: transport,
    );
  }

  static Outbound shadowsocksOutbound(ShadowsocksServer server) {
    return Outbound(
      type: 'shadowsocks',
      server: server.address,
      serverPort: server.port,
      method: server.encryption,
      password: server.authPayload,
      plugin: server.plugin,
      pluginOpts: server.plugin,
    );
  }

  static Outbound trojanOutbound(TrojanServer server) {
    final tls = Tls(
      enabled: true,
      serverName: server.serverName ?? server.address,
      insecure: server.allowInsecure,
    );
    return Outbound(
      type: 'trojan',
      server: server.address,
      serverPort: server.port,
      password: server.authPayload,
      network: 'tcp',
      tls: tls,
    );
  }

  static Outbound hysteriaOutbound(HysteriaServer server) {
    final tls = Tls(
      enabled: true,
      serverName: server.serverName ?? server.address,
      insecure: server.insecure,
      alpn: server.alpn?.split(','),
    );
    return Outbound(
      type: 'hysteria',
      server: server.address,
      serverPort: server.port,
      upMbps: server.upMbps,
      downMbps: server.downMbps,
      obfs: server.obfs,
      auth: server.authType == 'none'
          ? (server.authType == 'base64' ? server.authPayload : null)
          : null,
      authStr: server.authType == 'none'
          ? (server.authType == 'str' ? server.authPayload : null)
          : null,
      recvWindowConn: server.recvWindowConn,
      recvWindow: server.recvWindow,
      tls: tls,
    );
  }
}
