// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_systeminfo200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetSysteminfo200ResponseCWProxy {
  GetSysteminfo200Response system(SystemSystem? system);

  GetSysteminfo200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetSysteminfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetSysteminfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetSysteminfo200Response call({SystemSystem? system, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetSysteminfo200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetSysteminfo200Response.copyWith.fieldName(...)`
class _$GetSysteminfo200ResponseCWProxyImpl
    implements _$GetSysteminfo200ResponseCWProxy {
  const _$GetSysteminfo200ResponseCWProxyImpl(this._value);

  final GetSysteminfo200Response _value;

  @override
  GetSysteminfo200Response system(SystemSystem? system) => this(system: system);

  @override
  GetSysteminfo200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetSysteminfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetSysteminfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetSysteminfo200Response call({
    Object? system = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetSysteminfo200Response(
      system: system == const $CopyWithPlaceholder()
          ? _value.system
          // ignore: cast_nullable_to_non_nullable
          : system as SystemSystem?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetSysteminfo200ResponseCopyWith on GetSysteminfo200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetSysteminfo200Response.copyWith(...)` or like so:`instanceOfGetSysteminfo200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetSysteminfo200ResponseCWProxy get copyWith =>
      _$GetSysteminfo200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSysteminfo200Response _$GetSysteminfo200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetSysteminfo200Response', json, ($checkedConvert) {
  final val = GetSysteminfo200Response(
    system: $checkedConvert(
      'system',
      (v) =>
          v == null ? null : SystemSystem.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetSysteminfo200ResponseToJson(
  GetSysteminfo200Response instance,
) => <String, dynamic>{
  'system': ?instance.system?.toJson(),
  'took': ?instance.took,
};
