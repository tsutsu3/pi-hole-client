// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsCWProxy {
  Metrics metrics(MetricsMetrics? metrics);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Metrics(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Metrics(...).copyWith(id: 12, name: "My name")
  /// ````
  Metrics call({MetricsMetrics? metrics});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetrics.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetrics.copyWith.fieldName(...)`
class _$MetricsCWProxyImpl implements _$MetricsCWProxy {
  const _$MetricsCWProxyImpl(this._value);

  final Metrics _value;

  @override
  Metrics metrics(MetricsMetrics? metrics) => this(metrics: metrics);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Metrics(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Metrics(...).copyWith(id: 12, name: "My name")
  /// ````
  Metrics call({Object? metrics = const $CopyWithPlaceholder()}) {
    return Metrics(
      metrics: metrics == const $CopyWithPlaceholder()
          ? _value.metrics
          // ignore: cast_nullable_to_non_nullable
          : metrics as MetricsMetrics?,
    );
  }
}

extension $MetricsCopyWith on Metrics {
  /// Returns a callable class that can be used as follows: `instanceOfMetrics.copyWith(...)` or like so:`instanceOfMetrics.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsCWProxy get copyWith => _$MetricsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metrics _$MetricsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Metrics', json, ($checkedConvert) {
      final val = Metrics(
        metrics: $checkedConvert(
          'metrics',
          (v) => v == null
              ? null
              : MetricsMetrics.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MetricsToJson(Metrics instance) => <String, dynamic>{
  'metrics': ?instance.metrics?.toJson(),
};
