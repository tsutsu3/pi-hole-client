import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
sealed class Config with _$Config {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Config({ConfigData? config, double? took}) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}

@freezed
sealed class ConfigData with _$ConfigData {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory ConfigData({
    Dns? dns,
    Dhcp? dhcp,
    Ntp? ntp,
    Resolver? resolver,
    Database? database,
    Webserver? webserver,
    Files? files,
    Misc? misc,
    Debug? debug,
  }) = _ConfigData;

  factory ConfigData.fromJson(Map<String, dynamic> json) =>
      _$ConfigDataFromJson(json);
}

@freezed
sealed class Dns with _$Dns {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Dns({
    List<String>? upstreams,
    @JsonKey(name: 'CNAMEdeepInspect') bool? cnameDeepInspect,
    bool? blockESNI,
    @JsonKey(name: 'EDNS0ECS') bool? edns0ECS,
    bool? ignoreLocalhost,
    bool? showDNSSEC,
    bool? analyzeOnlyAandAAAA,
    String? piholePTR,
    String? replyWhenBusy,
    int? blockTTL,
    List<String>? hosts,
    bool? domainNeeded,
    bool? expandHosts,
    @DomainConverter() Domain? domain, // >= 6.3
    bool? bogusPriv,
    bool? dnssec,
    String? interface,
    String? hostRecord,
    String? listeningMode,
    bool? queryLogging,
    List<String>? cnameRecords,
    int? port,
    bool? localise, // >= 6.3
    DnsCache? cache,
    List<String>? revServers,
    DnsBlocking? blocking,
    SpecialDomains? specialDomains,
    DnsReply? reply,
    RateLimit? rateLimit,
  }) = _Dns;

  factory Dns.fromJson(Map<String, dynamic> json) => _$DnsFromJson(json);
}

@freezed
sealed class DnsCache with _$DnsCache {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory DnsCache({int? size, int? optimizer, int? upstreamBlockedTTL}) =
      _DnsCache;

  factory DnsCache.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheFromJson(json);
}

@freezed
sealed class DnsBlocking with _$DnsBlocking {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory DnsBlocking({bool? active, String? mode, String? edns}) =
      _DnsBlocking;

  factory DnsBlocking.fromJson(Map<String, dynamic> json) =>
      _$DnsBlockingFromJson(json);
}

@freezed
sealed class SpecialDomains with _$SpecialDomains {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory SpecialDomains({
    bool? mozillaCanary,
    bool? iCloudPrivateRelay,
    bool? designatedResolver,
  }) = _SpecialDomains;

  factory SpecialDomains.fromJson(Map<String, dynamic> json) =>
      _$SpecialDomainsFromJson(json);
}

@freezed
sealed class DnsReply with _$DnsReply {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory DnsReply({ReplyHost? host, ReplyHost? blocking}) = _DnsReply;

  factory DnsReply.fromJson(Map<String, dynamic> json) =>
      _$DnsReplyFromJson(json);
}

@freezed
sealed class ReplyHost with _$ReplyHost {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory ReplyHost({
    bool? force4,
    bool? force6,
    @JsonKey(name: 'IPv4') String? ipv4,
    @JsonKey(name: 'IPv6') String? ipv6,
  }) = _ReplyHost;

  factory ReplyHost.fromJson(Map<String, dynamic> json) =>
      _$ReplyHostFromJson(json);
}

@freezed
sealed class RateLimit with _$RateLimit {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory RateLimit({int? count, int? interval}) = _RateLimit;

  factory RateLimit.fromJson(Map<String, dynamic> json) =>
      _$RateLimitFromJson(json);
}

@freezed
sealed class Dhcp with _$Dhcp {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Dhcp({
    bool? active,
    String? start,
    String? end,
    String? router,
    String? netmask,
    String? leaseTime,
    bool? ipv6,
    bool? rapidCommit,
    bool? multiDNS,
    bool? logging,
    bool? ignoreUnknownClients,
    List<String>? hosts,
  }) = _Dhcp;

