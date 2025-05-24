import 'package:pi_hole_client/models/api/v6/ftl/metrics.dart';

class MetricsInfo {
  MetricsInfo({
    required this.dnsCache,
    required this.dnsReplies,
  });

  factory MetricsInfo.fromV6(Metrics metrics) {
    return MetricsInfo(
      dnsCache: metrics.metrics.dns.cache,
      dnsReplies: metrics.metrics.dns.replies,
    );
  }

  final DnsCache dnsCache;
  final DnsReplies dnsReplies;

  Map<String, dynamic> toJson() {
    return {
      'dns_cache': dnsCache.toJson(),
      'dns_replies': dnsReplies.toJson(),
    };
  }
}
