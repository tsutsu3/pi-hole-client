// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_History _$HistoryFromJson(Map<String, dynamic> json) => _History(
  history: (json['history'] as List<dynamic>)
      .map((e) => HistoryData.fromJson(e as Map<String, dynamic>))
      .toList(),
  took: (json['took'] as num).toDouble(),
);

Map<String, dynamic> _$HistoryToJson(_History instance) => <String, dynamic>{
  'history': instance.history.map((e) => e.toJson()).toList(),
  'took': instance.took,
};

_HistoryData _$HistoryDataFromJson(Map<String, dynamic> json) => _HistoryData(
  timestamp: (json['timestamp'] as num).toDouble(),
  total: (json['total'] as num).toInt(),
  cached: (json['cached'] as num).toInt(),
  blocked: (json['blocked'] as num).toInt(),
  forwarded: (json['forwarded'] as num).toInt(),
);

Map<String, dynamic> _$HistoryDataToJson(_HistoryData instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'total': instance.total,
      'cached': instance.cached,
      'blocked': instance.blocked,
      'forwarded': instance.forwarded,
    };

_HistoryClients _$HistoryClientsFromJson(Map<String, dynamic> json) =>
    _HistoryClients(
      clients: (json['clients'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Client.fromJson(e as Map<String, dynamic>)),
      ),
      history: (json['history'] as List<dynamic>)
          .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$HistoryClientsToJson(_HistoryClients instance) =>
    <String, dynamic>{
      'clients': instance.clients.map((k, e) => MapEntry(k, e.toJson())),
      'history': instance.history.map((e) => e.toJson()).toList(),
      'took': instance.took,
    };

_Client _$ClientFromJson(Map<String, dynamic> json) => _Client(
  name: json['name'] as String?,
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
  'name': instance.name,
  'total': instance.total,
};

_HistoryEntry _$HistoryEntryFromJson(Map<String, dynamic> json) =>
    _HistoryEntry(
      timestamp: (json['timestamp'] as num).toDouble(),
      data: Map<String, int>.from(json['data'] as Map),
    );

Map<String, dynamic> _$HistoryEntryToJson(_HistoryEntry instance) =>
    <String, dynamic>{'timestamp': instance.timestamp, 'data': instance.data};
