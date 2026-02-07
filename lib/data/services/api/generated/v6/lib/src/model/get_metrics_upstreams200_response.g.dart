// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metrics_upstreams200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMetricsUpstreams200ResponseCWProxy {
  GetMetricsUpstreams200Response upstreams(
    List<UpstreamsUpstreamsInner>? upstreams,
  );

  GetMetricsUpstreams200Response forwardedQueries(int? forwardedQueries);

  GetMetricsUpstreams200Response totalQueries(int? totalQueries);

  GetMetricsUpstreams200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsUpstreams200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsUpstreams200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsUpstreams200Response call({
    List<UpstreamsUpstreamsInner>? upstreams,
    int? forwardedQueries,
    int? totalQueries,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMetricsUpstreams200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMetricsUpstreams200Response.copyWith.fieldName(...)`
class _$GetMetricsUpstreams200ResponseCWProxyImpl
    implements _$GetMetricsUpstreams200ResponseCWProxy {
  const _$GetMetricsUpstreams200ResponseCWProxyImpl(this._value);

  final GetMetricsUpstreams200Response _value;

  @override
  GetMetricsUpstreams200Response upstreams(
    List<UpstreamsUpstreamsInner>? upstreams,
  ) => this(upstreams: upstreams);

  @override
  GetMetricsUpstreams200Response forwardedQueries(int? forwardedQueries) =>
      this(forwardedQueries: forwardedQueries);

  @override
  GetMetricsUpstreams200Response totalQueries(int? totalQueries) =>
      this(totalQueries: totalQueries);

  @override
  GetMetricsUpstreams200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsUpstreams200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsUpstreams200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsUpstreams200Response call({
    Object? upstreams = const $CopyWithPlaceholder(),
    Object? forwardedQueries = const $CopyWithPlaceholder(),
    Object? totalQueries = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMetricsUpstreams200Response(
      upstreams: upstreams == const $CopyWithPlaceholder()
          ? _value.upstreams
          // ignore: cast_nullable_to_non_nullable
          : upstreams as List<UpstreamsUpstreamsInner>?,
      forwardedQueries: forwardedQueries == const $CopyWithPlaceholder()
          ? _value.forwardedQueries
          // ignore: cast_nullable_to_non_nullable
          : forwardedQueries as int?,
      totalQueries: totalQueries == const $CopyWithPlaceholder()
          ? _value.totalQueries
          // ignore: cast_nullable_to_non_nullable
          : totalQueries as int?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMetricsUpstreams200ResponseCopyWith
    on GetMetricsUpstreams200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMetricsUpstreams200Response.copyWith(...)` or like so:`instanceOfGetMetricsUpstreams200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMetricsUpstreams200ResponseCWProxy get copyWith =>
      _$GetMetricsUpstreams200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetricsUpstreams200Response _$GetMetricsUpstreams200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GetMetricsUpstreams200Response',
  json,
  ($checkedConvert) {
    final val = GetMetricsUpstreams200Response(
      upstreams: $checkedConvert(
        'upstreams',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  UpstreamsUpstreamsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      forwardedQueries: $checkedConvert(
        'forwarded_queries',
        (v) => (v as num?)?.toInt(),
      ),
      totalQueries: $checkedConvert(
        'total_queries',
        (v) => (v as num?)?.toInt(),
      ),
      took: $checkedConvert('took', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'forwardedQueries': 'forwarded_queries',
    'totalQueries': 'total_queries',
  },
);

Map<String, dynamic> _$GetMetricsUpstreams200ResponseToJson(
  GetMetricsUpstreams200Response instance,
) => <String, dynamic>{
  'upstreams': ?instance.upstreams?.map((e) => e.toJson()).toList(),
  'forwarded_queries': ?instance.forwardedQueries,
  'total_queries': ?instance.totalQueries,
  'took': ?instance.took,
};
