// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OverTime _$OverTimeFromJson(Map<String, dynamic> json) => _OverTime(
  domainsOverTime: (json['domainsOverTime'] as List<dynamic>)
      .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  adsOverTime: (json['adsOverTime'] as List<dynamic>)
      .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  clients: (json['clients'] as List<dynamic>)
      .map((e) => Client.fromJson(e as Map<String, dynamic>))
      .toList(),
  clientEntries: (json['clientEntries'] as List<dynamic>)
      .map((e) => ClientOverTimeEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OverTimeToJson(_OverTime instance) => <String, dynamic>{
  'domainsOverTime': instance.domainsOverTime.map((e) => e.toJson()).toList(),
  'adsOverTime': instance.adsOverTime.map((e) => e.toJson()).toList(),
  'clients': instance.clients.map((e) => e.toJson()).toList(),
  'clientEntries': instance.clientEntries.map((e) => e.toJson()).toList(),
};
