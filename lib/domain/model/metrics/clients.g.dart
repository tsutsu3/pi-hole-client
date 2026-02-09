// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Clients _$ClientsFromJson(Map<String, dynamic> json) => _Clients(
  clients: (json['clients'] as List<dynamic>)
      .map((e) => Client.fromJson(e as Map<String, dynamic>))
      .toList(),
  clientEntries: (json['clientEntries'] as List<dynamic>)
      .map((e) => ClientOverTimeEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ClientsToJson(_Clients instance) => <String, dynamic>{
  'clients': instance.clients.map((e) => e.toJson()).toList(),
  'clientEntries': instance.clientEntries.map((e) => e.toJson()).toList(),
};

_Client _$ClientFromJson(Map<String, dynamic> json) => _Client(
  ip: json['ip'] as String,
  name: json['name'] as String?,
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
  'ip': instance.ip,
  'name': instance.name,
  'total': instance.total,
};

_ClientOverTimeEntry _$ClientOverTimeEntryFromJson(Map<String, dynamic> json) =>
    _ClientOverTimeEntry(
      time: DateTime.parse(json['time'] as String),
      values: (json['values'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ClientOverTimeEntryToJson(
  _ClientOverTimeEntry instance,
) => <String, dynamic>{
  'time': instance.time.toIso8601String(),
  'values': instance.values,
};
