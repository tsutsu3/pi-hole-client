// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_gateway200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetGateway200ResponseCWProxy {
  GetGateway200Response gateway(List<GatewayGatewayInner>? gateway);

  GetGateway200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetGateway200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetGateway200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetGateway200Response call({List<GatewayGatewayInner>? gateway, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetGateway200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetGateway200Response.copyWith.fieldName(...)`
class _$GetGateway200ResponseCWProxyImpl
    implements _$GetGateway200ResponseCWProxy {
  const _$GetGateway200ResponseCWProxyImpl(this._value);

  final GetGateway200Response _value;

  @override
  GetGateway200Response gateway(List<GatewayGatewayInner>? gateway) =>
      this(gateway: gateway);

  @override
  GetGateway200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetGateway200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetGateway200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetGateway200Response call({
    Object? gateway = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetGateway200Response(
      gateway: gateway == const $CopyWithPlaceholder()
          ? _value.gateway
          // ignore: cast_nullable_to_non_nullable
          : gateway as List<GatewayGatewayInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetGateway200ResponseCopyWith on GetGateway200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetGateway200Response.copyWith(...)` or like so:`instanceOfGetGateway200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetGateway200ResponseCWProxy get copyWith =>
      _$GetGateway200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGateway200Response _$GetGateway200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetGateway200Response', json, ($checkedConvert) {
  final val = GetGateway200Response(
    gateway: $checkedConvert(
      'gateway',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GatewayGatewayInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetGateway200ResponseToJson(
  GetGateway200Response instance,
) => <String, dynamic>{
  'gateway': ?instance.gateway?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
