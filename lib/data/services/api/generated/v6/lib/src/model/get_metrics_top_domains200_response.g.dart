// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metrics_top_domains200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMetricsTopDomains200ResponseCWProxy {
  GetMetricsTopDomains200Response domains(
    List<TopDomainsDomainsInner>? domains,
  );

  GetMetricsTopDomains200Response totalQueries(int? totalQueries);

  GetMetricsTopDomains200Response blockedQueries(int? blockedQueries);

  GetMetricsTopDomains200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsTopDomains200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsTopDomains200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsTopDomains200Response call({
    List<TopDomainsDomainsInner>? domains,
    int? totalQueries,
    int? blockedQueries,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMetricsTopDomains200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMetricsTopDomains200Response.copyWith.fieldName(...)`
class _$GetMetricsTopDomains200ResponseCWProxyImpl
    implements _$GetMetricsTopDomains200ResponseCWProxy {
  const _$GetMetricsTopDomains200ResponseCWProxyImpl(this._value);

  final GetMetricsTopDomains200Response _value;

  @override
  GetMetricsTopDomains200Response domains(
    List<TopDomainsDomainsInner>? domains,
  ) => this(domains: domains);

  @override
  GetMetricsTopDomains200Response totalQueries(int? totalQueries) =>
      this(totalQueries: totalQueries);

  @override
  GetMetricsTopDomains200Response blockedQueries(int? blockedQueries) =>
      this(blockedQueries: blockedQueries);

  @override
  GetMetricsTopDomains200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsTopDomains200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsTopDomains200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsTopDomains200Response call({
    Object? domains = const $CopyWithPlaceholder(),
    Object? totalQueries = const $CopyWithPlaceholder(),
    Object? blockedQueries = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMetricsTopDomains200Response(
      domains: domains == const $CopyWithPlaceholder()
          ? _value.domains
          // ignore: cast_nullable_to_non_nullable
          : domains as List<TopDomainsDomainsInner>?,
      totalQueries: totalQueries == const $CopyWithPlaceholder()
          ? _value.totalQueries
          // ignore: cast_nullable_to_non_nullable
          : totalQueries as int?,
      blockedQueries: blockedQueries == const $CopyWithPlaceholder()
          ? _value.blockedQueries
          // ignore: cast_nullable_to_non_nullable
          : blockedQueries as int?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMetricsTopDomains200ResponseCopyWith
    on GetMetricsTopDomains200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMetricsTopDomains200Response.copyWith(...)` or like so:`instanceOfGetMetricsTopDomains200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMetricsTopDomains200ResponseCWProxy get copyWith =>
      _$GetMetricsTopDomains200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetricsTopDomains200Response _$GetMetricsTopDomains200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GetMetricsTopDomains200Response',
  json,
  ($checkedConvert) {
    final val = GetMetricsTopDomains200Response(
      domains: $checkedConvert(
        'domains',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TopDomainsDomainsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      totalQueries: $checkedConvert(
        'total_queries',
        (v) => (v as num?)?.toInt(),
      ),
      blockedQueries: $checkedConvert(
        'blocked_queries',
        (v) => (v as num?)?.toInt(),
      ),
      took: $checkedConvert('took', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalQueries': 'total_queries',
    'blockedQueries': 'blocked_queries',
  },
);

Map<String, dynamic> _$GetMetricsTopDomains200ResponseToJson(
  GetMetricsTopDomains200Response instance,
) => <String, dynamic>{
  'domains': ?instance.domains?.map((e) => e.toJson()).toList(),
  'total_queries': ?instance.totalQueries,
  'blocked_queries': ?instance.blockedQueries,
  'took': ?instance.took,
};
