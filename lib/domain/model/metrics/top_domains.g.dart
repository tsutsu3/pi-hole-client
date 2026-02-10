// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_domains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopDomains _$TopDomainsFromJson(Map<String, dynamic> json) => _TopDomains(
  topQueries: (json['topQueries'] as List<dynamic>)
      .map((e) => QueryStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  topAds: (json['topAds'] as List<dynamic>)
      .map((e) => QueryStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalQueries: (json['totalQueries'] as num?)?.toInt(),
  blockedQueries: (json['blockedQueries'] as num?)?.toInt(),
);

Map<String, dynamic> _$TopDomainsToJson(_TopDomains instance) =>
    <String, dynamic>{
      'topQueries': instance.topQueries.map((e) => e.toJson()).toList(),
      'topAds': instance.topAds.map((e) => e.toJson()).toList(),
      'totalQueries': instance.totalQueries,
      'blockedQueries': instance.blockedQueries,
    };

_QueryStat _$QueryStatFromJson(Map<String, dynamic> json) => _QueryStat(
  domain: json['domain'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$QueryStatToJson(_QueryStat instance) =>
    <String, dynamic>{'domain': instance.domain, 'count': instance.count};
