// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_metrics_dns.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsMetricsDnsCWProxy {
  MetricsMetricsDns cache(MetricsMetricsDnsCache? cache);

  MetricsMetricsDns replies(MetricsMetricsDnsReplies? replies);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDns(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDns(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDns call({
    MetricsMetricsDnsCache? cache,
    MetricsMetricsDnsReplies? replies,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetricsMetricsDns.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetricsMetricsDns.copyWith.fieldName(...)`
class _$MetricsMetricsDnsCWProxyImpl implements _$MetricsMetricsDnsCWProxy {
  const _$MetricsMetricsDnsCWProxyImpl(this._value);

  final MetricsMetricsDns _value;

  @override
  MetricsMetricsDns cache(MetricsMetricsDnsCache? cache) => this(cache: cache);

  @override
  MetricsMetricsDns replies(MetricsMetricsDnsReplies? replies) =>
      this(replies: replies);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDns(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDns(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDns call({
    Object? cache = const $CopyWithPlaceholder(),
    Object? replies = const $CopyWithPlaceholder(),
  }) {
    return MetricsMetricsDns(
      cache: cache == const $CopyWithPlaceholder()
          ? _value.cache
          // ignore: cast_nullable_to_non_nullable
          : cache as MetricsMetricsDnsCache?,
      replies: replies == const $CopyWithPlaceholder()
          ? _value.replies
          // ignore: cast_nullable_to_non_nullable
          : replies as MetricsMetricsDnsReplies?,
    );
  }
}

extension $MetricsMetricsDnsCopyWith on MetricsMetricsDns {
  /// Returns a callable class that can be used as follows: `instanceOfMetricsMetricsDns.copyWith(...)` or like so:`instanceOfMetricsMetricsDns.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsMetricsDnsCWProxy get copyWith =>
      _$MetricsMetricsDnsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsMetricsDns _$MetricsMetricsDnsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MetricsMetricsDns', json, ($checkedConvert) {
      final val = MetricsMetricsDns(
        cache: $checkedConvert(
          'cache',
          (v) => v == null
              ? null
              : MetricsMetricsDnsCache.fromJson(v as Map<String, dynamic>),
        ),
        replies: $checkedConvert(
          'replies',
          (v) => v == null
              ? null
              : MetricsMetricsDnsReplies.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MetricsMetricsDnsToJson(MetricsMetricsDns instance) =>
    <String, dynamic>{
      'cache': ?instance.cache?.toJson(),
      'replies': ?instance.replies?.toJson(),
    };
