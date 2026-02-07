// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_sensors.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddSensorsCWProxy {
  PaddSensors cpuTemp(num? cpuTemp);

  PaddSensors hotLimit(num? hotLimit);

  PaddSensors unit(String? unit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddSensors(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddSensors(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddSensors call({num? cpuTemp, num? hotLimit, String? unit});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddSensors.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddSensors.copyWith.fieldName(...)`
class _$PaddSensorsCWProxyImpl implements _$PaddSensorsCWProxy {
  const _$PaddSensorsCWProxyImpl(this._value);

  final PaddSensors _value;

  @override
  PaddSensors cpuTemp(num? cpuTemp) => this(cpuTemp: cpuTemp);

  @override
  PaddSensors hotLimit(num? hotLimit) => this(hotLimit: hotLimit);

  @override
  PaddSensors unit(String? unit) => this(unit: unit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddSensors(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddSensors(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddSensors call({
    Object? cpuTemp = const $CopyWithPlaceholder(),
    Object? hotLimit = const $CopyWithPlaceholder(),
    Object? unit = const $CopyWithPlaceholder(),
  }) {
    return PaddSensors(
      cpuTemp: cpuTemp == const $CopyWithPlaceholder()
          ? _value.cpuTemp
          // ignore: cast_nullable_to_non_nullable
          : cpuTemp as num?,
      hotLimit: hotLimit == const $CopyWithPlaceholder()
          ? _value.hotLimit
          // ignore: cast_nullable_to_non_nullable
          : hotLimit as num?,
      unit: unit == const $CopyWithPlaceholder()
          ? _value.unit
          // ignore: cast_nullable_to_non_nullable
          : unit as String?,
    );
  }
}

extension $PaddSensorsCopyWith on PaddSensors {
  /// Returns a callable class that can be used as follows: `instanceOfPaddSensors.copyWith(...)` or like so:`instanceOfPaddSensors.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddSensorsCWProxy get copyWith => _$PaddSensorsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddSensors _$PaddSensorsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PaddSensors',
  json,
  ($checkedConvert) {
    final val = PaddSensors(
      cpuTemp: $checkedConvert('cpu_temp', (v) => v as num?),
      hotLimit: $checkedConvert('hot_limit', (v) => v as num?),
      unit: $checkedConvert('unit', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'cpuTemp': 'cpu_temp', 'hotLimit': 'hot_limit'},
);

Map<String, dynamic> _$PaddSensorsToJson(PaddSensors instance) =>
    <String, dynamic>{
      'cpu_temp': ?instance.cpuTemp,
      'hot_limit': ?instance.hotLimit,
      'unit': ?instance.unit,
    };
