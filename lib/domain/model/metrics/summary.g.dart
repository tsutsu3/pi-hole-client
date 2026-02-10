// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Summary _$SummaryFromJson(Map<String, dynamic> json) => _Summary(
  domainsBeingBlocked: (json['domainsBeingBlocked'] as num).toInt(),
  dnsQueriesToday: (json['dnsQueriesToday'] as num).toInt(),
  adsBlockedToday: (json['adsBlockedToday'] as num).toInt(),
  adsPercentageToday: (json['adsPercentageToday'] as num).toDouble(),
  uniqueDomains: (json['uniqueDomains'] as num).toInt(),
  queriesForwarded: (json['queriesForwarded'] as num).toInt(),
  queriesCached: (json['queriesCached'] as num).toInt(),
  clientsEverSeen: (json['clientsEverSeen'] as num).toInt(),
  uniqueClients: (json['uniqueClients'] as num).toInt(),
  dnsQueriesAllTypes: (json['dnsQueriesAllTypes'] as num).toInt(),
  replies: ReplyCounts.fromJson(json['replies'] as Map<String, dynamic>),
  queryTypes: (json['queryTypes'] as List<dynamic>)
      .map((e) => QueryTypeStat.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SummaryToJson(_Summary instance) => <String, dynamic>{
  'domainsBeingBlocked': instance.domainsBeingBlocked,
  'dnsQueriesToday': instance.dnsQueriesToday,
  'adsBlockedToday': instance.adsBlockedToday,
  'adsPercentageToday': instance.adsPercentageToday,
  'uniqueDomains': instance.uniqueDomains,
  'queriesForwarded': instance.queriesForwarded,
  'queriesCached': instance.queriesCached,
  'clientsEverSeen': instance.clientsEverSeen,
  'uniqueClients': instance.uniqueClients,
  'dnsQueriesAllTypes': instance.dnsQueriesAllTypes,
  'replies': instance.replies.toJson(),
  'queryTypes': instance.queryTypes.map((e) => e.toJson()).toList(),
};

_ReplyCounts _$ReplyCountsFromJson(Map<String, dynamic> json) => _ReplyCounts(
  unknown: (json['unknown'] as num).toInt(),
  nodata: (json['nodata'] as num).toInt(),
  nxDomain: (json['nxDomain'] as num).toInt(),
  cname: (json['cname'] as num).toInt(),
  ip: (json['ip'] as num).toInt(),
  domain: (json['domain'] as num).toInt(),
  rrname: (json['rrname'] as num).toInt(),
  servfail: (json['servfail'] as num).toInt(),
  refused: (json['refused'] as num).toInt(),
  notimp: (json['notimp'] as num).toInt(),
  other: (json['other'] as num).toInt(),
  dnssec: (json['dnssec'] as num).toInt(),
  none: (json['none'] as num).toInt(),
  blob: (json['blob'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$ReplyCountsToJson(_ReplyCounts instance) =>
    <String, dynamic>{
      'unknown': instance.unknown,
      'nodata': instance.nodata,
      'nxDomain': instance.nxDomain,
      'cname': instance.cname,
      'ip': instance.ip,
      'domain': instance.domain,
      'rrname': instance.rrname,
      'servfail': instance.servfail,
      'refused': instance.refused,
      'notimp': instance.notimp,
      'other': instance.other,
      'dnssec': instance.dnssec,
      'none': instance.none,
      'blob': instance.blob,
      'total': instance.total,
    };

_QueryTypeStat _$QueryTypeStatFromJson(Map<String, dynamic> json) =>
    _QueryTypeStat(
      type: $enumDecode(_$DnsRecordTypeEnumMap, json['type']),
      percentage: (json['percentage'] as num).toDouble(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QueryTypeStatToJson(_QueryTypeStat instance) =>
    <String, dynamic>{
      'type': _$DnsRecordTypeEnumMap[instance.type]!,
      'percentage': instance.percentage,
      'count': instance.count,
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
