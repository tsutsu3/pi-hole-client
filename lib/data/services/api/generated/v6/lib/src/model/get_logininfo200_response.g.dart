// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_logininfo200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetLogininfo200ResponseCWProxy {
  GetLogininfo200Response httpsPort(int? httpsPort);

  GetLogininfo200Response dns(bool? dns);

  GetLogininfo200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetLogininfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetLogininfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetLogininfo200Response call({int? httpsPort, bool? dns, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetLogininfo200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetLogininfo200Response.copyWith.fieldName(...)`
class _$GetLogininfo200ResponseCWProxyImpl
    implements _$GetLogininfo200ResponseCWProxy {
  const _$GetLogininfo200ResponseCWProxyImpl(this._value);

  final GetLogininfo200Response _value;

  @override
  GetLogininfo200Response httpsPort(int? httpsPort) =>
      this(httpsPort: httpsPort);

  @override
  GetLogininfo200Response dns(bool? dns) => this(dns: dns);

  @override
  GetLogininfo200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetLogininfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetLogininfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetLogininfo200Response call({
    Object? httpsPort = const $CopyWithPlaceholder(),
    Object? dns = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetLogininfo200Response(
      httpsPort: httpsPort == const $CopyWithPlaceholder()
          ? _value.httpsPort
          // ignore: cast_nullable_to_non_nullable
          : httpsPort as int?,
      dns: dns == const $CopyWithPlaceholder()
          ? _value.dns
          // ignore: cast_nullable_to_non_nullable
          : dns as bool?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetLogininfo200ResponseCopyWith on GetLogininfo200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetLogininfo200Response.copyWith(...)` or like so:`instanceOfGetLogininfo200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetLogininfo200ResponseCWProxy get copyWith =>
      _$GetLogininfo200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLogininfo200Response _$GetLogininfo200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetLogininfo200Response', json, ($checkedConvert) {
  final val = GetLogininfo200Response(
    httpsPort: $checkedConvert('https_port', (v) => (v as num?)?.toInt()),
    dns: $checkedConvert('dns', (v) => v as bool?),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
}, fieldKeyMap: const {'httpsPort': 'https_port'});

Map<String, dynamic> _$GetLogininfo200ResponseToJson(
  GetLogininfo200Response instance,
) => <String, dynamic>{
  'https_port': ?instance.httpsPort,
  'dns': ?instance.dns,
  'took': ?instance.took,
};
