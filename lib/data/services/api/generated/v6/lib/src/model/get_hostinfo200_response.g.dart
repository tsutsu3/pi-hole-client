// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hostinfo200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetHostinfo200ResponseCWProxy {
  GetHostinfo200Response host(HostHost? host);

  GetHostinfo200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetHostinfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetHostinfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetHostinfo200Response call({HostHost? host, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetHostinfo200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetHostinfo200Response.copyWith.fieldName(...)`
class _$GetHostinfo200ResponseCWProxyImpl
    implements _$GetHostinfo200ResponseCWProxy {
  const _$GetHostinfo200ResponseCWProxyImpl(this._value);

  final GetHostinfo200Response _value;

  @override
  GetHostinfo200Response host(HostHost? host) => this(host: host);

  @override
  GetHostinfo200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetHostinfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetHostinfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetHostinfo200Response call({
    Object? host = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetHostinfo200Response(
      host: host == const $CopyWithPlaceholder()
          ? _value.host
          // ignore: cast_nullable_to_non_nullable
          : host as HostHost?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetHostinfo200ResponseCopyWith on GetHostinfo200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetHostinfo200Response.copyWith(...)` or like so:`instanceOfGetHostinfo200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetHostinfo200ResponseCWProxy get copyWith =>
      _$GetHostinfo200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHostinfo200Response _$GetHostinfo200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetHostinfo200Response', json, ($checkedConvert) {
  final val = GetHostinfo200Response(
    host: $checkedConvert(
      'host',
      (v) => v == null ? null : HostHost.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetHostinfo200ResponseToJson(
  GetHostinfo200Response instance,
) => <String, dynamic>{
  'host': ?instance.host?.toJson(),
  'took': ?instance.took,
};
