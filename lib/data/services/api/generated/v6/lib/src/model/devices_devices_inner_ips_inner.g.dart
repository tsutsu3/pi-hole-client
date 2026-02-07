// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_devices_inner_ips_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DevicesDevicesInnerIpsInnerCWProxy {
  DevicesDevicesInnerIpsInner ip(String? ip);

  DevicesDevicesInnerIpsInner name(String? name);

  DevicesDevicesInnerIpsInner lastSeen(int? lastSeen);

  DevicesDevicesInnerIpsInner nameUpdated(int? nameUpdated);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DevicesDevicesInnerIpsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DevicesDevicesInnerIpsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DevicesDevicesInnerIpsInner call({
    String? ip,
    String? name,
    int? lastSeen,
    int? nameUpdated,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDevicesDevicesInnerIpsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDevicesDevicesInnerIpsInner.copyWith.fieldName(...)`
class _$DevicesDevicesInnerIpsInnerCWProxyImpl
    implements _$DevicesDevicesInnerIpsInnerCWProxy {
  const _$DevicesDevicesInnerIpsInnerCWProxyImpl(this._value);

  final DevicesDevicesInnerIpsInner _value;

  @override
  DevicesDevicesInnerIpsInner ip(String? ip) => this(ip: ip);

  @override
  DevicesDevicesInnerIpsInner name(String? name) => this(name: name);

  @override
  DevicesDevicesInnerIpsInner lastSeen(int? lastSeen) =>
      this(lastSeen: lastSeen);

  @override
  DevicesDevicesInnerIpsInner nameUpdated(int? nameUpdated) =>
      this(nameUpdated: nameUpdated);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DevicesDevicesInnerIpsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DevicesDevicesInnerIpsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DevicesDevicesInnerIpsInner call({
    Object? ip = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? lastSeen = const $CopyWithPlaceholder(),
    Object? nameUpdated = const $CopyWithPlaceholder(),
  }) {
    return DevicesDevicesInnerIpsInner(
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      lastSeen: lastSeen == const $CopyWithPlaceholder()
          ? _value.lastSeen
          // ignore: cast_nullable_to_non_nullable
          : lastSeen as int?,
      nameUpdated: nameUpdated == const $CopyWithPlaceholder()
          ? _value.nameUpdated
          // ignore: cast_nullable_to_non_nullable
          : nameUpdated as int?,
    );
  }
}

extension $DevicesDevicesInnerIpsInnerCopyWith on DevicesDevicesInnerIpsInner {
  /// Returns a callable class that can be used as follows: `instanceOfDevicesDevicesInnerIpsInner.copyWith(...)` or like so:`instanceOfDevicesDevicesInnerIpsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DevicesDevicesInnerIpsInnerCWProxy get copyWith =>
      _$DevicesDevicesInnerIpsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicesDevicesInnerIpsInner _$DevicesDevicesInnerIpsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DevicesDevicesInnerIpsInner', json, ($checkedConvert) {
  final val = DevicesDevicesInnerIpsInner(
    ip: $checkedConvert('ip', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
    lastSeen: $checkedConvert('lastSeen', (v) => (v as num?)?.toInt()),
    nameUpdated: $checkedConvert('nameUpdated', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$DevicesDevicesInnerIpsInnerToJson(
  DevicesDevicesInnerIpsInner instance,
) => <String, dynamic>{
  'ip': ?instance.ip,
  'name': ?instance.name,
  'lastSeen': ?instance.lastSeen,
  'nameUpdated': ?instance.nameUpdated,
};
