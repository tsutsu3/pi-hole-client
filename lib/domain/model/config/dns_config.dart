import 'package:freezed_annotation/freezed_annotation.dart';

part 'dns_config.freezed.dart';
part 'dns_config.g.dart';

@freezed
sealed class DnsConfig with _$DnsConfig {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory DnsConfig({
    required bool queryLogging,
    // v6-only fields
    List<String>? upstreams,
    bool? dnssec,
    bool? bogusPriv,
    bool? domainNeeded,
    bool? expandHosts,
    String? listeningMode,
    int? port,
    int? blockTTL,
    List<String>? cnameRecords,
    List<String>? revServers,
    List<String>? hosts,
    DnsBlockingConfig? blocking,
    DnsRateLimitConfig? rateLimit,
  }) = _DnsConfig;

  factory DnsConfig.fromJson(Map<String, dynamic> json) =>
      _$DnsConfigFromJson(json);
}

@freezed
sealed class DnsBlockingConfig with _$DnsBlockingConfig {
  const factory DnsBlockingConfig({
    required bool active,
    required String mode,
  }) = _DnsBlockingConfig;

  factory DnsBlockingConfig.fromJson(Map<String, dynamic> json) =>
      _$DnsBlockingConfigFromJson(json);
}

@freezed
sealed class DnsRateLimitConfig with _$DnsRateLimitConfig {
  const factory DnsRateLimitConfig({
    required int count,
    required int interval,
  }) = _DnsRateLimitConfig;

  factory DnsRateLimitConfig.fromJson(Map<String, dynamic> json) =>
      _$DnsRateLimitConfigFromJson(json);
}
