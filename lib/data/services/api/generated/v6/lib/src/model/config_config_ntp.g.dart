// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_ntp.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigNtpCWProxy {
  ConfigConfigNtp ipv4(ConfigConfigNtpIpv4? ipv4);

  ConfigConfigNtp ipv6(ConfigConfigNtpIpv6? ipv6);

  ConfigConfigNtp sync_(ConfigConfigNtpSync? sync_);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtp(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtp call({
    ConfigConfigNtpIpv4? ipv4,
    ConfigConfigNtpIpv6? ipv6,
    ConfigConfigNtpSync? sync_,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigNtp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigNtp.copyWith.fieldName(...)`
class _$ConfigConfigNtpCWProxyImpl implements _$ConfigConfigNtpCWProxy {
  const _$ConfigConfigNtpCWProxyImpl(this._value);

  final ConfigConfigNtp _value;

  @override
  ConfigConfigNtp ipv4(ConfigConfigNtpIpv4? ipv4) => this(ipv4: ipv4);

  @override
  ConfigConfigNtp ipv6(ConfigConfigNtpIpv6? ipv6) => this(ipv6: ipv6);

  @override
  ConfigConfigNtp sync_(ConfigConfigNtpSync? sync_) => this(sync_: sync_);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigNtp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigNtp(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigNtp call({
    Object? ipv4 = const $CopyWithPlaceholder(),
    Object? ipv6 = const $CopyWithPlaceholder(),
    Object? sync_ = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigNtp(
      ipv4: ipv4 == const $CopyWithPlaceholder()
          ? _value.ipv4
          // ignore: cast_nullable_to_non_nullable
          : ipv4 as ConfigConfigNtpIpv4?,
      ipv6: ipv6 == const $CopyWithPlaceholder()
          ? _value.ipv6
          // ignore: cast_nullable_to_non_nullable
          : ipv6 as ConfigConfigNtpIpv6?,
      sync_: sync_ == const $CopyWithPlaceholder()
          ? _value.sync_
          // ignore: cast_nullable_to_non_nullable
          : sync_ as ConfigConfigNtpSync?,
    );
  }
}

extension $ConfigConfigNtpCopyWith on ConfigConfigNtp {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigNtp.copyWith(...)` or like so:`instanceOfConfigConfigNtp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigNtpCWProxy get copyWith => _$ConfigConfigNtpCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigNtp _$ConfigConfigNtpFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConfigConfigNtp', json, ($checkedConvert) {
      final val = ConfigConfigNtp(
        ipv4: $checkedConvert(
          'ipv4',
          (v) => v == null
              ? null
              : ConfigConfigNtpIpv4.fromJson(v as Map<String, dynamic>),
        ),
        ipv6: $checkedConvert(
          'ipv6',
          (v) => v == null
              ? null
              : ConfigConfigNtpIpv6.fromJson(v as Map<String, dynamic>),
        ),
        sync_: $checkedConvert(
          'sync',
          (v) => v == null
              ? null
              : ConfigConfigNtpSync.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'sync_': 'sync'});

Map<String, dynamic> _$ConfigConfigNtpToJson(ConfigConfigNtp instance) =>
    <String, dynamic>{
      'ipv4': ?instance.ipv4?.toJson(),
      'ipv6': ?instance.ipv6?.toJson(),
      'sync': ?instance.sync_?.toJson(),
    };