  factory Dhcp.fromJson(Map<String, dynamic> json) => _$DhcpFromJson(json);
}

@freezed
sealed class Ntp with _$Ntp {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Ntp({NtpEntry? ipv4, NtpEntry? ipv6, NtpSync? sync}) = _Ntp;

  factory Ntp.fromJson(Map<String, dynamic> json) => _$NtpFromJson(json);
}

@freezed
sealed class NtpEntry with _$NtpEntry {
  const factory NtpEntry({
    @JsonSerializable(explicitToJson: true, includeIfNull: false) bool? active,
    String? address,
  }) = _NtpEntry;

  factory NtpEntry.fromJson(Map<String, dynamic> json) =>
      _$NtpEntryFromJson(json);
}

@freezed
sealed class NtpSync with _$NtpSync {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory NtpSync({
    bool? active,
    String? server,
    int? interval,
    int? count,
    NtpRtc? rtc,
  }) = _NtpSync;

  factory NtpSync.fromJson(Map<String, dynamic> json) =>
      _$NtpSyncFromJson(json);
}

@freezed
sealed class NtpRtc with _$NtpRtc {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory NtpRtc({bool? set, String? device, bool? utc}) = _NtpRtc;

  factory NtpRtc.fromJson(Map<String, dynamic> json) => _$NtpRtcFromJson(json);
}

@freezed
sealed class Resolver with _$Resolver {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Resolver({
    bool? resolveIPv4,
    bool? resolveIPv6,
    bool? networkNames,
    String? refreshNames,
  }) = _Resolver;

  factory Resolver.fromJson(Map<String, dynamic> json) =>
      _$ResolverFromJson(json);
}

@freezed
sealed class Database with _$Database {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Database({
    @JsonKey(name: 'DBimport') bool? dbImport,
    int? maxDBdays,
    @JsonKey(name: 'DBinterval') int? dbInterval,
    bool? useWAL,
    DatabaseNetwork? network,
  }) = _Database;

  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);
}

@freezed
sealed class DatabaseNetwork with _$DatabaseNetwork {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory DatabaseNetwork({bool? parseARPcache, int? expire}) =
      _DatabaseNetwork;

  factory DatabaseNetwork.fromJson(Map<String, dynamic> json) =>
      _$DatabaseNetworkFromJson(json);
}

@freezed
sealed class Webserver with _$Webserver {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Webserver({
    String? domain,
    String? acl,
    String? port,
    int? threads,
    List<String>? headers,
    @JsonKey(name: 'serve_all') bool? serveAll,
    List<String>? advancedOpts, // >= 6.3
    WebSession? session,
    WebTls? tls,
    WebPaths? paths,
    WebInterface? interface,
    WebApi? api,
  }) = _Webserver;

  factory Webserver.fromJson(Map<String, dynamic> json) =>
      _$WebserverFromJson(json);
}

@freezed
sealed class WebSession with _$WebSession {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory WebSession({int? timeout, bool? restore}) = _WebSession;

  factory WebSession.fromJson(Map<String, dynamic> json) =>
      _$WebSessionFromJson(json);
}

@freezed
sealed class WebTls with _$WebTls {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory WebTls({
    String? cert,
    int? validity, // >= 6.3
  }) = _WebTls;

  factory WebTls.fromJson(Map<String, dynamic> json) => _$WebTlsFromJson(json);
}

@freezed
sealed class WebPaths with _$WebPaths {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory WebPaths({String? webroot, String? webhome, String? prefix}) =
      _WebPaths;

  factory WebPaths.fromJson(Map<String, dynamic> json) =>
      _$WebPathsFromJson(json);
}

@freezed
sealed class WebInterface with _$WebInterface {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory WebInterface({bool? boxed, String? theme}) = _WebInterface;

  factory WebInterface.fromJson(Map<String, dynamic> json) =>
      _$WebInterfaceFromJson(json);
}

