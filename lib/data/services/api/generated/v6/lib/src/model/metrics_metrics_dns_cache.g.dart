// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_metrics_dns_cache.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsMetricsDnsCacheCWProxy {
  MetricsMetricsDnsCache size(int? size);

  MetricsMetricsDnsCache inserted(int? inserted);

  MetricsMetricsDnsCache evicted(int? evicted);

  MetricsMetricsDnsCache expired(int? expired);

  MetricsMetricsDnsCache immortal(int? immortal);

  MetricsMetricsDnsCache content(
    List<MetricsMetricsDnsCacheContentInner>? content,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDnsCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDnsCache(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDnsCache call({
    int? size,
    int? inserted,
    int? evicted,
    int? expired,
    int? immortal,
    List<MetricsMetricsDnsCacheContentInner>? content,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetricsMetricsDnsCache.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetricsMetricsDnsCache.copyWith.fieldName(...)`
class _$MetricsMetricsDnsCacheCWProxyImpl
    implements _$MetricsMetricsDnsCacheCWProxy {
  const _$MetricsMetricsDnsCacheCWProxyImpl(this._value);

  final MetricsMetricsDnsCache _value;

  @override
  MetricsMetricsDnsCache size(int? size) => this(size: size);

  @override
  MetricsMetricsDnsCache inserted(int? inserted) => this(inserted: inserted);

  @override
  MetricsMetricsDnsCache evicted(int? evicted) => this(evicted: evicted);

  @override
  MetricsMetricsDnsCache expired(int? expired) => this(expired: expired);

  @override
  MetricsMetricsDnsCache immortal(int? immortal) => this(immortal: immortal);

  @override
  MetricsMetricsDnsCache content(
    List<MetricsMetricsDnsCacheContentInner>? content,
  ) => this(content: content);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDnsCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDnsCache(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDnsCache call({
    Object? size = const $CopyWithPlaceholder(),
    Object? inserted = const $CopyWithPlaceholder(),
    Object? evicted = const $CopyWithPlaceholder(),
    Object? expired = const $CopyWithPlaceholder(),
    Object? immortal = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
  }) {
    return MetricsMetricsDnsCache(
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int?,
      inserted: inserted == const $CopyWithPlaceholder()
          ? _value.inserted
          // ignore: cast_nullable_to_non_nullable
          : inserted as int?,
      evicted: evicted == const $CopyWithPlaceholder()
          ? _value.evicted
          // ignore: cast_nullable_to_non_nullable
          : evicted as int?,
      expired: expired == const $CopyWithPlaceholder()
          ? _value.expired
          // ignore: cast_nullable_to_non_nullable
          : expired as int?,
      immortal: immortal == const $CopyWithPlaceholder()
          ? _value.immortal
          // ignore: cast_nullable_to_non_nullable
          : immortal as int?,
      content: content == const $CopyWithPlaceholder()
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as List<MetricsMetricsDnsCacheContentInner>?,
    );
  }
}

extension $MetricsMetricsDnsCacheCopyWith on MetricsMetricsDnsCache {
  /// Returns a callable class that can be used as follows: `instanceOfMetricsMetricsDnsCache.copyWith(...)` or like so:`instanceOfMetricsMetricsDnsCache.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsMetricsDnsCacheCWProxy get copyWith =>
      _$MetricsMetricsDnsCacheCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsMetricsDnsCache _$MetricsMetricsDnsCacheFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MetricsMetricsDnsCache', json, ($checkedConvert) {
  final val = MetricsMetricsDnsCache(
    size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
    inserted: $checkedConvert('inserted', (v) => (v as num?)?.toInt()),
    evicted: $checkedConvert('evicted', (v) => (v as num?)?.toInt()),
    expired: $checkedConvert('expired', (v) => (v as num?)?.toInt()),
    immortal: $checkedConvert('immortal', (v) => (v as num?)?.toInt()),
    content: $checkedConvert(
      'content',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => MetricsMetricsDnsCacheContentInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$MetricsMetricsDnsCacheToJson(
  MetricsMetricsDnsCache instance,
) => <String, dynamic>{
  'size': ?instance.size,
  'inserted': ?instance.inserted,
  'evicted': ?instance.evicted,
  'expired': ?instance.expired,
  'immortal': ?instance.immortal,
  'content': ?instance.content?.map((e) => e.toJson()).toList(),
};
