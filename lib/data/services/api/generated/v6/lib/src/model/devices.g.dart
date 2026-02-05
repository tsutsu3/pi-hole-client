// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DevicesCWProxy {
  Devices devices(List<DevicesDevicesInner>? devices);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Devices(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Devices(...).copyWith(id: 12, name: "My name")
  /// ````
  Devices call({List<DevicesDevicesInner>? devices});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDevices.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDevices.copyWith.fieldName(...)`
class _$DevicesCWProxyImpl implements _$DevicesCWProxy {
  const _$DevicesCWProxyImpl(this._value);

  final Devices _value;

  @override
  Devices devices(List<DevicesDevicesInner>? devices) => this(devices: devices);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Devices(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Devices(...).copyWith(id: 12, name: "My name")
  /// ````
  Devices call({Object? devices = const $CopyWithPlaceholder()}) {
    return Devices(
      devices: devices == const $CopyWithPlaceholder()
          ? _value.devices
          // ignore: cast_nullable_to_non_nullable
          : devices as List<DevicesDevicesInner>?,
    );
  }
}

extension $DevicesCopyWith on Devices {
  /// Returns a callable class that can be used as follows: `instanceOfDevices.copyWith(...)` or like so:`instanceOfDevices.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DevicesCWProxy get copyWith => _$DevicesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Devices _$DevicesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Devices', json, ($checkedConvert) {
      final val = Devices(
        devices: $checkedConvert(
          'devices',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => DevicesDevicesInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DevicesToJson(Devices instance) => <String, dynamic>{
  'devices': ?instance.devices?.map((e) => e.toJson()).toList(),
};
