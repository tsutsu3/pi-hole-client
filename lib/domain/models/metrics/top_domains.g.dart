// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_domains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueryStat _$QueryStatFromJson(Map<String, dynamic> json) => _QueryStat(
  domain: json['domain'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$QueryStatToJson(_QueryStat instance) =>
    <String, dynamic>{'domain': instance.domain, 'count': instance.count};
