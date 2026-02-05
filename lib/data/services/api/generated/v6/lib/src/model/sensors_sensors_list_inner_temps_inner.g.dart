// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensors_sensors_list_inner_temps_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SensorsSensorsListInnerTempsInnerCWProxy {
  SensorsSensorsListInnerTempsInner name(String? name);

  SensorsSensorsListInnerTempsInner value(num? value);

  SensorsSensorsListInnerTempsInner max(num? max);

  SensorsSensorsListInnerTempsInner crit(num? crit);

  SensorsSensorsListInnerTempsInner sensor(String? sensor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SensorsSensorsListInnerTempsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SensorsSensorsListInnerTempsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SensorsSensorsListInnerTempsInner call({
    String? name,
    num? value,
    num? max,
    num? crit,
    String? sensor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSensorsSensorsListInnerTempsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSensorsSensorsListInnerTempsInner.copyWith.fieldName(...)`
class _$SensorsSensorsListInnerTempsInnerCWProxyImpl
    implements _$SensorsSensorsListInnerTempsInnerCWProxy {
  const _$SensorsSensorsListInnerTempsInnerCWProxyImpl(this._value);

  final SensorsSensorsListInnerTempsInner _value;

  @override
  SensorsSensorsListInnerTempsInner name(String? name) => this(name: name);

  @override
  SensorsSensorsListInnerTempsInner value(num? value) => this(value: value);

  @override
  SensorsSensorsListInnerTempsInner max(num? max) => this(max: max);

  @override
  SensorsSensorsListInnerTempsInner crit(num? crit) => this(crit: crit);

  @override
  SensorsSensorsListInnerTempsInner sensor(String? sensor) =>
      this(sensor: sensor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SensorsSensorsListInnerTempsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SensorsSensorsListInnerTempsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SensorsSensorsListInnerTempsInner call({
    Object? name = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? max = const $CopyWithPlaceholder(),
    Object? crit = const $CopyWithPlaceholder(),
    Object? sensor = const $CopyWithPlaceholder(),
  }) {
    return SensorsSensorsListInnerTempsInner(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as num?,
      max: max == const $CopyWithPlaceholder()
          ? _value.max
          // ignore: cast_nullable_to_non_nullable
          : max as num?,
      crit: crit == const $CopyWithPlaceholder()
          ? _value.crit
          // ignore: cast_nullable_to_non_nullable
          : crit as num?,
      sensor: sensor == const $CopyWithPlaceholder()
          ? _value.sensor
          // ignore: cast_nullable_to_non_nullable
          : sensor as String?,
    );
  }
}

extension $SensorsSensorsListInnerTempsInnerCopyWith
    on SensorsSensorsListInnerTempsInner {
  /// Returns a callable class that can be used as follows: `instanceOfSensorsSensorsListInnerTempsInner.copyWith(...)` or like so:`instanceOfSensorsSensorsListInnerTempsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SensorsSensorsListInnerTempsInnerCWProxy get copyWith =>
      _$SensorsSensorsListInnerTempsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorsSensorsListInnerTempsInner _$SensorsSensorsListInnerTempsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SensorsSensorsListInnerTempsInner', json, (
  $checkedConvert,
) {
  final val = SensorsSensorsListInnerTempsInner(
    name: $checkedConvert('name', (v) => v as String?),
    value: $checkedConvert('value', (v) => v as num?),
    max: $checkedConvert('max', (v) => v as num?),
    crit: $checkedConvert('crit', (v) => v as num?),
    sensor: $checkedConvert('sensor', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SensorsSensorsListInnerTempsInnerToJson(
  SensorsSensorsListInnerTempsInner instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'value': ?instance.value,
  'max': ?instance.max,
  'crit': ?instance.crit,
  'sensor': ?instance.sensor,
};
