import 'package:freezed_annotation/freezed_annotation.dart';

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
    required int inserted,
    required int evicted,
    required int expired,
    required int immortal,
    required List<DnsCacheEntry> content,
  }) = _DnsCache;

  const DnsCache._();

  factory DnsCache.fromJson(Map<String, dynamic> json) =>
      _$DnsCacheFromJson(json);

  int get records => content.fold(
        0,
        (total, item) => total + item.count.valid + item.count.stale,
      );

  Map<String, double> get typePercentages {
    final percentages = <String, double>{};

    for (final item in content) {
      final valid = item.count.valid;
      final stale = item.count.stale;
      final name = item.name;

      if (size > 0) {
        percentages[name] = (valid / size) * 100;
        percentages['$name (stale)'] = (stale / size) * 100;
      } else {
        percentages[name] = 0.0;
        percentages['$name (stale)'] = 0.0;
      }
    }

    final total = percentages.values.fold(0.0, (a, b) => a + b);
    percentages['empty'] = (100.0 - total).clamp(0.0, 100.0);

    return percentages;
  }

  Map<String, dynamic> toFormattedJson() {
    return {
      'size': size,
      'records': records,
      'inserted': inserted,
      'evicted': evicted,
      'expired': expired,
      'immortal': immortal,
      'typePercentages':
          typePercentages.map((k, v) => MapEntry(k, v.toStringAsFixed(2))),
    };
  }
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

  const DnsReplies._();

  factory DnsReplies.fromJson(Map<String, dynamic> json) =>
      _$DnsRepliesFromJson(json);

  double get forwardedPercentage => _percentage(forwarded);
  double get unansweredPercentage => _percentage(unanswered);
  double get localPercentage => _percentage(local);
  double get optimizedPercentage => _percentage(optimized);
  double get authPercentage => _percentage(auth);

  double _percentage(int value) => sum == 0 ? 0 : (value / sum) * 100;

  Map<String, dynamic> toFormattedJson() {
    return {
      'local': local,
      'forwarded': forwarded,
      'optimized': optimized,
      'unanswered': unanswered,
      'auth': auth,
      'sum': sum,
      'local_percentage': localPercentage.toStringAsFixed(2),
      'forwarded_percentage': forwardedPercentage.toStringAsFixed(2),
      'optimized_percentage': optimizedPercentage.toStringAsFixed(2),
      'unanswered_percentage': unansweredPercentage.toStringAsFixed(2),
      'auth_percentage': authPercentage.toStringAsFixed(2),
    };
  }
}
