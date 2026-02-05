// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_client200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetClient200ResponseCWProxy {
  GetClient200Response remoteAddr(String? remoteAddr);

  GetClient200Response httpVersion(String? httpVersion);

  GetClient200Response method(String? method);

  GetClient200Response headers(List<HeadersHeadersInner>? headers);

  GetClient200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetClient200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetClient200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetClient200Response call({
    String? remoteAddr,
    String? httpVersion,
    String? method,
    List<HeadersHeadersInner>? headers,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetClient200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetClient200Response.copyWith.fieldName(...)`
class _$GetClient200ResponseCWProxyImpl
    implements _$GetClient200ResponseCWProxy {
  const _$GetClient200ResponseCWProxyImpl(this._value);

  final GetClient200Response _value;

  @override
  GetClient200Response remoteAddr(String? remoteAddr) =>
      this(remoteAddr: remoteAddr);

  @override
  GetClient200Response httpVersion(String? httpVersion) =>
      this(httpVersion: httpVersion);

  @override
  GetClient200Response method(String? method) => this(method: method);

  @override
  GetClient200Response headers(List<HeadersHeadersInner>? headers) =>
      this(headers: headers);

  @override
  GetClient200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetClient200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetClient200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetClient200Response call({
    Object? remoteAddr = const $CopyWithPlaceholder(),
    Object? httpVersion = const $CopyWithPlaceholder(),
    Object? method = const $CopyWithPlaceholder(),
    Object? headers = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetClient200Response(
      remoteAddr: remoteAddr == const $CopyWithPlaceholder()
          ? _value.remoteAddr
          // ignore: cast_nullable_to_non_nullable
          : remoteAddr as String?,
      httpVersion: httpVersion == const $CopyWithPlaceholder()
          ? _value.httpVersion
          // ignore: cast_nullable_to_non_nullable
          : httpVersion as String?,
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String?,
      headers: headers == const $CopyWithPlaceholder()
          ? _value.headers
          // ignore: cast_nullable_to_non_nullable
          : headers as List<HeadersHeadersInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetClient200ResponseCopyWith on GetClient200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetClient200Response.copyWith(...)` or like so:`instanceOfGetClient200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetClient200ResponseCWProxy get copyWith =>
      _$GetClient200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetClient200Response _$GetClient200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GetClient200Response',
  json,
  ($checkedConvert) {
    final val = GetClient200Response(
      remoteAddr: $checkedConvert('remote_addr', (v) => v as String?),
      httpVersion: $checkedConvert('http_version', (v) => v as String?),
      method: $checkedConvert('method', (v) => v as String?),
      headers: $checkedConvert(
        'headers',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => HeadersHeadersInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      took: $checkedConvert('took', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'remoteAddr': 'remote_addr',
    'httpVersion': 'http_version',
  },
);

Map<String, dynamic> _$GetClient200ResponseToJson(
  GetClient200Response instance,
) => <String, dynamic>{
  'remote_addr': ?instance.remoteAddr,
  'http_version': ?instance.httpVersion,
  'method': ?instance.method,
  'headers': ?instance.headers?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
