// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_metrics_dns_cache_content_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsMetricsDnsCacheContentInnerCWProxy {
  MetricsMetricsDnsCacheContentInner type(int? type);

  MetricsMetricsDnsCacheContentInner name(String? name);

  MetricsMetricsDnsCacheContentInner count(
    MetricsMetricsDnsCacheContentInnerCount? count,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDnsCacheContentInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDnsCacheContentInner(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDnsCacheContentInner call({
    int? type,
    String? name,
    MetricsMetricsDnsCacheContentInnerCount? count,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetricsMetricsDnsCacheContentInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetricsMetricsDnsCacheContentInner.copyWith.fieldName(...)`
class _$MetricsMetricsDnsCacheContentInnerCWProxyImpl
    implements _$MetricsMetricsDnsCacheContentInnerCWProxy {
  const _$MetricsMetricsDnsCacheContentInnerCWProxyImpl(this._value);

  final MetricsMetricsDnsCacheContentInner _value;

  @override
  MetricsMetricsDnsCacheContentInner type(int? type) => this(type: type);

  @override
  MetricsMetricsDnsCacheContentInner name(String? name) => this(name: name);

  @override
  MetricsMetricsDnsCacheContentInner count(
    MetricsMetricsDnsCacheContentInnerCount? count,
  ) => this(count: count);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDnsCacheContentInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDnsCacheContentInner(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDnsCacheContentInner call({
    Object? type = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
  }) {
    return MetricsMetricsDnsCacheContentInner(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as MetricsMetricsDnsCacheContentInnerCount?,
    );
  }
}

extension $MetricsMetricsDnsCacheContentInnerCopyWith
    on MetricsMetricsDnsCacheContentInner {
  /// Returns a callable class that can be used as follows: `instanceOfMetricsMetricsDnsCacheContentInner.copyWith(...)` or like so:`instanceOfMetricsMetricsDnsCacheContentInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsMetricsDnsCacheContentInnerCWProxy get copyWith =>
      _$MetricsMetricsDnsCacheContentInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsMetricsDnsCacheContentInner _$MetricsMetricsDnsCacheContentInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MetricsMetricsDnsCacheContentInner', json, (
  $checkedConvert,
) {
  final val = MetricsMetricsDnsCacheContentInner(
    type: $checkedConvert('type', (v) => (v as num?)?.toInt()),
    name: $checkedConvert('name', (v) => v as String?),
    count: $checkedConvert(
      'count',
      (v) => v == null
          ? null
          : MetricsMetricsDnsCacheContentInnerCount.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$MetricsMetricsDnsCacheContentInnerToJson(
  MetricsMetricsDnsCacheContentInner instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'name': ?instance.name,
  'count': ?instance.count?.toJson(),
};
