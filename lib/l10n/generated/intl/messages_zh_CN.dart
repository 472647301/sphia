// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_CN';

  static String m0(coreName) => "未找到核心: ${coreName}";

  static String m1(coreName) => "确定要删除核心 ${coreName} 吗？";

  static String m2(remark) => "确定要删除服务器 ${remark} 吗？";

  static String m3(coreName) => "成功删除核心 ${coreName}";

  static String m4(binPath) => "已将选中核心或规则数据复制到 ${binPath}，将自动扫描核心。规则数据的版本号无法获取";

  static String m5(count, total) => "${count}/${total} 个订阅已更新";

  static String m6(error) => "读取配置文件失败，错误: ${error}";

  static String m7(coreName, version) => "更新 ${coreName} 到 ${version} 成功";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("关于"),
        "add": MessageLookupByLibrary.simpleMessage("添加"),
        "addGroup": MessageLookupByLibrary.simpleMessage("添加分组"),
        "addServer": MessageLookupByLibrary.simpleMessage("添加服务器"),
        "additionalSocksPort":
            MessageLookupByLibrary.simpleMessage("额外的 Socks 端口"),
        "additionalSocksPortMsg": MessageLookupByLibrary.simpleMessage(
            "额外的 Socks 端口，用于路由提供者和其它核心交换数据。若无必要，请不要同时运行多个核心"),
        "address": MessageLookupByLibrary.simpleMessage("地址"),
        "addressEnterMsg": MessageLookupByLibrary.simpleMessage("请输入地址"),
        "allGroups": MessageLookupByLibrary.simpleMessage("所有分组"),
        "allowInsecure": MessageLookupByLibrary.simpleMessage("允许不安全连接"),
        "alpn": MessageLookupByLibrary.simpleMessage("ALPN"),
        "alreadyLatestVersion": MessageLookupByLibrary.simpleMessage("已经是最新版本"),
        "alterId": MessageLookupByLibrary.simpleMessage("Alter ID"),
        "alterIdEnterMsg": MessageLookupByLibrary.simpleMessage("请输入 Alter ID"),
        "alterIdInvalidMsg":
            MessageLookupByLibrary.simpleMessage("请输入有效的 Alter ID"),
        "authPayload": MessageLookupByLibrary.simpleMessage("认证载荷"),
        "authType": MessageLookupByLibrary.simpleMessage("认证类型"),
        "authentication": MessageLookupByLibrary.simpleMessage("认证"),
        "authenticationMsg": MessageLookupByLibrary.simpleMessage("为本地服务器启用认证"),
        "autoConfigureSystemProxy":
            MessageLookupByLibrary.simpleMessage("自动配置系统代理"),
        "autoConfigureSystemProxyMsg":
            MessageLookupByLibrary.simpleMessage("核心启动或停止时自动配置系统代理，默认关闭"),
        "autoGetIp": MessageLookupByLibrary.simpleMessage("自动获取 IP"),
        "autoGetIpMsg": MessageLookupByLibrary.simpleMessage("自动获取 IP，默认关闭"),
        "autoRoute": MessageLookupByLibrary.simpleMessage("自动路由"),
        "autoRunServer": MessageLookupByLibrary.simpleMessage("自动运行服务器"),
        "autoRunServerMsg":
            MessageLookupByLibrary.simpleMessage("在 Sphia 启动时自动运行上次选择的服务器"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "cannotEditOrDeleteGroup":
            MessageLookupByLibrary.simpleMessage("不能编辑或删除分组"),
        "checkUpdate": MessageLookupByLibrary.simpleMessage("检查更新"),
        "checkUpdateFailed": MessageLookupByLibrary.simpleMessage("检查更新失败"),
        "checkingUpdate": MessageLookupByLibrary.simpleMessage("正在检查更新"),
        "clearLatency": MessageLookupByLibrary.simpleMessage("清除延迟"),
        "clearTraffic": MessageLookupByLibrary.simpleMessage("清除流量"),
        "configFilePath": MessageLookupByLibrary.simpleMessage("配置文件路径"),
        "configFormat": MessageLookupByLibrary.simpleMessage("配置格式"),
        "configuration": MessageLookupByLibrary.simpleMessage("配置"),
        "configureDns": MessageLookupByLibrary.simpleMessage("配置 DNS"),
        "configureDnsMsg": MessageLookupByLibrary.simpleMessage(
            "为路由提供者配置 DNS，默认开启。目前只支持配置远程和直连 DNS。请注意地址的格式"),
        "connectToGithubFailed":
            MessageLookupByLibrary.simpleMessage("连接到 Github 失败"),
        "coreApiPort": MessageLookupByLibrary.simpleMessage("核心 API 端口"),
        "coreApiPortMsg":
            MessageLookupByLibrary.simpleMessage("核心 API 端口，用于获取流量统计"),
        "coreNotFound": m0,
        "coreProvider": MessageLookupByLibrary.simpleMessage("核心提供者"),
        "coreStart": MessageLookupByLibrary.simpleMessage("启动核心"),
        "coreStartFailed": MessageLookupByLibrary.simpleMessage("启动核心失败"),
        "coreStop": MessageLookupByLibrary.simpleMessage("停止核心"),
        "currentGroup": MessageLookupByLibrary.simpleMessage("当前分组"),
        "currentIp": MessageLookupByLibrary.simpleMessage("当前 IP"),
        "currentVersion": MessageLookupByLibrary.simpleMessage("当前版本"),
        "customConfig": MessageLookupByLibrary.simpleMessage("自定义配置"),
        "customConfigSwitchUnsupported":
            MessageLookupByLibrary.simpleMessage("自定义配置不支持切换规则分组"),
        "customCoreApiPort":
            MessageLookupByLibrary.simpleMessage("自定义核心 API 端口 (-1 表示关闭)"),
        "customHttpPort":
            MessageLookupByLibrary.simpleMessage("自定义 HTTP 端口 (-1 表示关闭)"),
        "darkMode": MessageLookupByLibrary.simpleMessage("深色模式"),
        "dashboard": MessageLookupByLibrary.simpleMessage("仪表盘"),
        "delete": MessageLookupByLibrary.simpleMessage("删除"),
        "deleteCore": MessageLookupByLibrary.simpleMessage("删除核心"),
        "deleteCoreConfirm": m1,
        "deleteCoreFailed": MessageLookupByLibrary.simpleMessage("删除核心失败"),
        "deleteGroup": MessageLookupByLibrary.simpleMessage("删除分组"),
        "deleteServer": MessageLookupByLibrary.simpleMessage("删除服务器"),
        "deleteServerConfirm": m2,
        "deletedCoreSuccessfully": m3,
        "directDns": MessageLookupByLibrary.simpleMessage("直连 DNS"),
        "directDnsMsg": MessageLookupByLibrary.simpleMessage(
            "直连 DNS，默认为 https+local://dns.alidns.com/dns-query。\n如果你不清楚路由提供者的 DNS 格式，请不要修改"),
        "disableMtuDiscovery":
            MessageLookupByLibrary.simpleMessage("禁用 MTU 发现"),
        "dns": MessageLookupByLibrary.simpleMessage("DNS"),
        "dnsIsNotConfigured": MessageLookupByLibrary.simpleMessage("未配置 DNS"),
        "dnsResolver": MessageLookupByLibrary.simpleMessage("DNS 解析器"),
        "dnsResolverMsg": MessageLookupByLibrary.simpleMessage(
            "DNS 解析器，仅适用于 sing-box。默认为 223.5.5.5"),
        "domainMatcher": MessageLookupByLibrary.simpleMessage("域名匹配器"),
        "domainMatcherMsg": MessageLookupByLibrary.simpleMessage(
            "域名匹配器，默认为 hybrid。仅适用于 xray-core"),
        "domainStrategy": MessageLookupByLibrary.simpleMessage("域名策略"),
        "domainStrategyMsg": MessageLookupByLibrary.simpleMessage(
            "域名策略，默认为 IPIfNonMatch。仅适用于 xray-core"),
        "downMbps": MessageLookupByLibrary.simpleMessage("下行速率 (Mbps)"),
        "downMbpsEnterMsg": MessageLookupByLibrary.simpleMessage("请输入下行速率"),
        "downMbpsInvalidMsg":
            MessageLookupByLibrary.simpleMessage("请输入有效的下行速率"),
        "download": MessageLookupByLibrary.simpleMessage("下载"),
        "downloadSpeed": MessageLookupByLibrary.simpleMessage("下载速度"),
        "edit": MessageLookupByLibrary.simpleMessage("编辑"),
        "editGroup": MessageLookupByLibrary.simpleMessage("编辑分组"),
        "editorPath": MessageLookupByLibrary.simpleMessage("编辑器路径"),
        "enableCoreLog": MessageLookupByLibrary.simpleMessage("启用核心日志"),
        "enableCoreLogMsg": MessageLookupByLibrary.simpleMessage("启用核心日志，默认开启"),
        "enableIpv4": MessageLookupByLibrary.simpleMessage("启用 IPv4"),
        "enableIpv4Msg":
            MessageLookupByLibrary.simpleMessage("为 Tun 启用 IPv4，开启且无法更改"),
        "enableIpv6": MessageLookupByLibrary.simpleMessage("启用 IPv6"),
        "enableIpv6Msg": MessageLookupByLibrary.simpleMessage("为 Tun 启用 IPv6"),
        "enableSniffing": MessageLookupByLibrary.simpleMessage("启用嗅探"),
        "enableSniffingMsg":
            MessageLookupByLibrary.simpleMessage("启用流量嗅探，默认开启"),
        "enableSpeedChart": MessageLookupByLibrary.simpleMessage("启用速度图表"),
        "enableSpeedChartMsg":
            MessageLookupByLibrary.simpleMessage("启用速度图表，默认关闭"),
        "enableStatistics": MessageLookupByLibrary.simpleMessage("启用统计"),
        "enableStatisticsMsg":
            MessageLookupByLibrary.simpleMessage("启用统计，默认关闭。开启后会统计流量并在仪表盘显示速度"),
        "enableTun": MessageLookupByLibrary.simpleMessage("启用 Tun"),
        "enableTunMsg": MessageLookupByLibrary.simpleMessage("启用 Tun，需要管理员权限"),
        "enableUdp": MessageLookupByLibrary.simpleMessage("启用 UDP"),
        "enableUdpMsg":
            MessageLookupByLibrary.simpleMessage("启用 UDP，仅适用于本地 Socks 服务器"),
        "encryption": MessageLookupByLibrary.simpleMessage("加密"),
        "endpointIndependentNat":
            MessageLookupByLibrary.simpleMessage("Endpoint Independent NAT"),
        "enterValidNumberMsg": MessageLookupByLibrary.simpleMessage("请输入有效的数字"),
        "exit": MessageLookupByLibrary.simpleMessage("退出"),
        "exportToClipboard": MessageLookupByLibrary.simpleMessage("导出到剪贴板"),
        "exportToFile": MessageLookupByLibrary.simpleMessage("导出到文件"),
        "fetchSubscription": MessageLookupByLibrary.simpleMessage("获取订阅"),
        "fileDoesNotExist": MessageLookupByLibrary.simpleMessage("文件不存在"),
        "fingerPrint": MessageLookupByLibrary.simpleMessage("指纹"),
        "flow": MessageLookupByLibrary.simpleMessage("流控"),
        "getIpFailed": MessageLookupByLibrary.simpleMessage("获取 IP 失败"),
        "gettingIp": MessageLookupByLibrary.simpleMessage("正在获取 IP"),
        "groupHasNoSubscription":
            MessageLookupByLibrary.simpleMessage("分组没有订阅"),
        "groupName": MessageLookupByLibrary.simpleMessage("分组名称"),
        "groupNameEnterMsg": MessageLookupByLibrary.simpleMessage("请输入分组名称"),
        "grpcMode": MessageLookupByLibrary.simpleMessage("gRPC 模式"),
        "grpcServiceName": MessageLookupByLibrary.simpleMessage("gRPC 服务名称"),
        "hide": MessageLookupByLibrary.simpleMessage("隐藏"),
        "host": MessageLookupByLibrary.simpleMessage("主机"),
        "httpPort": MessageLookupByLibrary.simpleMessage("HTTP 端口"),
        "httpPortMsg":
            MessageLookupByLibrary.simpleMessage("HTTP 端口，仅适用于 xray-core"),
        "hysteriaProtocol": MessageLookupByLibrary.simpleMessage("Hysteria 协议"),
        "hysteriaProvider":
            MessageLookupByLibrary.simpleMessage("Hysteria 提供者"),
        "import": MessageLookupByLibrary.simpleMessage("导入"),
        "importCoreFailed": MessageLookupByLibrary.simpleMessage("导入核心失败"),
        "importCoreSuccessfully":
            MessageLookupByLibrary.simpleMessage("成功导入核心"),
        "importFromClipboard": MessageLookupByLibrary.simpleMessage("从剪贴板导入"),
        "importMultiCoresMsg": m4,
        "ipv4Address": MessageLookupByLibrary.simpleMessage("IPv4 地址"),
        "ipv4AddressMsg": MessageLookupByLibrary.simpleMessage("Tun IPv4 地址"),
        "ipv6Address": MessageLookupByLibrary.simpleMessage("IPv6 地址"),
        "ipv6AddressMsg": MessageLookupByLibrary.simpleMessage("Tun IPv6 地址"),
        "latencyTest": MessageLookupByLibrary.simpleMessage("延迟测试"),
        "latencyTestFailed": MessageLookupByLibrary.simpleMessage("延迟测试失败"),
        "latencyTestUrl": MessageLookupByLibrary.simpleMessage("延迟测试地址"),
        "latencyTestUrlMsg": MessageLookupByLibrary.simpleMessage(
            "延迟测试地址，默认为 http://cp.cloudflare.com"),
        "latestVersion": MessageLookupByLibrary.simpleMessage("最新版本"),
        "launchUrlFailed": MessageLookupByLibrary.simpleMessage("打开链接失败"),
        "listen": MessageLookupByLibrary.simpleMessage("监听"),
        "listenMsg":
            MessageLookupByLibrary.simpleMessage("本地服务器监听地址，默认为 127.0.0.1"),
        "log": MessageLookupByLibrary.simpleMessage("日志"),
        "logLevel": MessageLookupByLibrary.simpleMessage("日志级别"),
        "logLevelMsg": MessageLookupByLibrary.simpleMessage("日志等级，默认为 warning"),
        "maxLogCount": MessageLookupByLibrary.simpleMessage("最大日志数量"),
        "maxLogCountMsg":
            MessageLookupByLibrary.simpleMessage("显示的最大日志数量，默认为 64"),
        "mixedPort": MessageLookupByLibrary.simpleMessage("混合端口"),
        "mixedPortMsg":
            MessageLookupByLibrary.simpleMessage("混合端口，仅适用于 sing-box"),
        "mtu": MessageLookupByLibrary.simpleMessage("MTU"),
        "multiOutboundSupport": MessageLookupByLibrary.simpleMessage("多出站支持"),
        "multiOutboundSupportMsg": MessageLookupByLibrary.simpleMessage(
            "多出站支持，默认关闭。sing-box 在此选项开启时不支持流量统计"),
        "multipleCores": MessageLookupByLibrary.simpleMessage("多个核心"),
        "name": MessageLookupByLibrary.simpleMessage("名称"),
        "nameEnterMsg": MessageLookupByLibrary.simpleMessage("请输入名称"),
        "navigationStyle": MessageLookupByLibrary.simpleMessage("导航栏样式"),
        "newVersionAvailable": MessageLookupByLibrary.simpleMessage("有新版本可用"),
        "no": MessageLookupByLibrary.simpleMessage("否"),
        "noConfigurationFileGenerated":
            MessageLookupByLibrary.simpleMessage("未生成配置文件"),
        "noLogsAvailable": MessageLookupByLibrary.simpleMessage("没有可用的日志"),
        "noRunningCores": MessageLookupByLibrary.simpleMessage("没有运行的核心"),
        "noServerSelected": MessageLookupByLibrary.simpleMessage("没有选中的服务器"),
        "numSubscriptionsHaveBeenUpdated": m5,
        "obfs": MessageLookupByLibrary.simpleMessage("混淆"),
        "ok": MessageLookupByLibrary.simpleMessage("确定"),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "passwordEnterMsg": MessageLookupByLibrary.simpleMessage("请输入密码"),
        "passwordMsg": MessageLookupByLibrary.simpleMessage("本地服务器认证的密码"),
        "path": MessageLookupByLibrary.simpleMessage("路径"),
        "pathCannotBeEmpty": MessageLookupByLibrary.simpleMessage("路径不能为空"),
        "plugin": MessageLookupByLibrary.simpleMessage("插件"),
        "pluginOpts": MessageLookupByLibrary.simpleMessage("插件选项"),
        "port": MessageLookupByLibrary.simpleMessage("端口"),
        "portEnterMsg": MessageLookupByLibrary.simpleMessage("请输入端口"),
        "portInvalidMsg": MessageLookupByLibrary.simpleMessage("请输入有效的端口号"),
        "publicKey": MessageLookupByLibrary.simpleMessage("公钥"),
        "publicKeyEnterMsg": MessageLookupByLibrary.simpleMessage("请输入公钥"),
        "qrCode": MessageLookupByLibrary.simpleMessage("二维码"),
        "readConfigFileFailed": m6,
        "recvWindow": MessageLookupByLibrary.simpleMessage("QUIC 连接接收窗口"),
        "recvWindowConn": MessageLookupByLibrary.simpleMessage("QUIC 流接收窗口"),
        "recvWindowConnInvalidMsg":
            MessageLookupByLibrary.simpleMessage("请输入有效的 QUIC 流接收窗口值"),
        "recvWindowInvalidMsg":
            MessageLookupByLibrary.simpleMessage("请输入有效的 QUIC 连接接收窗口值"),
        "refresh": MessageLookupByLibrary.simpleMessage("刷新"),
        "remark": MessageLookupByLibrary.simpleMessage("备注"),
        "remoteDns": MessageLookupByLibrary.simpleMessage("远程 DNS"),
        "remoteDnsMsg": MessageLookupByLibrary.simpleMessage(
            "远程 DNS，默认为 https://dns.google/dns-query。\n如果你不清楚路由提供者的 DNS 格式，请不要修改"),
        "reorderGroup": MessageLookupByLibrary.simpleMessage("排序分组"),
        "repoUrl": MessageLookupByLibrary.simpleMessage("仓库地址"),
        "resetRules": MessageLookupByLibrary.simpleMessage("重置规则"),
        "resetRulesConfirm": MessageLookupByLibrary.simpleMessage("确定要重置规则吗？"),
        "routingProvider": MessageLookupByLibrary.simpleMessage("路由提供者"),
        "rule": MessageLookupByLibrary.simpleMessage("规则"),
        "ruleData": MessageLookupByLibrary.simpleMessage("规则数据"),
        "rules": MessageLookupByLibrary.simpleMessage("规则"),
        "runningCores": MessageLookupByLibrary.simpleMessage("正在运行的核心"),
        "runningServer": MessageLookupByLibrary.simpleMessage("正在运行的服务器"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "saveCoreLog": MessageLookupByLibrary.simpleMessage("保存核心日志"),
        "saveCoreLogMsg":
            MessageLookupByLibrary.simpleMessage("保存核心日志到 log 目录下"),
        "scanCores": MessageLookupByLibrary.simpleMessage("扫描核心"),
        "scanCoresCompleted": MessageLookupByLibrary.simpleMessage("扫描核心完成"),
        "selectEditor": MessageLookupByLibrary.simpleMessage("选择编辑器"),
        "selectProtocol": MessageLookupByLibrary.simpleMessage("选择协议"),
        "selectedServer": MessageLookupByLibrary.simpleMessage("已选服务器"),
        "server": MessageLookupByLibrary.simpleMessage("服务器"),
        "servers": MessageLookupByLibrary.simpleMessage("服务器"),
        "settings": MessageLookupByLibrary.simpleMessage("设置"),
        "shadowsocksProvider":
            MessageLookupByLibrary.simpleMessage("Shadowsocks 提供者"),
        "shortId": MessageLookupByLibrary.simpleMessage("ShortID"),
        "show": MessageLookupByLibrary.simpleMessage("显示"),
        "showAddress": MessageLookupByLibrary.simpleMessage("显示地址"),
        "showAddressMsg":
            MessageLookupByLibrary.simpleMessage("在服务器卡片上显示地址和端口号"),
        "showTransport": MessageLookupByLibrary.simpleMessage("显示传输协议"),
        "showTransportMsg":
            MessageLookupByLibrary.simpleMessage("如果可用，在服务器卡片上显示传输协议"),
        "singleCore": MessageLookupByLibrary.simpleMessage("单个核心"),
        "sni": MessageLookupByLibrary.simpleMessage("SNI"),
        "socksPort": MessageLookupByLibrary.simpleMessage("Socks 端口"),
        "socksPortMsg":
            MessageLookupByLibrary.simpleMessage("Socks 端口，仅适用于 xray-core"),
        "speed": MessageLookupByLibrary.simpleMessage("速度"),
        "spiderX": MessageLookupByLibrary.simpleMessage("SpiderX"),
        "stack": MessageLookupByLibrary.simpleMessage("Stack"),
        "startOnBoot": MessageLookupByLibrary.simpleMessage("开机启动"),
        "startOnBootMsg":
            MessageLookupByLibrary.simpleMessage("开机启动，支持 Windows，Linux，MacOS"),
        "statisticsIsDisabled": MessageLookupByLibrary.simpleMessage("统计已禁用"),
        "stopCoreBeforeDelete":
            MessageLookupByLibrary.simpleMessage("删除核心前请先停止核心"),
        "strictRoute": MessageLookupByLibrary.simpleMessage("严格路由"),
        "subscription": MessageLookupByLibrary.simpleMessage("订阅"),
        "systemProxy": MessageLookupByLibrary.simpleMessage("系统代理"),
        "themeColor": MessageLookupByLibrary.simpleMessage("主题颜色"),
        "themeColorArgb":
            MessageLookupByLibrary.simpleMessage("主题颜色 (A,R,G,B)"),
        "themeColorMsg":
            MessageLookupByLibrary.simpleMessage("更改主题颜色，默认为 Light Blue"),
        "themeColorWarn":
            MessageLookupByLibrary.simpleMessage("ARGB 的取值范围应该是一个 [0，256) 的整数"),
        "tls": MessageLookupByLibrary.simpleMessage("TLS"),
        "traffic": MessageLookupByLibrary.simpleMessage("流量"),
        "transport": MessageLookupByLibrary.simpleMessage("传输"),
        "trojanProvider": MessageLookupByLibrary.simpleMessage("Trojan 提供者"),
        "tunProvider": MessageLookupByLibrary.simpleMessage("Tun 提供者"),
        "unknown": MessageLookupByLibrary.simpleMessage("未知"),
        "upMbps": MessageLookupByLibrary.simpleMessage("上行速率 (Mbps)"),
        "upMbpsEnterMsg": MessageLookupByLibrary.simpleMessage("请输入上行速率"),
        "upMbpsInvalidMsg": MessageLookupByLibrary.simpleMessage("请输入有效的上行速率"),
        "update": MessageLookupByLibrary.simpleMessage("更新"),
        "updateFailed": MessageLookupByLibrary.simpleMessage("更新失败"),
        "updateGroup": MessageLookupByLibrary.simpleMessage("更新分组"),
        "updateGroupFailed": MessageLookupByLibrary.simpleMessage("更新分组失败"),
        "updateSubscriptionInterval":
            MessageLookupByLibrary.simpleMessage("更新订阅间隔 (分钟)"),
        "updateSubscriptionIntervalMsg":
            MessageLookupByLibrary.simpleMessage("更新订阅间隔，默认为 -1 (从不更新)"),
        "updateSubscriptionIntervalWarn":
            MessageLookupByLibrary.simpleMessage("更新订阅间隔应该是一个大于 0 的整数或 -1"),
        "updateThroughProxy": MessageLookupByLibrary.simpleMessage("通过代理更新"),
        "updateThroughProxyMsg": MessageLookupByLibrary.simpleMessage(
            "通过代理更新，默认关闭。开启后，会通过代理服务器更新核心和订阅 (需要有活动的服务器)"),
        "updatedGroupSuccessfully":
            MessageLookupByLibrary.simpleMessage("更新分组成功"),
        "updatedSuccessfully": m7,
        "upload": MessageLookupByLibrary.simpleMessage("上传"),
        "uploadSpeed": MessageLookupByLibrary.simpleMessage("上传速度"),
        "useMaterial3": MessageLookupByLibrary.simpleMessage("使用 Material 3"),
        "user": MessageLookupByLibrary.simpleMessage("用户"),
        "userAgent": MessageLookupByLibrary.simpleMessage("User-Agent"),
        "userAgentMsg": MessageLookupByLibrary.simpleMessage(
            "User-Agent，用于获取订阅和 HTTP 协议。默认为 chrome"),
        "userMsg": MessageLookupByLibrary.simpleMessage("本地服务器认证的用户名"),
        "uuid": MessageLookupByLibrary.simpleMessage("UUID"),
        "uuidEnterMsg": MessageLookupByLibrary.simpleMessage("请输入 UUID"),
        "vlessProvider": MessageLookupByLibrary.simpleMessage("Vless 提供者"),
        "vmessProvider": MessageLookupByLibrary.simpleMessage("VMess 提供者"),
        "warning": MessageLookupByLibrary.simpleMessage("警告"),
        "yes": MessageLookupByLibrary.simpleMessage("是")
      };
}
