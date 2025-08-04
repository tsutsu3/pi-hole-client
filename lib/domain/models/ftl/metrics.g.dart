// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoDnsMetrics _$InfoDnsMetricsFromJson(Map<String, dynamic> json) =>
    _InfoDnsMetrics(
      cache: DnsCache.fromJson(json['cache'] as Map<String, dynamic>),
      replies: DnsReplies.fromJson(json['replies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoDnsMetricsToJson(_InfoDnsMetrics instance) =>
    <String, dynamic>{
      'cache': instance.cache.toJson(),
      'replies': instance.replies.toJson(),
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
  'content': instance.content.map((e) => e.toJson()).toList(),
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
      'count': instance.count.toJson(),
    };

_DnsCacheCount _$DnsCacheCountFromJson(Map<String, dynamic> json) =>
    _DnsCacheCount(
      valid: (json['valid'] as num).toInt(),
      stale: (json['stale'] as num).toInt(),
    );

Map<String, dynamic> _$DnsCacheCountToJson(_DnsCacheCount instance) =>
    <String, dynamic>{'valid': instance.valid, 'stale': instance.stale};

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
