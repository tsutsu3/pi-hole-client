// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metrics_database_summary200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMetricsDatabaseSummary200ResponseCWProxy {
  GetMetricsDatabaseSummary200Response sumQueries(int? sumQueries);

  GetMetricsDatabaseSummary200Response sumBlocked(int? sumBlocked);

  GetMetricsDatabaseSummary200Response percentBlocked(num? percentBlocked);

  GetMetricsDatabaseSummary200Response totalClients(int? totalClients);

  GetMetricsDatabaseSummary200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsDatabaseSummary200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsDatabaseSummary200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsDatabaseSummary200Response call({
    int? sumQueries,
    int? sumBlocked,
    num? percentBlocked,
    int? totalClients,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMetricsDatabaseSummary200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMetricsDatabaseSummary200Response.copyWith.fieldName(...)`
class _$GetMetricsDatabaseSummary200ResponseCWProxyImpl
    implements _$GetMetricsDatabaseSummary200ResponseCWProxy {
  const _$GetMetricsDatabaseSummary200ResponseCWProxyImpl(this._value);

  final GetMetricsDatabaseSummary200Response _value;

  @override
  GetMetricsDatabaseSummary200Response sumQueries(int? sumQueries) =>
      this(sumQueries: sumQueries);

  @override
  GetMetricsDatabaseSummary200Response sumBlocked(int? sumBlocked) =>
      this(sumBlocked: sumBlocked);

  @override
  GetMetricsDatabaseSummary200Response percentBlocked(num? percentBlocked) =>
      this(percentBlocked: percentBlocked);

  @override
  GetMetricsDatabaseSummary200Response totalClients(int? totalClients) =>
      this(totalClients: totalClients);

  @override
  GetMetricsDatabaseSummary200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsDatabaseSummary200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsDatabaseSummary200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsDatabaseSummary200Response call({
    Object? sumQueries = const $CopyWithPlaceholder(),
    Object? sumBlocked = const $CopyWithPlaceholder(),
    Object? percentBlocked = const $CopyWithPlaceholder(),
    Object? totalClients = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMetricsDatabaseSummary200Response(
      sumQueries: sumQueries == const $CopyWithPlaceholder()
          ? _value.sumQueries
          // ignore: cast_nullable_to_non_nullable
          : sumQueries as int?,
      sumBlocked: sumBlocked == const $CopyWithPlaceholder()
          ? _value.sumBlocked
          // ignore: cast_nullable_to_non_nullable
          : sumBlocked as int?,
      percentBlocked: percentBlocked == const $CopyWithPlaceholder()
          ? _value.percentBlocked
          // ignore: cast_nullable_to_non_nullable
          : percentBlocked as num?,
      totalClients: totalClients == const $CopyWithPlaceholder()
          ? _value.totalClients
          // ignore: cast_nullable_to_non_nullable
          : totalClients as int?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMetricsDatabaseSummary200ResponseCopyWith
    on GetMetricsDatabaseSummary200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMetricsDatabaseSummary200Response.copyWith(...)` or like so:`instanceOfGetMetricsDatabaseSummary200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMetricsDatabaseSummary200ResponseCWProxy get copyWith =>
      _$GetMetricsDatabaseSummary200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetricsDatabaseSummary200Response
_$GetMetricsDatabaseSummary200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GetMetricsDatabaseSummary200Response',
  json,
  ($checkedConvert) {
    final val = GetMetricsDatabaseSummary200Response(
      sumQueries: $checkedConvert('sum_queries', (v) => (v as num?)?.toInt()),
      sumBlocked: $checkedConvert('sum_blocked', (v) => (v as num?)?.toInt()),
      percentBlocked: $checkedConvert('percent_blocked', (v) => v as num?),
      totalClients: $checkedConvert(
        'total_clients',
        (v) => (v as num?)?.toInt(),
      ),
      took: $checkedConvert('took', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'sumQueries': 'sum_queries',
    'sumBlocked': 'sum_blocked',
    'percentBlocked': 'percent_blocked',
    'totalClients': 'total_clients',
  },
);

Map<String, dynamic> _$GetMetricsDatabaseSummary200ResponseToJson(
  GetMetricsDatabaseSummary200Response instance,
) => <String, dynamic>{
  'sum_queries': ?instance.sumQueries,
  'sum_blocked': ?instance.sumBlocked,
  'percent_blocked': ?instance.percentBlocked,
  'total_clients': ?instance.totalClients,
  'took': ?instance.took,
};
