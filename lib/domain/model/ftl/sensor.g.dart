// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtlSensor _$FtlSensorFromJson(Map<String, dynamic> json) => _FtlSensor(
  hotLimit: (json['hotLimit'] as num).toDouble(),
  unit: json['unit'] as String,
  cpuTemp: (json['cpuTemp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FtlSensorToJson(_FtlSensor instance) =>
    <String, dynamic>{
      'hotLimit': instance.hotLimit,
      'unit': instance.unit,
      'cpuTemp': instance.cpuTemp,
    };
