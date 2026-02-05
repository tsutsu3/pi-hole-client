// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_dns_reply_host.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDnsReplyHostCWProxy {
  ConfigConfigDnsReplyHost force4(bool? force4);

  ConfigConfigDnsReplyHost force6(bool? force6);

  ConfigConfigDnsReplyHost iPv4(String? iPv4);

  ConfigConfigDnsReplyHost iPv6(String? iPv6);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsReplyHost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsReplyHost(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsReplyHost call({
    bool? force4,
    bool? force6,
    String? iPv4,
    String? iPv6,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDnsReplyHost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDnsReplyHost.copyWith.fieldName(...)`
class _$ConfigConfigDnsReplyHostCWProxyImpl
    implements _$ConfigConfigDnsReplyHostCWProxy {
  const _$ConfigConfigDnsReplyHostCWProxyImpl(this._value);

  final ConfigConfigDnsReplyHost _value;

  @override
  ConfigConfigDnsReplyHost force4(bool? force4) => this(force4: force4);

  @override
  ConfigConfigDnsReplyHost force6(bool? force6) => this(force6: force6);

  @override
  ConfigConfigDnsReplyHost iPv4(String? iPv4) => this(iPv4: iPv4);

  @override
  ConfigConfigDnsReplyHost iPv6(String? iPv6) => this(iPv6: iPv6);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsReplyHost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsReplyHost(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsReplyHost call({
    Object? force4 = const $CopyWithPlaceholder(),
    Object? force6 = const $CopyWithPlaceholder(),
    Object? iPv4 = const $CopyWithPlaceholder(),
    Object? iPv6 = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDnsReplyHost(
      force4: force4 == const $CopyWithPlaceholder()
          ? _value.force4
          // ignore: cast_nullable_to_non_nullable
          : force4 as bool?,
      force6: force6 == const $CopyWithPlaceholder()
          ? _value.force6
          // ignore: cast_nullable_to_non_nullable
          : force6 as bool?,
      iPv4: iPv4 == const $CopyWithPlaceholder()
          ? _value.iPv4
          // ignore: cast_nullable_to_non_nullable
          : iPv4 as String?,
      iPv6: iPv6 == const $CopyWithPlaceholder()
          ? _value.iPv6
          // ignore: cast_nullable_to_non_nullable
          : iPv6 as String?,
    );
  }
}

extension $ConfigConfigDnsReplyHostCopyWith on ConfigConfigDnsReplyHost {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDnsReplyHost.copyWith(...)` or like so:`instanceOfConfigConfigDnsReplyHost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDnsReplyHostCWProxy get copyWith =>
      _$ConfigConfigDnsReplyHostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDnsReplyHost _$ConfigConfigDnsReplyHostFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigDnsReplyHost', json, ($checkedConvert) {
  final val = ConfigConfigDnsReplyHost(
    force4: $checkedConvert('force4', (v) => v as bool?),
    force6: $checkedConvert('force6', (v) => v as bool?),
    iPv4: $checkedConvert('IPv4', (v) => v as String?),
    iPv6: $checkedConvert('IPv6', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'iPv4': 'IPv4', 'iPv6': 'IPv6'});

Map<String, dynamic> _$ConfigConfigDnsReplyHostToJson(
  ConfigConfigDnsReplyHost instance,
) => <String, dynamic>{
  'force4': ?instance.force4,
  'force6': ?instance.force6,
  'IPv4': ?instance.iPv4,
  'IPv6': ?instance.iPv6,
};
