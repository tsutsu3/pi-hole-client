// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_clients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopClients _$TopClientsFromJson(Map<String, dynamic> json) => _TopClients(
  topSources: (json['topSources'] as List<dynamic>)
      .map((e) => SourceStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  topSourcesBlocked: (json['topSourcesBlocked'] as List<dynamic>)
      .map((e) => SourceStat.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalQueries: (json['totalQueries'] as num?)?.toInt(),
  blockedQueries: (json['blockedQueries'] as num?)?.toInt(),
);

Map<String, dynamic> _$TopClientsToJson(_TopClients instance) =>
    <String, dynamic>{
      'topSources': instance.topSources.map((e) => e.toJson()).toList(),
      'topSourcesBlocked': instance.topSourcesBlocked
          .map((e) => e.toJson())
          .toList(),
      'totalQueries': instance.totalQueries,
      'blockedQueries': instance.blockedQueries,
    };

_SourceStat _$SourceStatFromJson(Map<String, dynamic> json) => _SourceStat(
  source: json['source'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$SourceStatToJson(_SourceStat instance) =>
    <String, dynamic>{'source': instance.source, 'count': instance.count};
