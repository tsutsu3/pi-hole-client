// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ftlinfo200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetFtlinfo200ResponseCWProxy {
  GetFtlinfo200Response ftl(FtlFtl? ftl);

  GetFtlinfo200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetFtlinfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetFtlinfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetFtlinfo200Response call({FtlFtl? ftl, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetFtlinfo200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetFtlinfo200Response.copyWith.fieldName(...)`
class _$GetFtlinfo200ResponseCWProxyImpl
    implements _$GetFtlinfo200ResponseCWProxy {
  const _$GetFtlinfo200ResponseCWProxyImpl(this._value);

  final GetFtlinfo200Response _value;

  @override
  GetFtlinfo200Response ftl(FtlFtl? ftl) => this(ftl: ftl);

  @override
  GetFtlinfo200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetFtlinfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetFtlinfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetFtlinfo200Response call({
    Object? ftl = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetFtlinfo200Response(
      ftl: ftl == const $CopyWithPlaceholder()
          ? _value.ftl
          // ignore: cast_nullable_to_non_nullable
          : ftl as FtlFtl?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetFtlinfo200ResponseCopyWith on GetFtlinfo200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetFtlinfo200Response.copyWith(...)` or like so:`instanceOfGetFtlinfo200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetFtlinfo200ResponseCWProxy get copyWith =>
      _$GetFtlinfo200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFtlinfo200Response _$GetFtlinfo200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetFtlinfo200Response', json, ($checkedConvert) {
  final val = GetFtlinfo200Response(
    ftl: $checkedConvert(
      'ftl',
      (v) => v == null ? null : FtlFtl.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetFtlinfo200ResponseToJson(
  GetFtlinfo200Response instance,
) => <String, dynamic>{'ftl': ?instance.ftl?.toJson(), 'took': ?instance.took};
