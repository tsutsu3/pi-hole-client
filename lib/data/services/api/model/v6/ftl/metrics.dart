import 'package:freezed_annotation/freezed_annotation.dart';

part 'metrics.freezed.dart';
part 'metrics.g.dart';

@freezed
sealed class InfoMetrics with _$InfoMetrics {
  @JsonSerializable(explicitToJson: true)
  const factory InfoMetrics({
    required MetricsData metrics,
    required double took,
  }) = _InfoMetrics;

  factory InfoMetrics.fromJson(Map<String, dynamic> json) =>
      _$InfoMetricsFromJson(json);
}

@freezed
sealed class MetricsData with _$MetricsData {
  @JsonSerializable(explicitToJson: true)
  const factory MetricsData({
    required DnsMetrics dns,
    required DhcpMetrics dhcp,
  }) = _MetricsData;

  factory MetricsData.fromJson(Map<String, dynamic> json) =>
      _$MetricsDataFromJson(json);
}

@freezed
sealed class DnsMetrics with _$DnsMetrics {
  @JsonSerializable(explicitToJson: true)
  const factory DnsMetrics({
    required DnsCache cache,
    required DnsReplies replies,
  }) = _DnsMetrics;

  factory DnsMetrics.fromJson(Map<String, dynamic> json) =>
      _$DnsMetricsFromJson(json);
}

@freezed
sealed class DnsCache with _$DnsCache {
  @JsonSerializable(explicitToJson: true)
  const factory DnsCache({
    required int size,
    required int inserted,
    required int evicted,
    required int expired,
    required int immortal,
    required List<DnsCacheEntry> content,
  }) = _DnsCache;

  factory DnsCache.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheFromJson(json);
}

@freezed
sealed class DnsCacheEntry with _$DnsCacheEntry {
  @JsonSerializable(explicitToJson: true)
  const factory DnsCacheEntry({
    required int type,
    required String name,
    required DnsCacheCount count,
  }) = _DnsCacheEntry;

  factory DnsCacheEntry.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheEntryFromJson(json);
}

@freezed
sealed class DnsCacheCount with _$DnsCacheCount {
  const factory DnsCacheCount({
    required int valid,
    required int stale,
  }) = _DnsCacheCount;

  factory DnsCacheCount.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheCountFromJson(json);
}

@freezed
sealed class DnsReplies with _$DnsReplies {
  const factory DnsReplies({
    required int forwarded,
    required int unanswered,
    required int local,
    required int optimized,
    required int auth,
    required int sum,
  }) = _DnsReplies;

  factory DnsReplies.fromJson(Map<String, dynamic> json) =>
      _$DnsRepliesFromJson(json);
}

@freezed
sealed class DhcpMetrics with _$DhcpMetrics {
  @JsonSerializable(explicitToJson: true)
  const factory DhcpMetrics({
    required int ack,
    required int nak,
    required int decline,
    required int offer,
    required int discover,
    required int inform,
    required int request,
    required int release,
    required int noanswer,
    required int bootp,
    required int pxe,
    required DhcpLeases leases,
  }) = _DhcpMetrics;

  factory DhcpMetrics.fromJson(Map<String, dynamic> json) =>
      _$DhcpMetricsFromJson(json);
}

@freezed
sealed class DhcpLeases with _$DhcpLeases {
  const factory DhcpLeases({
    @JsonKey(name: 'allocated_4') required int allocated4,
    @JsonKey(name: 'pruned_4') required int pruned4,
    @JsonKey(name: 'allocated_6') required int allocated6,
    @JsonKey(name: 'pruned_6') required int pruned6,
  }) = _DhcpLeases;

  factory DhcpLeases.fromJson(Map<String, dynamic> json) =>
      _$DhcpLeasesFromJson(json);
}
