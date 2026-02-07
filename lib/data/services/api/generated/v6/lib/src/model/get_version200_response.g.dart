// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_version200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetVersion200ResponseCWProxy {
  GetVersion200Response version(VersionVersion? version);

  GetVersion200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetVersion200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetVersion200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetVersion200Response call({VersionVersion? version, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetVersion200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetVersion200Response.copyWith.fieldName(...)`
class _$GetVersion200ResponseCWProxyImpl
    implements _$GetVersion200ResponseCWProxy {
  const _$GetVersion200ResponseCWProxyImpl(this._value);

  final GetVersion200Response _value;

  @override
  GetVersion200Response version(VersionVersion? version) =>
      this(version: version);

  @override
  GetVersion200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetVersion200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetVersion200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetVersion200Response call({
    Object? version = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetVersion200Response(
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as VersionVersion?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetVersion200ResponseCopyWith on GetVersion200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetVersion200Response.copyWith(...)` or like so:`instanceOfGetVersion200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetVersion200ResponseCWProxy get copyWith =>
      _$GetVersion200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVersion200Response _$GetVersion200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetVersion200Response', json, ($checkedConvert) {
  final val = GetVersion200Response(
    version: $checkedConvert(
      'version',
      (v) =>
          v == null ? null : VersionVersion.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetVersion200ResponseToJson(
  GetVersion200Response instance,
) => <String, dynamic>{
  'version': ?instance.version?.toJson(),
  'took': ?instance.took,
};
