// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_metrics.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsMetricsCWProxy {
  MetricsMetrics dns(MetricsMetricsDns? dns);

  MetricsMetrics dhcp(MetricsMetricsDhcp? dhcp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetrics(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetrics(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetrics call({MetricsMetricsDns? dns, MetricsMetricsDhcp? dhcp});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetricsMetrics.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetricsMetrics.copyWith.fieldName(...)`
class _$MetricsMetricsCWProxyImpl implements _$MetricsMetricsCWProxy {
  const _$MetricsMetricsCWProxyImpl(this._value);

  final MetricsMetrics _value;

  @override
  MetricsMetrics dns(MetricsMetricsDns? dns) => this(dns: dns);

  @override
  MetricsMetrics dhcp(MetricsMetricsDhcp? dhcp) => this(dhcp: dhcp);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetrics(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetrics(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetrics call({
    Object? dns = const $CopyWithPlaceholder(),
    Object? dhcp = const $CopyWithPlaceholder(),
  }) {
    return MetricsMetrics(
      dns: dns == const $CopyWithPlaceholder()
          ? _value.dns
          // ignore: cast_nullable_to_non_nullable
          : dns as MetricsMetricsDns?,
      dhcp: dhcp == const $CopyWithPlaceholder()
          ? _value.dhcp
          // ignore: cast_nullable_to_non_nullable
          : dhcp as MetricsMetricsDhcp?,
    );
  }
}

extension $MetricsMetricsCopyWith on MetricsMetrics {
  /// Returns a callable class that can be used as follows: `instanceOfMetricsMetrics.copyWith(...)` or like so:`instanceOfMetricsMetrics.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsMetricsCWProxy get copyWith => _$MetricsMetricsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsMetrics _$MetricsMetricsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MetricsMetrics', json, ($checkedConvert) {
      final val = MetricsMetrics(
        dns: $checkedConvert(
          'dns',
          (v) => v == null
              ? null
              : MetricsMetricsDns.fromJson(v as Map<String, dynamic>),
        ),
        dhcp: $checkedConvert(
          'dhcp',
          (v) => v == null
              ? null
              : MetricsMetricsDhcp.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MetricsMetricsToJson(MetricsMetrics instance) =>
    <String, dynamic>{
      'dns': ?instance.dns?.toJson(),
      'dhcp': ?instance.dhcp?.toJson(),
    };
