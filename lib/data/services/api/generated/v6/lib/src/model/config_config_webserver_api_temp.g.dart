// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_webserver_api_temp.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigWebserverApiTempCWProxy {
  ConfigConfigWebserverApiTemp limit(num? limit);

  ConfigConfigWebserverApiTemp unit(String? unit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverApiTemp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverApiTemp(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverApiTemp call({num? limit, String? unit});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigWebserverApiTemp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigWebserverApiTemp.copyWith.fieldName(...)`
class _$ConfigConfigWebserverApiTempCWProxyImpl
    implements _$ConfigConfigWebserverApiTempCWProxy {
  const _$ConfigConfigWebserverApiTempCWProxyImpl(this._value);

  final ConfigConfigWebserverApiTemp _value;

  @override
  ConfigConfigWebserverApiTemp limit(num? limit) => this(limit: limit);

  @override
  ConfigConfigWebserverApiTemp unit(String? unit) => this(unit: unit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverApiTemp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverApiTemp(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverApiTemp call({
    Object? limit = const $CopyWithPlaceholder(),
    Object? unit = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigWebserverApiTemp(
      limit: limit == const $CopyWithPlaceholder()
          ? _value.limit
          // ignore: cast_nullable_to_non_nullable
          : limit as num?,
      unit: unit == const $CopyWithPlaceholder()
          ? _value.unit
          // ignore: cast_nullable_to_non_nullable
          : unit as String?,
    );
  }
}

extension $ConfigConfigWebserverApiTempCopyWith
    on ConfigConfigWebserverApiTemp {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigWebserverApiTemp.copyWith(...)` or like so:`instanceOfConfigConfigWebserverApiTemp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigWebserverApiTempCWProxy get copyWith =>
      _$ConfigConfigWebserverApiTempCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigWebserverApiTemp _$ConfigConfigWebserverApiTempFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigWebserverApiTemp', json, ($checkedConvert) {
  final val = ConfigConfigWebserverApiTemp(
    limit: $checkedConvert('limit', (v) => v as num?),
    unit: $checkedConvert('unit', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigWebserverApiTempToJson(
  ConfigConfigWebserverApiTemp instance,
) => <String, dynamic>{'limit': ?instance.limit, 'unit': ?instance.unit};
