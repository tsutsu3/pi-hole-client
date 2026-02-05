// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metricsinfo200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMetricsinfo200ResponseCWProxy {
  GetMetricsinfo200Response metrics(MetricsMetrics? metrics);

  GetMetricsinfo200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsinfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsinfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsinfo200Response call({MetricsMetrics? metrics, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMetricsinfo200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMetricsinfo200Response.copyWith.fieldName(...)`
class _$GetMetricsinfo200ResponseCWProxyImpl
    implements _$GetMetricsinfo200ResponseCWProxy {
  const _$GetMetricsinfo200ResponseCWProxyImpl(this._value);

  final GetMetricsinfo200Response _value;

  @override
  GetMetricsinfo200Response metrics(MetricsMetrics? metrics) =>
      this(metrics: metrics);

  @override
  GetMetricsinfo200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsinfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsinfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsinfo200Response call({
    Object? metrics = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMetricsinfo200Response(
      metrics: metrics == const $CopyWithPlaceholder()
          ? _value.metrics
          // ignore: cast_nullable_to_non_nullable
          : metrics as MetricsMetrics?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMetricsinfo200ResponseCopyWith on GetMetricsinfo200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMetricsinfo200Response.copyWith(...)` or like so:`instanceOfGetMetricsinfo200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMetricsinfo200ResponseCWProxy get copyWith =>
      _$GetMetricsinfo200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetricsinfo200Response _$GetMetricsinfo200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetMetricsinfo200Response', json, ($checkedConvert) {
  final val = GetMetricsinfo200Response(
    metrics: $checkedConvert(
      'metrics',
      (v) =>
          v == null ? null : MetricsMetrics.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetMetricsinfo200ResponseToJson(
  GetMetricsinfo200Response instance,
) => <String, dynamic>{
  'metrics': ?instance.metrics?.toJson(),
  'took': ?instance.took,
};
