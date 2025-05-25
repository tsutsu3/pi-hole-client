import 'package:pi_hole_client/models/api/v6/ftl/metrics.dart';

class MetricsInfo {
  MetricsInfo({
    required this.dnsCache,
    required this.dnsReplies,
  });

  factory MetricsInfo.fromV6(Metrics metrics) {
    return MetricsInfo(
      dnsCache: DnsCacheInfo.fromV6(metrics.metrics.dns.cache),
      dnsReplies: DnsRepliesInfo.fromV6(metrics.metrics.dns.replies),
    );
  }

  final DnsCacheInfo dnsCache;
  final DnsRepliesInfo dnsReplies;

  Map<String, dynamic> toJson() {
    return {
      'dns_cache': dnsCache.toJson(),
      'dns_replies': dnsReplies.toJson(),
    };
  }
}

class DnsCacheInfo {
  DnsCacheInfo({
    required this.size,
    required this.records,
    required this.inserted,
    required this.evicted,
    required this.expired,
    required this.immortal,
    required this.typePercentages,
  });

  factory DnsCacheInfo.fromV6(DnsCache cache) {
    final content = cache.content;

    var validTotal = 0;
    var staleTotal = 0;

    for (final item in content) {
      validTotal += item.count.valid;
      staleTotal += item.count.stale;
    }

    final records = validTotal + staleTotal;

    final percentages = <String, double>{};
    if (records > 0) {
      for (final item in content) {
        final valid = item.count.valid;
        final stale = item.count.stale;
        final name = item.name;

        if (cache.size > 0) {
          percentages[name] = (valid / cache.size) * 100;
          percentages['$name (stale)'] = (stale / cache.size) * 100;
        } else {
          percentages[name] = 0.0;
          percentages['$name (stale)'] = 0.0;
        }
      }
    }

    final totalPercentage = percentages.values.fold(0.0, (a, b) => a + b);
    percentages['empty'] = 100.0 - totalPercentage;

    return DnsCacheInfo(
      size: cache.size,
      records: records,
      inserted: cache.inserted,
      evicted: cache.evicted,
      expired: cache.expired,
      immortal: cache.immortal,
      typePercentages: percentages,
    );
  }

  final int size;
  final int records;
  final int inserted;
  final int evicted;
  final int expired;
  final int immortal;
  final Map<String, double> typePercentages;

  Map<String, dynamic> toJson() {
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

class DnsRepliesInfo {
  DnsRepliesInfo({
    required this.local,
    required this.forwarded,
    required this.optimized,
    required this.unanswered,
    required this.auth,
    required this.sum,
  })  : localPercentage =
            (sum > 0) ? local.toDouble() / sum.toDouble() * 100.0 : 0.0,
        forwardedPercentage =
            (sum > 0) ? forwarded.toDouble() / sum.toDouble() * 100.0 : 0.0,
        optimizedPercentage =
            (sum > 0) ? optimized.toDouble() / sum.toDouble() * 100.0 : 0.0,
        unansweredPercentage =
            (sum > 0) ? unanswered.toDouble() / sum.toDouble() * 100.0 : 0.0,
        authPercentage =
            (sum > 0) ? auth.toDouble() / sum.toDouble() * 100.0 : 0.0;

  factory DnsRepliesInfo.fromV6(DnsReplies replies) {
    return DnsRepliesInfo(
      local: replies.local,
      forwarded: replies.forwarded,
      optimized: replies.optimized,
      unanswered: replies.unanswered,
      auth: replies.auth,
      sum: replies.sum,
    );
  }

  final int local;
  final int forwarded;
  final int optimized;
  final int unanswered;
  final int auth;
  final int sum;

  final double localPercentage;
  final double forwardedPercentage;
  final double optimizedPercentage;
  final double unansweredPercentage;
  final double authPercentage;

  Map<String, dynamic> toJson() {
    return {
      'local': local,
      'forwarded': forwarded,
      'optimized': optimized,
      'unanswered': unanswered,
      'auth': auth,
      'sum': sum,
      'local_percentage': localPercentage,
      'forwarded_percentage': forwardedPercentage,
      'optimized_percentage': optimizedPercentage,
      'unanswered_percentage': unansweredPercentage,
      'auth_percentage': authPercentage,
    };
  }
}
