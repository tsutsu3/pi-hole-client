import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';

part 'metrics.freezed.dart';
part 'metrics.g.dart';

@freezed
sealed class InfoDnsMetrics with _$InfoDnsMetrics {
  @JsonSerializable(explicitToJson: true)
  const factory InfoDnsMetrics({
    required DnsCache cache,
    required DnsReplies replies,
  }) = _InfoDnsMetrics;

  factory InfoDnsMetrics.fromJson(Map<String, dynamic> json) =>
      _$InfoDnsMetricsFromJson(json);
}

@freezed
sealed class DnsCache with _$DnsCache {
  @JsonSerializable(explicitToJson: true)
  const factory DnsCache({
    required int size,
    required int records,
    required int inserted,
    required int evicted,
    required int expired,
    required int immortal,
    required List<DnsTypePercentage> typePercentages,
  }) = _DnsCache;

  factory DnsCache.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheFromJson(json);
}

@freezed
sealed class DnsTypePercentage with _$DnsTypePercentage {
  @JsonSerializable(explicitToJson: true)
  const factory DnsTypePercentage({
    required DnsRecordType type,
    required bool isStale,
    required double percentage,
  }) = _DnsTypePercentage;

  factory DnsTypePercentage.fromJson(Map<String, dynamic> json) =>
      _$DnsTypePercentageFromJson(json);
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
    required double forwardedPercentage,
    required double unansweredPercentage,
    required double localPercentage,
    required double optimizedPercentage,
    required double authPercentage,
  }) = _DnsReplies;

  factory DnsReplies.fromJson(Map<String, dynamic> json) =>
      _$DnsRepliesFromJson(json);
}
