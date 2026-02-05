// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_metrics_dns_cache_content_inner_count.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsMetricsDnsCacheContentInnerCountCWProxy {
  MetricsMetricsDnsCacheContentInnerCount valid(int? valid);

  MetricsMetricsDnsCacheContentInnerCount stale(int? stale);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDnsCacheContentInnerCount(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDnsCacheContentInnerCount(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDnsCacheContentInnerCount call({int? valid, int? stale});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetricsMetricsDnsCacheContentInnerCount.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetricsMetricsDnsCacheContentInnerCount.copyWith.fieldName(...)`
class _$MetricsMetricsDnsCacheContentInnerCountCWProxyImpl
    implements _$MetricsMetricsDnsCacheContentInnerCountCWProxy {
  const _$MetricsMetricsDnsCacheContentInnerCountCWProxyImpl(this._value);

  final MetricsMetricsDnsCacheContentInnerCount _value;

  @override
  MetricsMetricsDnsCacheContentInnerCount valid(int? valid) =>
      this(valid: valid);

  @override
  MetricsMetricsDnsCacheContentInnerCount stale(int? stale) =>
      this(stale: stale);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDnsCacheContentInnerCount(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDnsCacheContentInnerCount(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDnsCacheContentInnerCount call({
    Object? valid = const $CopyWithPlaceholder(),
    Object? stale = const $CopyWithPlaceholder(),
  }) {
    return MetricsMetricsDnsCacheContentInnerCount(
      valid: valid == const $CopyWithPlaceholder()
          ? _value.valid
          // ignore: cast_nullable_to_non_nullable
          : valid as int?,
      stale: stale == const $CopyWithPlaceholder()
          ? _value.stale
          // ignore: cast_nullable_to_non_nullable
          : stale as int?,
    );
  }
}

extension $MetricsMetricsDnsCacheContentInnerCountCopyWith
    on MetricsMetricsDnsCacheContentInnerCount {
  /// Returns a callable class that can be used as follows: `instanceOfMetricsMetricsDnsCacheContentInnerCount.copyWith(...)` or like so:`instanceOfMetricsMetricsDnsCacheContentInnerCount.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsMetricsDnsCacheContentInnerCountCWProxy get copyWith =>
      _$MetricsMetricsDnsCacheContentInnerCountCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsMetricsDnsCacheContentInnerCount
_$MetricsMetricsDnsCacheContentInnerCountFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MetricsMetricsDnsCacheContentInnerCount', json, (
      $checkedConvert,
    ) {
      final val = MetricsMetricsDnsCacheContentInnerCount(
        valid: $checkedConvert('valid', (v) => (v as num?)?.toInt()),
        stale: $checkedConvert('stale', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$MetricsMetricsDnsCacheContentInnerCountToJson(
  MetricsMetricsDnsCacheContentInnerCount instance,
) => <String, dynamic>{'valid': ?instance.valid, 'stale': ?instance.stale};
