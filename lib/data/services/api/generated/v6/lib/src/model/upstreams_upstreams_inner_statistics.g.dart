// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upstreams_upstreams_inner_statistics.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpstreamsUpstreamsInnerStatisticsCWProxy {
  UpstreamsUpstreamsInnerStatistics response(num? response);

  UpstreamsUpstreamsInnerStatistics variance(num? variance);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpstreamsUpstreamsInnerStatistics(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpstreamsUpstreamsInnerStatistics(...).copyWith(id: 12, name: "My name")
  /// ````
  UpstreamsUpstreamsInnerStatistics call({num? response, num? variance});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpstreamsUpstreamsInnerStatistics.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpstreamsUpstreamsInnerStatistics.copyWith.fieldName(...)`
class _$UpstreamsUpstreamsInnerStatisticsCWProxyImpl
    implements _$UpstreamsUpstreamsInnerStatisticsCWProxy {
  const _$UpstreamsUpstreamsInnerStatisticsCWProxyImpl(this._value);

  final UpstreamsUpstreamsInnerStatistics _value;

  @override
  UpstreamsUpstreamsInnerStatistics response(num? response) =>
      this(response: response);

  @override
  UpstreamsUpstreamsInnerStatistics variance(num? variance) =>
      this(variance: variance);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpstreamsUpstreamsInnerStatistics(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpstreamsUpstreamsInnerStatistics(...).copyWith(id: 12, name: "My name")
  /// ````
  UpstreamsUpstreamsInnerStatistics call({
    Object? response = const $CopyWithPlaceholder(),
    Object? variance = const $CopyWithPlaceholder(),
  }) {
    return UpstreamsUpstreamsInnerStatistics(
      response: response == const $CopyWithPlaceholder()
          ? _value.response
          // ignore: cast_nullable_to_non_nullable
          : response as num?,
      variance: variance == const $CopyWithPlaceholder()
          ? _value.variance
          // ignore: cast_nullable_to_non_nullable
          : variance as num?,
    );
  }
}

extension $UpstreamsUpstreamsInnerStatisticsCopyWith
    on UpstreamsUpstreamsInnerStatistics {
  /// Returns a callable class that can be used as follows: `instanceOfUpstreamsUpstreamsInnerStatistics.copyWith(...)` or like so:`instanceOfUpstreamsUpstreamsInnerStatistics.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpstreamsUpstreamsInnerStatisticsCWProxy get copyWith =>
      _$UpstreamsUpstreamsInnerStatisticsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpstreamsUpstreamsInnerStatistics _$UpstreamsUpstreamsInnerStatisticsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpstreamsUpstreamsInnerStatistics', json, (
  $checkedConvert,
) {
  final val = UpstreamsUpstreamsInnerStatistics(
    response: $checkedConvert('response', (v) => v as num?),
    variance: $checkedConvert('variance', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$UpstreamsUpstreamsInnerStatisticsToJson(
  UpstreamsUpstreamsInnerStatistics instance,
) => <String, dynamic>{
  'response': ?instance.response,
  'variance': ?instance.variance,
};
