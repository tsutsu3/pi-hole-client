// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Metrics _$MetricsFromJson(Map<String, dynamic> json) => _Metrics(
      metrics: MetricsData.fromJson(json['metrics'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$MetricsToJson(_Metrics instance) => <String, dynamic>{
      'metrics': instance.metrics,
      'took': instance.took,
    };

_MetricsData _$MetricsDataFromJson(Map<String, dynamic> json) => _MetricsData(
      dns: DnsMetrics.fromJson(json['dns'] as Map<String, dynamic>),
      dhcp: DhcpMetrics.fromJson(json['dhcp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetricsDataToJson(_MetricsData instance) =>
    <String, dynamic>{
      'dns': instance.dns,
      'dhcp': instance.dhcp,
    };

_DnsMetrics _$DnsMetricsFromJson(Map<String, dynamic> json) => _DnsMetrics(
      cache: DnsCache.fromJson(json['cache'] as Map<String, dynamic>),
      replies: DnsReplies.fromJson(json['replies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DnsMetricsToJson(_DnsMetrics instance) =>
    <String, dynamic>{
      'cache': instance.cache,
      'replies': instance.replies,
    };

_DnsCache _$DnsCacheFromJson(Map<String, dynamic> json) => _DnsCache(
      size: (json['size'] as num).toInt(),
      inserted: (json['inserted'] as num).toInt(),
      evicted: (json['evicted'] as num).toInt(),
      expired: (json['expired'] as num).toInt(),
      immortal: (json['immortal'] as num).toInt(),
      content: (json['content'] as List<dynamic>)
          .map((e) => DnsCacheEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DnsCacheToJson(_DnsCache instance) => <String, dynamic>{
      'size': instance.size,
      'inserted': instance.inserted,
      'evicted': instance.evicted,
      'expired': instance.expired,
      'immortal': instance.immortal,
      'content': instance.content,
    };

_DnsCacheEntry _$DnsCacheEntryFromJson(Map<String, dynamic> json) =>
    _DnsCacheEntry(
      type: (json['type'] as num).toInt(),
      name: json['name'] as String,
      count: DnsCacheCount.fromJson(json['count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DnsCacheEntryToJson(_DnsCacheEntry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'count': instance.count,
    };

_DnsCacheCount _$DnsCacheCountFromJson(Map<String, dynamic> json) =>
    _DnsCacheCount(
      valid: (json['valid'] as num).toInt(),
      stale: (json['stale'] as num).toInt(),
    );

Map<String, dynamic> _$DnsCacheCountToJson(_DnsCacheCount instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'stale': instance.stale,
    };

_DnsReplies _$DnsRepliesFromJson(Map<String, dynamic> json) => _DnsReplies(
      forwarded: (json['forwarded'] as num).toInt(),
      unanswered: (json['unanswered'] as num).toInt(),
      local: (json['local'] as num).toInt(),
      optimized: (json['optimized'] as num).toInt(),
      auth: (json['auth'] as num).toInt(),
      sum: (json['sum'] as num).toInt(),
    );

Map<String, dynamic> _$DnsRepliesToJson(_DnsReplies instance) =>
    <String, dynamic>{
      'forwarded': instance.forwarded,
      'unanswered': instance.unanswered,
      'local': instance.local,
      'optimized': instance.optimized,
      'auth': instance.auth,
      'sum': instance.sum,
    };

_DhcpMetrics _$DhcpMetricsFromJson(Map<String, dynamic> json) => _DhcpMetrics(
      ack: (json['ack'] as num).toInt(),
      nak: (json['nak'] as num).toInt(),
      decline: (json['decline'] as num).toInt(),
      offer: (json['offer'] as num).toInt(),
      discover: (json['discover'] as num).toInt(),
      inform: (json['inform'] as num).toInt(),
      request: (json['request'] as num).toInt(),
      release: (json['release'] as num).toInt(),
      noanswer: (json['noanswer'] as num).toInt(),
      bootp: (json['bootp'] as num).toInt(),
      pxe: (json['pxe'] as num).toInt(),
      leases: DhcpLeases.fromJson(json['leases'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DhcpMetricsToJson(_DhcpMetrics instance) =>
    <String, dynamic>{
      'ack': instance.ack,
      'nak': instance.nak,
      'decline': instance.decline,
      'offer': instance.offer,
      'discover': instance.discover,
      'inform': instance.inform,
      'request': instance.request,
      'release': instance.release,
      'noanswer': instance.noanswer,
      'bootp': instance.bootp,
      'pxe': instance.pxe,
      'leases': instance.leases,
    };

_DhcpLeases _$DhcpLeasesFromJson(Map<String, dynamic> json) => _DhcpLeases(
      allocated4: (json['allocated_4'] as num).toInt(),
      pruned4: (json['pruned_4'] as num).toInt(),
      allocated6: (json['allocated_6'] as num).toInt(),
      pruned6: (json['pruned_6'] as num).toInt(),
    );

Map<String, dynamic> _$DhcpLeasesToJson(_DhcpLeases instance) =>
    <String, dynamic>{
      'allocated_4': instance.allocated4,
      'pruned_4': instance.pruned4,
      'allocated_6': instance.allocated6,
      'pruned_6': instance.pruned6,
    };
