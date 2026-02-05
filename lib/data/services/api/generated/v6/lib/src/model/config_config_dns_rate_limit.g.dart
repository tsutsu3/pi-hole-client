// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_dns_rate_limit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDnsRateLimitCWProxy {
  ConfigConfigDnsRateLimit count(int? count);

  ConfigConfigDnsRateLimit interval(int? interval);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsRateLimit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsRateLimit(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsRateLimit call({int? count, int? interval});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDnsRateLimit.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDnsRateLimit.copyWith.fieldName(...)`
class _$ConfigConfigDnsRateLimitCWProxyImpl
    implements _$ConfigConfigDnsRateLimitCWProxy {
  const _$ConfigConfigDnsRateLimitCWProxyImpl(this._value);

  final ConfigConfigDnsRateLimit _value;

  @override
  ConfigConfigDnsRateLimit count(int? count) => this(count: count);

  @override
  ConfigConfigDnsRateLimit interval(int? interval) => this(interval: interval);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsRateLimit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsRateLimit(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsRateLimit call({
    Object? count = const $CopyWithPlaceholder(),
    Object? interval = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDnsRateLimit(
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      interval: interval == const $CopyWithPlaceholder()
          ? _value.interval
          // ignore: cast_nullable_to_non_nullable
          : interval as int?,
    );
  }
}

extension $ConfigConfigDnsRateLimitCopyWith on ConfigConfigDnsRateLimit {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDnsRateLimit.copyWith(...)` or like so:`instanceOfConfigConfigDnsRateLimit.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDnsRateLimitCWProxy get copyWith =>
      _$ConfigConfigDnsRateLimitCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDnsRateLimit _$ConfigConfigDnsRateLimitFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigDnsRateLimit', json, ($checkedConvert) {
  final val = ConfigConfigDnsRateLimit(
    count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
    interval: $checkedConvert('interval', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigDnsRateLimitToJson(
  ConfigConfigDnsRateLimit instance,
) => <String, dynamic>{
  'count': ?instance.count,
  'interval': ?instance.interval,
};
