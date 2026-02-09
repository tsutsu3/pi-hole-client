// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtlDnsMetrics _$FtlDnsMetricsFromJson(Map<String, dynamic> json) =>
    _FtlDnsMetrics(
      cache: DnsCache.fromJson(json['cache'] as Map<String, dynamic>),
      replies: DnsReplies.fromJson(json['replies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FtlDnsMetricsToJson(_FtlDnsMetrics instance) =>
    <String, dynamic>{
      'cache': instance.cache.toJson(),
      'replies': instance.replies.toJson(),
    };

_DnsCache _$DnsCacheFromJson(Map<String, dynamic> json) => _DnsCache(
  size: (json['size'] as num).toInt(),
  records: (json['records'] as num).toInt(),
  inserted: (json['inserted'] as num).toInt(),
  evicted: (json['evicted'] as num).toInt(),
  expired: (json['expired'] as num).toInt(),
  immortal: (json['immortal'] as num).toInt(),
  typePercentages: (json['typePercentages'] as List<dynamic>)
      .map((e) => DnsTypePercentage.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DnsCacheToJson(_DnsCache instance) => <String, dynamic>{
  'size': instance.size,
  'records': instance.records,
  'inserted': instance.inserted,
  'evicted': instance.evicted,
  'expired': instance.expired,
  'immortal': instance.immortal,
  'typePercentages': instance.typePercentages.map((e) => e.toJson()).toList(),
};

_DnsTypePercentage _$DnsTypePercentageFromJson(Map<String, dynamic> json) =>
    _DnsTypePercentage(
      type: $enumDecode(_$DnsRecordTypeEnumMap, json['type']),
      isStale: json['isStale'] as bool,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$DnsTypePercentageToJson(_DnsTypePercentage instance) =>
    <String, dynamic>{
      'type': _$DnsRecordTypeEnumMap[instance.type]!,
      'isStale': instance.isStale,
      'percentage': instance.percentage,
    };

const _$DnsRecordTypeEnumMap = {
  DnsRecordType.none: 'none',
  DnsRecordType.a: 'a',
  DnsRecordType.aaaa: 'aaaa',
  DnsRecordType.any: 'any',
  DnsRecordType.srv: 'srv',
  DnsRecordType.soa: 'soa',
  DnsRecordType.ptr: 'ptr',
  DnsRecordType.txt: 'txt',
  DnsRecordType.naptr: 'naptr',
  DnsRecordType.mx: 'mx',
  DnsRecordType.ds: 'ds',
  DnsRecordType.rrsig: 'rrsig',
  DnsRecordType.dnskey: 'dnskey',
  DnsRecordType.ns: 'ns',
  DnsRecordType.svcb: 'svcb',
  DnsRecordType.https: 'https',
  DnsRecordType.na: 'na',
  DnsRecordType.cname: 'cname',
  DnsRecordType.other: 'other',
  DnsRecordType.empty: 'empty',
  DnsRecordType.unknown: 'unknown',
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
