// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoSensors _$InfoSensorsFromJson(Map<String, dynamic> json) => _InfoSensors(
      sensors: SensorsData.fromJson(json['sensors'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$InfoSensorsToJson(_InfoSensors instance) =>
    <String, dynamic>{
      'sensors': instance.sensors.toJson(),
      'took': instance.took,
    };

_SensorsData _$SensorsDataFromJson(Map<String, dynamic> json) => _SensorsData(
      list: (json['list'] as List<dynamic>)
          .map((e) => SensorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      cpuTemp: (json['cpu_temp'] as num?)?.toDouble(),
      hotLimit: (json['hot_limit'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$SensorsDataToJson(_SensorsData instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'cpu_temp': instance.cpuTemp,
      'hot_limit': instance.hotLimit,
      'unit': instance.unit,
    };

_SensorData _$SensorDataFromJson(Map<String, dynamic> json) => _SensorData(
      name: json['name'] as String?,
      path: json['path'] as String,
      source: json['source'] as String,
      temps: (json['temps'] as List<dynamic>)
          .map((e) => TempData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SensorDataToJson(_SensorData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'source': instance.source,
      'temps': instance.temps.map((e) => e.toJson()).toList(),
    };

_TempData _$TempDataFromJson(Map<String, dynamic> json) => _TempData(
      name: json['name'] as String?,
      value: json['value'] as num,
      max: json['max'] as num?,
      crit: json['crit'] as num?,
      sensor: json['sensor'] as String,
    );

Map<String, dynamic> _$TempDataToJson(_TempData instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'max': instance.max,
      'crit': instance.crit,
      'sensor': instance.sensor,
    };
