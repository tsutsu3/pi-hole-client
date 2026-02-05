// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_ntp_ipv6.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigNtpIpv6CWProxy {
  ConfigConfigNtpIpv6 active(bool? active);

  ConfigConfigNtpIpv6 address(String? address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtpIpv6(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtpIpv6(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtpIpv6 call({bool? active, String? address});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigNtpIpv6.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigNtpIpv6.copyWith.fieldName(...)`
class _$ConfigConfigNtpIpv6CWProxyImpl implements _$ConfigConfigNtpIpv6CWProxy {
  const _$ConfigConfigNtpIpv6CWProxyImpl(this._value);

  final ConfigConfigNtpIpv6 _value;

  @override
  ConfigConfigNtpIpv6 active(bool? active) => this(active: active);

  @override
  ConfigConfigNtpIpv6 address(String? address) => this(address: address);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtpIpv6(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtpIpv6(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtpIpv6 call({
    Object? active = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigNtpIpv6(
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

extension $ConfigConfigNtpIpv6CopyWith on ConfigConfigNtpIpv6 {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigNtpIpv6.copyWith(...)` or like so:`instanceOfConfigConfigNtpIpv6.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigNtpIpv6CWProxy get copyWith =>
      _$ConfigConfigNtpIpv6CWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigNtpIpv6 _$ConfigConfigNtpIpv6FromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConfigConfigNtpIpv6', json, ($checkedConvert) {
      final val = ConfigConfigNtpIpv6(
        active: $checkedConvert('active', (v) => v as bool?),
        address: $checkedConvert('address', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ConfigConfigNtpIpv6ToJson(
  ConfigConfigNtpIpv6 instance,
) => <String, dynamic>{
  'active': ?instance.active,
  'address': ?instance.address,
};