@freezed
sealed class WebApi with _$WebApi {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory WebApi({
    @JsonKey(name: 'max_sessions') int? maxSessions,
    bool? prettyJSON,
    String? password,
    String? pwhash,
    @JsonKey(name: 'totp_secret') String? totpSecret,
    @JsonKey(name: 'app_pwhash') String? appPwhash,
    @JsonKey(name: 'app_sudo') bool? appSudo,
    @JsonKey(name: 'cli_pw') bool? cliPw,
    List<String>? excludeClients,
    List<String>? excludeDomains,
    int? maxHistory,
    int? maxClients,
    @JsonKey(name: 'client_history_global_max') bool? clientHistoryGlobalMax,
    @JsonKey(name: 'allow_destructive') bool? allowDestructive,
    Temp? temp,
  }) = _WebApi;

  factory WebApi.fromJson(Map<String, dynamic> json) => _$WebApiFromJson(json);
}

@freezed
sealed class Temp with _$Temp {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Temp({double? limit, String? unit}) = _Temp;

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
}

@freezed
sealed class Files with _$Files {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Files({
    String? pid,
    String? database,
    String? gravity,
    @JsonKey(name: 'gravity_tmp') String? gravityTmp,
    String? macvendor,
    String? setupVars,
    String? pcap,
    LogFiles? log,
  }) = _Files;

  factory Files.fromJson(Map<String, dynamic> json) => _$FilesFromJson(json);
}

@freezed
sealed class LogFiles with _$LogFiles {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory LogFiles({String? ftl, String? dnsmasq, String? webserver}) =
      _LogFiles;

  factory LogFiles.fromJson(Map<String, dynamic> json) =>
      _$LogFilesFromJson(json);
}

@freezed
sealed class Misc with _$Misc {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Misc({
    int? nice,
    @JsonKey(name: 'delay_startup') int? delayStartup,
    bool? addr2line,
    @JsonKey(name: 'etc_dnsmasq_d') bool? etcDnsmasqD,
    int? privacylevel,
    @JsonKey(name: 'dnsmasq_lines') List<String>? dnsmasqLines,
    bool? extraLogging,
    bool? readOnly,
    bool? normalizeCPU, // >= 6.3
    Check? check,
  }) = _Misc;

  factory Misc.fromJson(Map<String, dynamic> json) => _$MiscFromJson(json);
}

@freezed
sealed class Check with _$Check {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Check({bool? load, int? shmem, int? disk}) = _Check;

  factory Check.fromJson(Map<String, dynamic> json) => _$CheckFromJson(json);
}

@freezed
sealed class Debug with _$Debug {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Debug({
    bool? database,
    bool? networking,
    bool? locks,
    bool? queries,
    bool? flags,
    bool? shmem,
    bool? gc,
    bool? arp,
    bool? regex,
    bool? api,
    bool? tls,
    bool? overtime,
    bool? status,
    bool? caps,
    bool? dnssec,
    bool? vectors,
    bool? resolver,
    bool? edns0,
    bool? clients,
    bool? aliasclients,
    bool? events,
    bool? helper,
    bool? config,
    bool? inotify,
    bool? webserver,
    bool? extra,
    bool? reserved,
    bool? ntp,
    bool? netlink,
    bool? all,
  }) = _Debug;

  factory Debug.fromJson(Map<String, dynamic> json) => _$DebugFromJson(json);
}

// ========== FTL v6.3+ ===========

@freezed
sealed class Domain with _$Domain {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Domain({required String name, bool? local}) = _Domain;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
}

/// JSON <-> Domain converter
class DomainConverter implements JsonConverter<Domain?, Object?> {
  const DomainConverter();

  @override
  Domain? fromJson(Object? json) {
    if (json == null) return null;

    // v6.2: "domain": "lan"
    if (json is String) {
      return Domain(name: json); // local = null
    }

    // v6.3: "domain": { "name": "lan", "local": true }
    if (json is Map<String, dynamic>) {
      return Domain.fromJson(json);
    }

    return null;
  }

  @override
  Object? toJson(Domain? object) {
    if (object == null) return null;
    return {'name': object.name, 'local': object.local};
  }
}
