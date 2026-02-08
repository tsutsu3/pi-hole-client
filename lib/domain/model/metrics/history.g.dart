// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_History _$HistoryFromJson(Map<String, dynamic> json) => _History(
  domainsOverTime: (json['domainsOverTime'] as List<dynamic>)
      .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  adsOverTime: (json['adsOverTime'] as List<dynamic>)
      .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HistoryToJson(_History instance) => <String, dynamic>{
  'domainsOverTime': instance.domainsOverTime,
  'adsOverTime': instance.adsOverTime,
};

_HistoryEntry _$HistoryEntryFromJson(Map<String, dynamic> json) =>
    _HistoryEntry(
      timestamp: DateTime.parse(json['timestamp'] as String),
      count: (json['count'] as num).toInt(),
      blocked: (json['blocked'] as num?)?.toInt(),
      cached: (json['cached'] as num?)?.toInt(),
      forwarded: (json['forwarded'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HistoryEntryToJson(_HistoryEntry instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'count': instance.count,
      'blocked': instance.blocked,
      'cached': instance.cached,
      'forwarded': instance.forwarded,
    };
