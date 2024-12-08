// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryImpl _$$HistoryImplFromJson(Map<String, dynamic> json) =>
    _$HistoryImpl(
      history: (json['history'] as List<dynamic>)
          .map((e) => HistoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$HistoryImplToJson(_$HistoryImpl instance) =>
    <String, dynamic>{
      'history': instance.history,
      'took': instance.took,
    };

_$HistoryDataImpl _$$HistoryDataImplFromJson(Map<String, dynamic> json) =>
    _$HistoryDataImpl(
      timestamp: (json['timestamp'] as num).toDouble(),
      total: (json['total'] as num).toInt(),
      cached: (json['cached'] as num).toInt(),
      blocked: (json['blocked'] as num).toInt(),
      forwarded: (json['forwarded'] as num).toInt(),
    );

Map<String, dynamic> _$$HistoryDataImplToJson(_$HistoryDataImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'total': instance.total,
      'cached': instance.cached,
      'blocked': instance.blocked,
      'forwarded': instance.forwarded,
    };

_$HistoryClientsImpl _$$HistoryClientsImplFromJson(Map<String, dynamic> json) =>
    _$HistoryClientsImpl(
      clients: (json['clients'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Client.fromJson(e as Map<String, dynamic>)),
      ),
      history: (json['history'] as List<dynamic>)
          .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$HistoryClientsImplToJson(
        _$HistoryClientsImpl instance) =>
    <String, dynamic>{
      'clients': instance.clients,
      'history': instance.history,
      'took': instance.took,
    };

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      name: json['name'] as String?,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'total': instance.total,
    };

_$HistoryEntryImpl _$$HistoryEntryImplFromJson(Map<String, dynamic> json) =>
    _$HistoryEntryImpl(
      timestamp: (json['timestamp'] as num).toDouble(),
      data: Map<String, int>.from(json['data'] as Map),
    );

Map<String, dynamic> _$$HistoryEntryImplToJson(_$HistoryEntryImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'data': instance.data,
    };
