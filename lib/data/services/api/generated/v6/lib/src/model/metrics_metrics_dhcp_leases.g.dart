// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_metrics_dhcp_leases.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetricsMetricsDhcpLeasesCWProxy {
  MetricsMetricsDhcpLeases allocated4(int? allocated4);

  MetricsMetricsDhcpLeases pruned4(int? pruned4);

  MetricsMetricsDhcpLeases allocated6(int? allocated6);

  MetricsMetricsDhcpLeases pruned6(int? pruned6);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDhcpLeases(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDhcpLeases(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDhcpLeases call({
    int? allocated4,
    int? pruned4,
    int? allocated6,
    int? pruned6,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMetricsMetricsDhcpLeases.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMetricsMetricsDhcpLeases.copyWith.fieldName(...)`
class _$MetricsMetricsDhcpLeasesCWProxyImpl
    implements _$MetricsMetricsDhcpLeasesCWProxy {
  const _$MetricsMetricsDhcpLeasesCWProxyImpl(this._value);

  final MetricsMetricsDhcpLeases _value;

  @override
  MetricsMetricsDhcpLeases allocated4(int? allocated4) =>
      this(allocated4: allocated4);

  @override
  MetricsMetricsDhcpLeases pruned4(int? pruned4) => this(pruned4: pruned4);

  @override
  MetricsMetricsDhcpLeases allocated6(int? allocated6) =>
      this(allocated6: allocated6);

  @override
  MetricsMetricsDhcpLeases pruned6(int? pruned6) => this(pruned6: pruned6);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MetricsMetricsDhcpLeases(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MetricsMetricsDhcpLeases(...).copyWith(id: 12, name: "My name")
  /// ````
  MetricsMetricsDhcpLeases call({
    Object? allocated4 = const $CopyWithPlaceholder(),
    Object? pruned4 = const $CopyWithPlaceholder(),
    Object? allocated6 = const $CopyWithPlaceholder(),
    Object? pruned6 = const $CopyWithPlaceholder(),
  }) {
    return MetricsMetricsDhcpLeases(
      allocated4: allocated4 == const $CopyWithPlaceholder()
          ? _value.allocated4
          // ignore: cast_nullable_to_non_nullable
          : allocated4 as int?,
      pruned4: pruned4 == const $CopyWithPlaceholder()
          ? _value.pruned4
          // ignore: cast_nullable_to_non_nullable
          : pruned4 as int?,
      allocated6: allocated6 == const $CopyWithPlaceholder()
          ? _value.allocated6
          // ignore: cast_nullable_to_non_nullable
          : allocated6 as int?,
      pruned6: pruned6 == const $CopyWithPlaceholder()
          ? _value.pruned6
          // ignore: cast_nullable_to_non_nullable
          : pruned6 as int?,
    );
  }
}

extension $MetricsMetricsDhcpLeasesCopyWith on MetricsMetricsDhcpLeases {
  /// Returns a callable class that can be used as follows: `instanceOfMetricsMetricsDhcpLeases.copyWith(...)` or like so:`instanceOfMetricsMetricsDhcpLeases.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetricsMetricsDhcpLeasesCWProxy get copyWith =>
      _$MetricsMetricsDhcpLeasesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsMetricsDhcpLeases _$MetricsMetricsDhcpLeasesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MetricsMetricsDhcpLeases',
  json,
  ($checkedConvert) {
    final val = MetricsMetricsDhcpLeases(
      allocated4: $checkedConvert('allocated_4', (v) => (v as num?)?.toInt()),
      pruned4: $checkedConvert('pruned_4', (v) => (v as num?)?.toInt()),
      allocated6: $checkedConvert('allocated_6', (v) => (v as num?)?.toInt()),
      pruned6: $checkedConvert('pruned_6', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'allocated4': 'allocated_4',
    'pruned4': 'pruned_4',
    'allocated6': 'allocated_6',
    'pruned6': 'pruned_6',
  },
);

Map<String, dynamic> _$MetricsMetricsDhcpLeasesToJson(
  MetricsMetricsDhcpLeases instance,
) => <String, dynamic>{
  'allocated_4': ?instance.allocated4,
  'pruned_4': ?instance.pruned4,
  'allocated_6': ?instance.allocated6,
  'pruned_6': ?instance.pruned6,
};
