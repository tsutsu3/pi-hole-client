// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_dns_cache.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDnsCacheCWProxy {
  ConfigConfigDnsCache size(int? size);

  ConfigConfigDnsCache optimizer(int? optimizer);

  ConfigConfigDnsCache upstreamBlockedTTL(int? upstreamBlockedTTL);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsCache(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsCache call({
    int? size,
    int? optimizer,
    int? upstreamBlockedTTL,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDnsCache.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDnsCache.copyWith.fieldName(...)`
class _$ConfigConfigDnsCacheCWProxyImpl
    implements _$ConfigConfigDnsCacheCWProxy {
  const _$ConfigConfigDnsCacheCWProxyImpl(this._value);

  final ConfigConfigDnsCache _value;

  @override
  ConfigConfigDnsCache size(int? size) => this(size: size);

  @override
  ConfigConfigDnsCache optimizer(int? optimizer) => this(optimizer: optimizer);

  @override
  ConfigConfigDnsCache upstreamBlockedTTL(int? upstreamBlockedTTL) =>
      this(upstreamBlockedTTL: upstreamBlockedTTL);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsCache(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsCache call({
    Object? size = const $CopyWithPlaceholder(),
    Object? optimizer = const $CopyWithPlaceholder(),
    Object? upstreamBlockedTTL = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDnsCache(
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int?,
      optimizer: optimizer == const $CopyWithPlaceholder()
          ? _value.optimizer
          // ignore: cast_nullable_to_non_nullable
          : optimizer as int?,
      upstreamBlockedTTL: upstreamBlockedTTL == const $CopyWithPlaceholder()
          ? _value.upstreamBlockedTTL
          // ignore: cast_nullable_to_non_nullable
          : upstreamBlockedTTL as int?,
    );
  }
}

extension $ConfigConfigDnsCacheCopyWith on ConfigConfigDnsCache {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDnsCache.copyWith(...)` or like so:`instanceOfConfigConfigDnsCache.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDnsCacheCWProxy get copyWith =>
      _$ConfigConfigDnsCacheCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDnsCache _$ConfigConfigDnsCacheFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigDnsCache', json, ($checkedConvert) {
  final val = ConfigConfigDnsCache(
    size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
    optimizer: $checkedConvert('optimizer', (v) => (v as num?)?.toInt()),
    upstreamBlockedTTL: $checkedConvert(
      'upstreamBlockedTTL',
      (v) => (v as num?)?.toInt(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigDnsCacheToJson(
  ConfigConfigDnsCache instance,
) => <String, dynamic>{
  'size': ?instance.size,
  'optimizer': ?instance.optimizer,
  'upstreamBlockedTTL': ?instance.upstreamBlockedTTL,
};
