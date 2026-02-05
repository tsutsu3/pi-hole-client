// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensors_sensors.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SensorsSensorsCWProxy {
  SensorsSensors list(List<SensorsSensorsListInner>? list);

  SensorsSensors cpuTemp(num? cpuTemp);

  SensorsSensors hotLimit(num? hotLimit);

  SensorsSensors unit(String? unit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SensorsSensors(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SensorsSensors(...).copyWith(id: 12, name: "My name")
  /// ````
  SensorsSensors call({
    List<SensorsSensorsListInner>? list,
    num? cpuTemp,
    num? hotLimit,
    String? unit,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSensorsSensors.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSensorsSensors.copyWith.fieldName(...)`
class _$SensorsSensorsCWProxyImpl implements _$SensorsSensorsCWProxy {
  const _$SensorsSensorsCWProxyImpl(this._value);

  final SensorsSensors _value;

  @override
  SensorsSensors list(List<SensorsSensorsListInner>? list) => this(list: list);

  @override
  SensorsSensors cpuTemp(num? cpuTemp) => this(cpuTemp: cpuTemp);

  @override
  SensorsSensors hotLimit(num? hotLimit) => this(hotLimit: hotLimit);

  @override
  SensorsSensors unit(String? unit) => this(unit: unit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SensorsSensors(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SensorsSensors(...).copyWith(id: 12, name: "My name")
  /// ````
  SensorsSensors call({
    Object? list = const $CopyWithPlaceholder(),
    Object? cpuTemp = const $CopyWithPlaceholder(),
    Object? hotLimit = const $CopyWithPlaceholder(),
    Object? unit = const $CopyWithPlaceholder(),
  }) {
    return SensorsSensors(
      list: list == const $CopyWithPlaceholder()
          ? _value.list
          // ignore: cast_nullable_to_non_nullable
          : list as List<SensorsSensorsListInner>?,
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

extension $SensorsSensorsCopyWith on SensorsSensors {
  /// Returns a callable class that can be used as follows: `instanceOfSensorsSensors.copyWith(...)` or like so:`instanceOfSensorsSensors.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SensorsSensorsCWProxy get copyWith => _$SensorsSensorsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorsSensors _$SensorsSensorsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SensorsSensors',
      json,
      ($checkedConvert) {
        final val = SensorsSensors(
          list: $checkedConvert(
            'list',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => SensorsSensorsListInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
          cpuTemp: $checkedConvert('cpu_temp', (v) => v as num?),
          hotLimit: $checkedConvert('hot_limit', (v) => v as num?),
          unit: $checkedConvert('unit', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'cpuTemp': 'cpu_temp', 'hotLimit': 'hot_limit'},
    );

Map<String, dynamic> _$SensorsSensorsToJson(SensorsSensors instance) =>
    <String, dynamic>{
      'list': ?instance.list?.map((e) => e.toJson()).toList(),
      'cpu_temp': ?instance.cpuTemp,
      'hot_limit': ?instance.hotLimit,
      'unit': ?instance.unit,
    };
