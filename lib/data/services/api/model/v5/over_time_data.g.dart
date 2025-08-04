// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'over_time_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OverTimeData _$OverTimeDataFromJson(Map<String, dynamic> json) =>
    _OverTimeData(
      domainsOverTime: Map<String, int>.from(json['domains_over_time'] as Map),
      adsOverTime: Map<String, int>.from(json['ads_over_time'] as Map),
      clients: (json['clients'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      overTime: const MapListOrEmptyListConverter().fromJson(json['over_time']),
    );

Map<String, dynamic> _$OverTimeDataToJson(
  _OverTimeData instance,
) => <String, dynamic>{
  'domains_over_time': instance.domainsOverTime,
  'ads_over_time': instance.adsOverTime,
  'clients': instance.clients.map((e) => e.toJson()).toList(),
  'over_time': const MapListOrEmptyListConverter().toJson(instance.overTime),
};

_Client _$ClientFromJson(Map<String, dynamic> json) =>
    _Client(name: json['name'] as String, ip: json['ip'] as String);

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
  'name': instance.name,
  'ip': instance.ip,
};
