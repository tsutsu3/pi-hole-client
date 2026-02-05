// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sensors200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetSensors200ResponseCWProxy {
  GetSensors200Response sensors(SensorsSensors? sensors);

  GetSensors200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetSensors200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetSensors200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetSensors200Response call({SensorsSensors? sensors, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetSensors200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetSensors200Response.copyWith.fieldName(...)`
class _$GetSensors200ResponseCWProxyImpl
    implements _$GetSensors200ResponseCWProxy {
  const _$GetSensors200ResponseCWProxyImpl(this._value);

  final GetSensors200Response _value;

  @override
  GetSensors200Response sensors(SensorsSensors? sensors) =>
      this(sensors: sensors);

  @override
  GetSensors200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetSensors200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetSensors200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetSensors200Response call({
    Object? sensors = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetSensors200Response(
      sensors: sensors == const $CopyWithPlaceholder()
          ? _value.sensors
          // ignore: cast_nullable_to_non_nullable
          : sensors as SensorsSensors?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetSensors200ResponseCopyWith on GetSensors200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetSensors200Response.copyWith(...)` or like so:`instanceOfGetSensors200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetSensors200ResponseCWProxy get copyWith =>
      _$GetSensors200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSensors200Response _$GetSensors200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetSensors200Response', json, ($checkedConvert) {
  final val = GetSensors200Response(
    sensors: $checkedConvert(
      'sensors',
      (v) =>
          v == null ? null : SensorsSensors.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetSensors200ResponseToJson(
  GetSensors200Response instance,
) => <String, dynamic>{
  'sensors': ?instance.sensors?.toJson(),
  'took': ?instance.took,
};
