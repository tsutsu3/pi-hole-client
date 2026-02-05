// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_metrics_dns_replies.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsMetricsDnsRepliesCWProxy {
  MetricsMetricsDnsReplies forwarded(int? forwarded);

  MetricsMetricsDnsReplies unanswered(int? unanswered);

  MetricsMetricsDnsReplies local(int? local);

  MetricsMetricsDnsReplies optimized(int? optimized);

  MetricsMetricsDnsReplies auth(int? auth);

  MetricsMetricsDnsReplies sum(int? sum);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDnsReplies(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDnsReplies(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDnsReplies call({
    int? forwarded,
    int? unanswered,
    int? local,
    int? optimized,
    int? auth,
    int? sum,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetricsMetricsDnsReplies.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetricsMetricsDnsReplies.copyWith.fieldName(...)`
class _$MetricsMetricsDnsRepliesCWProxyImpl
    implements _$MetricsMetricsDnsRepliesCWProxy {
  const _$MetricsMetricsDnsRepliesCWProxyImpl(this._value);

  final MetricsMetricsDnsReplies _value;

  @override
  MetricsMetricsDnsReplies forwarded(int? forwarded) =>
      this(forwarded: forwarded);

  @override
  MetricsMetricsDnsReplies unanswered(int? unanswered) =>
      this(unanswered: unanswered);

  @override
  MetricsMetricsDnsReplies local(int? local) => this(local: local);

  @override
  MetricsMetricsDnsReplies optimized(int? optimized) =>
      this(optimized: optimized);

  @override
  MetricsMetricsDnsReplies auth(int? auth) => this(auth: auth);

  @override
  MetricsMetricsDnsReplies sum(int? sum) => this(sum: sum);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDnsReplies(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDnsReplies(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDnsReplies call({
    Object? forwarded = const $CopyWithPlaceholder(),
    Object? unanswered = const $CopyWithPlaceholder(),
    Object? local = const $CopyWithPlaceholder(),
    Object? optimized = const $CopyWithPlaceholder(),
    Object? auth = const $CopyWithPlaceholder(),
    Object? sum = const $CopyWithPlaceholder(),
  }) {
    return MetricsMetricsDnsReplies(
      forwarded: forwarded == const $CopyWithPlaceholder()
          ? _value.forwarded
          // ignore: cast_nullable_to_non_nullable
          : forwarded as int?,
      unanswered: unanswered == const $CopyWithPlaceholder()
          ? _value.unanswered
          // ignore: cast_nullable_to_non_nullable
          : unanswered as int?,
      local: local == const $CopyWithPlaceholder()
          ? _value.local
          // ignore: cast_nullable_to_non_nullable
          : local as int?,
      optimized: optimized == const $CopyWithPlaceholder()
          ? _value.optimized
          // ignore: cast_nullable_to_non_nullable
          : optimized as int?,
      auth: auth == const $CopyWithPlaceholder()
          ? _value.auth
          // ignore: cast_nullable_to_non_nullable
          : auth as int?,
      sum: sum == const $CopyWithPlaceholder()
          ? _value.sum
          // ignore: cast_nullable_to_non_nullable
          : sum as int?,
    );
  }
}

extension $MetricsMetricsDnsRepliesCopyWith on MetricsMetricsDnsReplies {
  /// Returns a callable class that can be used as follows: `instanceOfMetricsMetricsDnsReplies.copyWith(...)` or like so:`instanceOfMetricsMetricsDnsReplies.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsMetricsDnsRepliesCWProxy get copyWith =>
      _$MetricsMetricsDnsRepliesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsMetricsDnsReplies _$MetricsMetricsDnsRepliesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MetricsMetricsDnsReplies', json, ($checkedConvert) {
  final val = MetricsMetricsDnsReplies(
    forwarded: $checkedConvert('forwarded', (v) => (v as num?)?.toInt()),
    unanswered: $checkedConvert('unanswered', (v) => (v as num?)?.toInt()),
    local: $checkedConvert('local', (v) => (v as num?)?.toInt()),
    optimized: $checkedConvert('optimized', (v) => (v as num?)?.toInt()),
    auth: $checkedConvert('auth', (v) => (v as num?)?.toInt()),
    sum: $checkedConvert('sum', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$MetricsMetricsDnsRepliesToJson(
  MetricsMetricsDnsReplies instance,
) => <String, dynamic>{
  'forwarded': ?instance.forwarded,
  'unanswered': ?instance.unanswered,
  'local': ?instance.local,
  'optimized': ?instance.optimized,
  'auth': ?instance.auth,
  'sum': ?instance.sum,
};
