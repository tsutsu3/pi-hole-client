// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Clients _$ClientsFromJson(Map<String, dynamic> json) => _Clients(
  clients: (json['clients'] as List<dynamic>)
      .map((e) => Client.fromJson(e as Map<String, dynamic>))
      .toList(),
  overTime: (json['overTime'] as List<dynamic>)
      .map((e) => ClientOverTimeEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ClientsToJson(_Clients instance) => <String, dynamic>{
  'clients': instance.clients.map((e) => e.toJson()).toList(),
  'overTime': instance.overTime.map((e) => e.toJson()).toList(),
};

_Client _$ClientFromJson(Map<String, dynamic> json) =>
    _Client(name: json['name'] as String, ip: json['ip'] as String);

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
  'name': instance.name,
  'ip': instance.ip,
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
