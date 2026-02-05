// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metrics_top_clients200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMetricsTopClients200ResponseCWProxy {
  GetMetricsTopClients200Response clients(
    List<TopClientsClientsInner>? clients,
  );

  GetMetricsTopClients200Response totalQueries(int? totalQueries);

  GetMetricsTopClients200Response blockedQueries(int? blockedQueries);

  GetMetricsTopClients200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsTopClients200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsTopClients200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsTopClients200Response call({
    List<TopClientsClientsInner>? clients,
    int? totalQueries,
    int? blockedQueries,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMetricsTopClients200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMetricsTopClients200Response.copyWith.fieldName(...)`
class _$GetMetricsTopClients200ResponseCWProxyImpl
    implements _$GetMetricsTopClients200ResponseCWProxy {
  const _$GetMetricsTopClients200ResponseCWProxyImpl(this._value);

  final GetMetricsTopClients200Response _value;

  @override
  GetMetricsTopClients200Response clients(
    List<TopClientsClientsInner>? clients,
  ) => this(clients: clients);

  @override
  GetMetricsTopClients200Response totalQueries(int? totalQueries) =>
      this(totalQueries: totalQueries);

  @override
  GetMetricsTopClients200Response blockedQueries(int? blockedQueries) =>
      this(blockedQueries: blockedQueries);

  @override
  GetMetricsTopClients200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsTopClients200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsTopClients200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsTopClients200Response call({
    Object? clients = const $CopyWithPlaceholder(),
    Object? totalQueries = const $CopyWithPlaceholder(),
    Object? blockedQueries = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMetricsTopClients200Response(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as List<TopClientsClientsInner>?,
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

extension $GetMetricsTopClients200ResponseCopyWith
    on GetMetricsTopClients200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMetricsTopClients200Response.copyWith(...)` or like so:`instanceOfGetMetricsTopClients200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMetricsTopClients200ResponseCWProxy get copyWith =>
      _$GetMetricsTopClients200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetricsTopClients200Response _$GetMetricsTopClients200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GetMetricsTopClients200Response',
  json,
  ($checkedConvert) {
    final val = GetMetricsTopClients200Response(
      clients: $checkedConvert(
        'clients',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TopClientsClientsInner.fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$GetMetricsTopClients200ResponseToJson(
  GetMetricsTopClients200Response instance,
) => <String, dynamic>{
  'clients': ?instance.clients?.map((e) => e.toJson()).toList(),
  'total_queries': ?instance.totalQueries,
  'blocked_queries': ?instance.blockedQueries,
  'took': ?instance.took,
};
