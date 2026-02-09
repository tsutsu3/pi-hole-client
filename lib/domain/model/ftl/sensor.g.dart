// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtlSensor _$FtlSensorFromJson(Map<String, dynamic> json) => _FtlSensor(
  hotLimit: (json['hotLimit'] as num).toDouble(),
  unit: $enumDecode(_$TemperatureUnitEnumMap, json['unit']),
  cpuTemp: (json['cpuTemp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FtlSensorToJson(_FtlSensor instance) =>
    <String, dynamic>{
      'hotLimit': instance.hotLimit,
      'unit': _$TemperatureUnitEnumMap[instance.unit]!,
      'cpuTemp': instance.cpuTemp,
    };

const _$TemperatureUnitEnumMap = {
  TemperatureUnit.celsius: 'celsius',
  TemperatureUnit.fahrenheit: 'fahrenheit',
  TemperatureUnit.kelvin: 'kelvin',
  TemperatureUnit.unknown: 'unknown',
};
