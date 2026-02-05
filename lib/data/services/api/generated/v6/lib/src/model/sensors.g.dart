// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensors.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SensorsCWProxy {
  Sensors sensors(SensorsSensors? sensors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Sensors(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Sensors(...).copyWith(id: 12, name: "My name")
  /// ````
  Sensors call({SensorsSensors? sensors});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSensors.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSensors.copyWith.fieldName(...)`
class _$SensorsCWProxyImpl implements _$SensorsCWProxy {
  const _$SensorsCWProxyImpl(this._value);

  final Sensors _value;

  @override
  Sensors sensors(SensorsSensors? sensors) => this(sensors: sensors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Sensors(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Sensors(...).copyWith(id: 12, name: "My name")
  /// ````
  Sensors call({Object? sensors = const $CopyWithPlaceholder()}) {
    return Sensors(
      sensors: sensors == const $CopyWithPlaceholder()
          ? _value.sensors
          // ignore: cast_nullable_to_non_nullable
          : sensors as SensorsSensors?,
    );
  }
}

extension $SensorsCopyWith on Sensors {
  /// Returns a callable class that can be used as follows: `instanceOfSensors.copyWith(...)` or like so:`instanceOfSensors.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SensorsCWProxy get copyWith => _$SensorsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sensors _$SensorsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Sensors', json, ($checkedConvert) {
      final val = Sensors(
        sensors: $checkedConvert(
          'sensors',
          (v) => v == null
              ? null
              : SensorsSensors.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SensorsToJson(Sensors instance) => <String, dynamic>{
  'sensors': ?instance.sensors?.toJson(),
};
