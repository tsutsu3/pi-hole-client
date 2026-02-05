// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_dns_blocking.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDnsBlockingCWProxy {
  ConfigConfigDnsBlocking active(bool? active);

  ConfigConfigDnsBlocking mode(String? mode);

  ConfigConfigDnsBlocking edns(String? edns);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsBlocking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsBlocking(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsBlocking call({bool? active, String? mode, String? edns});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDnsBlocking.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDnsBlocking.copyWith.fieldName(...)`
class _$ConfigConfigDnsBlockingCWProxyImpl
    implements _$ConfigConfigDnsBlockingCWProxy {
  const _$ConfigConfigDnsBlockingCWProxyImpl(this._value);

  final ConfigConfigDnsBlocking _value;

  @override
  ConfigConfigDnsBlocking active(bool? active) => this(active: active);

  @override
  ConfigConfigDnsBlocking mode(String? mode) => this(mode: mode);

  @override
  ConfigConfigDnsBlocking edns(String? edns) => this(edns: edns);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsBlocking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsBlocking(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsBlocking call({
    Object? active = const $CopyWithPlaceholder(),
    Object? mode = const $CopyWithPlaceholder(),
    Object? edns = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDnsBlocking(
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as bool?,
      mode: mode == const $CopyWithPlaceholder()
          ? _value.mode
          // ignore: cast_nullable_to_non_nullable
          : mode as String?,
      edns: edns == const $CopyWithPlaceholder()
          ? _value.edns
          // ignore: cast_nullable_to_non_nullable
          : edns as String?,
    );
  }
}

extension $ConfigConfigDnsBlockingCopyWith on ConfigConfigDnsBlocking {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDnsBlocking.copyWith(...)` or like so:`instanceOfConfigConfigDnsBlocking.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDnsBlockingCWProxy get copyWith =>
      _$ConfigConfigDnsBlockingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDnsBlocking _$ConfigConfigDnsBlockingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigDnsBlocking', json, ($checkedConvert) {
  final val = ConfigConfigDnsBlocking(
    active: $checkedConvert('active', (v) => v as bool?),
    mode: $checkedConvert('mode', (v) => v as String?),
    edns: $checkedConvert('edns', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigDnsBlockingToJson(
  ConfigConfigDnsBlocking instance,
) => <String, dynamic>{
  'active': ?instance.active,
  'mode': ?instance.mode,
  'edns': ?instance.edns,
};
