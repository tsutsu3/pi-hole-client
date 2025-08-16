// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoSensor _$InfoSensorFromJson(Map<String, dynamic> json) => _InfoSensor(
  hotLimit: (json['hotLimit'] as num).toDouble(),
  unit: json['unit'] as String,
  cpuTemp: (json['cpuTemp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$InfoSensorToJson(_InfoSensor instance) =>
    <String, dynamic>{
      'hotLimit': instance.hotLimit,
      'unit': instance.unit,
      'cpuTemp': instance.cpuTemp,
    };
