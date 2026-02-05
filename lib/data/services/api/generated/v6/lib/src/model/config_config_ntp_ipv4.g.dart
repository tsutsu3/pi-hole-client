// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_ntp_ipv4.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigNtpIpv4CWProxy {
  ConfigConfigNtpIpv4 active(bool? active);

  ConfigConfigNtpIpv4 address(String? address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtpIpv4(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtpIpv4(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtpIpv4 call({bool? active, String? address});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigNtpIpv4.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigNtpIpv4.copyWith.fieldName(...)`
class _$ConfigConfigNtpIpv4CWProxyImpl implements _$ConfigConfigNtpIpv4CWProxy {
  const _$ConfigConfigNtpIpv4CWProxyImpl(this._value);

  final ConfigConfigNtpIpv4 _value;

  @override
  ConfigConfigNtpIpv4 active(bool? active) => this(active: active);

  @override
  ConfigConfigNtpIpv4 address(String? address) => this(address: address);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtpIpv4(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtpIpv4(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtpIpv4 call({
    Object? active = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigNtpIpv4(
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as bool?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
    );
  }
}

extension $ConfigConfigNtpIpv4CopyWith on ConfigConfigNtpIpv4 {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigNtpIpv4.copyWith(...)` or like so:`instanceOfConfigConfigNtpIpv4.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigNtpIpv4CWProxy get copyWith =>
      _$ConfigConfigNtpIpv4CWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigNtpIpv4 _$ConfigConfigNtpIpv4FromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConfigConfigNtpIpv4', json, ($checkedConvert) {
      final val = ConfigConfigNtpIpv4(
        active: $checkedConvert('active', (v) => v as bool?),
        address: $checkedConvert('address', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ConfigConfigNtpIpv4ToJson(
  ConfigConfigNtpIpv4 instance,
) => <String, dynamic>{
  'active': ?instance.active,
  'address': ?instance.address,
};
