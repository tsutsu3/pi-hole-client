// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_endpoints200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetEndpoints200ResponseCWProxy {
  GetEndpoints200Response endpoints(EndpointsEndpoints? endpoints);

  GetEndpoints200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetEndpoints200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetEndpoints200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetEndpoints200Response call({EndpointsEndpoints? endpoints, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetEndpoints200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetEndpoints200Response.copyWith.fieldName(...)`
class _$GetEndpoints200ResponseCWProxyImpl
    implements _$GetEndpoints200ResponseCWProxy {
  const _$GetEndpoints200ResponseCWProxyImpl(this._value);

  final GetEndpoints200Response _value;

  @override
  GetEndpoints200Response endpoints(EndpointsEndpoints? endpoints) =>
      this(endpoints: endpoints);

  @override
  GetEndpoints200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetEndpoints200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetEndpoints200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetEndpoints200Response call({
    Object? endpoints = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetEndpoints200Response(
      endpoints: endpoints == const $CopyWithPlaceholder()
          ? _value.endpoints
          // ignore: cast_nullable_to_non_nullable
          : endpoints as EndpointsEndpoints?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetEndpoints200ResponseCopyWith on GetEndpoints200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetEndpoints200Response.copyWith(...)` or like so:`instanceOfGetEndpoints200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetEndpoints200ResponseCWProxy get copyWith =>
      _$GetEndpoints200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEndpoints200Response _$GetEndpoints200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetEndpoints200Response', json, ($checkedConvert) {
  final val = GetEndpoints200Response(
    endpoints: $checkedConvert(
      'endpoints',
      (v) => v == null
          ? null
          : EndpointsEndpoints.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetEndpoints200ResponseToJson(
  GetEndpoints200Response instance,
) => <String, dynamic>{
  'endpoints': ?instance.endpoints?.toJson(),
  'took': ?instance.took,
};
