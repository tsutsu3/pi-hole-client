// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_network200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetNetwork200ResponseCWProxy {
  GetNetwork200Response devices(List<DevicesDevicesInner>? devices);

  GetNetwork200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetNetwork200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetNetwork200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetNetwork200Response call({List<DevicesDevicesInner>? devices, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetNetwork200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetNetwork200Response.copyWith.fieldName(...)`
class _$GetNetwork200ResponseCWProxyImpl
    implements _$GetNetwork200ResponseCWProxy {
  const _$GetNetwork200ResponseCWProxyImpl(this._value);

  final GetNetwork200Response _value;

  @override
  GetNetwork200Response devices(List<DevicesDevicesInner>? devices) =>
      this(devices: devices);

  @override
  GetNetwork200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetNetwork200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetNetwork200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetNetwork200Response call({
    Object? devices = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetNetwork200Response(
      devices: devices == const $CopyWithPlaceholder()
          ? _value.devices
          // ignore: cast_nullable_to_non_nullable
          : devices as List<DevicesDevicesInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetNetwork200ResponseCopyWith on GetNetwork200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetNetwork200Response.copyWith(...)` or like so:`instanceOfGetNetwork200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetNetwork200ResponseCWProxy get copyWith =>
      _$GetNetwork200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNetwork200Response _$GetNetwork200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetNetwork200Response', json, ($checkedConvert) {
  final val = GetNetwork200Response(
    devices: $checkedConvert(
      'devices',
      (v) => (v as List<dynamic>?)
          ?.map((e) => DevicesDevicesInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetNetwork200ResponseToJson(
  GetNetwork200Response instance,
) => <String, dynamic>{
  'devices': ?instance.devices?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
