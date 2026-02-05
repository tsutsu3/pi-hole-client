// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_auth_totp200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetAuthTotp200ResponseCWProxy {
  GetAuthTotp200Response totp(TotpTotp? totp);

  GetAuthTotp200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetAuthTotp200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetAuthTotp200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetAuthTotp200Response call({TotpTotp? totp, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetAuthTotp200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetAuthTotp200Response.copyWith.fieldName(...)`
class _$GetAuthTotp200ResponseCWProxyImpl
    implements _$GetAuthTotp200ResponseCWProxy {
  const _$GetAuthTotp200ResponseCWProxyImpl(this._value);

  final GetAuthTotp200Response _value;

  @override
  GetAuthTotp200Response totp(TotpTotp? totp) => this(totp: totp);

  @override
  GetAuthTotp200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetAuthTotp200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetAuthTotp200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetAuthTotp200Response call({
    Object? totp = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetAuthTotp200Response(
      totp: totp == const $CopyWithPlaceholder()
          ? _value.totp
          // ignore: cast_nullable_to_non_nullable
          : totp as TotpTotp?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetAuthTotp200ResponseCopyWith on GetAuthTotp200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetAuthTotp200Response.copyWith(...)` or like so:`instanceOfGetAuthTotp200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetAuthTotp200ResponseCWProxy get copyWith =>
      _$GetAuthTotp200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAuthTotp200Response _$GetAuthTotp200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetAuthTotp200Response', json, ($checkedConvert) {
  final val = GetAuthTotp200Response(
    totp: $checkedConvert(
      'totp',
      (v) => v == null ? null : TotpTotp.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetAuthTotp200ResponseToJson(
  GetAuthTotp200Response instance,
) => <String, dynamic>{
  'totp': ?instance.totp?.toJson(),
  'took': ?instance.took,
};
