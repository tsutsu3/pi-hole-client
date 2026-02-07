// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensors_sensors_list_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SensorsSensorsListInnerCWProxy {
  SensorsSensorsListInner name(String? name);

  SensorsSensorsListInner path(String? path);

  SensorsSensorsListInner source_(String? source_);

  SensorsSensorsListInner temps(List<SensorsSensorsListInnerTempsInner>? temps);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SensorsSensorsListInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SensorsSensorsListInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SensorsSensorsListInner call({
    String? name,
    String? path,
    String? source_,
    List<SensorsSensorsListInnerTempsInner>? temps,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSensorsSensorsListInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSensorsSensorsListInner.copyWith.fieldName(...)`
class _$SensorsSensorsListInnerCWProxyImpl
    implements _$SensorsSensorsListInnerCWProxy {
  const _$SensorsSensorsListInnerCWProxyImpl(this._value);

  final SensorsSensorsListInner _value;

  @override
  SensorsSensorsListInner name(String? name) => this(name: name);

  @override
  SensorsSensorsListInner path(String? path) => this(path: path);

  @override
  SensorsSensorsListInner source_(String? source_) => this(source_: source_);

  @override
  SensorsSensorsListInner temps(
    List<SensorsSensorsListInnerTempsInner>? temps,
  ) => this(temps: temps);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SensorsSensorsListInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SensorsSensorsListInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SensorsSensorsListInner call({
    Object? name = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? temps = const $CopyWithPlaceholder(),
  }) {
    return SensorsSensorsListInner(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String?,
      source_: source_ == const $CopyWithPlaceholder()
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as String?,
      temps: temps == const $CopyWithPlaceholder()
          ? _value.temps
          // ignore: cast_nullable_to_non_nullable
          : temps as List<SensorsSensorsListInnerTempsInner>?,
    );
  }
}

extension $SensorsSensorsListInnerCopyWith on SensorsSensorsListInner {
  /// Returns a callable class that can be used as follows: `instanceOfSensorsSensorsListInner.copyWith(...)` or like so:`instanceOfSensorsSensorsListInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SensorsSensorsListInnerCWProxy get copyWith =>
      _$SensorsSensorsListInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SensorsSensorsListInner _$SensorsSensorsListInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SensorsSensorsListInner', json, ($checkedConvert) {
  final val = SensorsSensorsListInner(
    name: $checkedConvert('name', (v) => v as String?),
    path: $checkedConvert('path', (v) => v as String?),
    source_: $checkedConvert('source', (v) => v as String?),
    temps: $checkedConvert(
      'temps',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SensorsSensorsListInnerTempsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'source_': 'source'});

Map<String, dynamic> _$SensorsSensorsListInnerToJson(
  SensorsSensorsListInner instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'path': ?instance.path,
  'source': ?instance.source_,
  'temps': ?instance.temps?.map((e) => e.toJson()).toList(),
};
