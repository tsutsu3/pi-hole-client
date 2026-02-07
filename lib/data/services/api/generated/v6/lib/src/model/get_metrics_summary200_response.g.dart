// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_metrics_summary200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMetricsSummary200ResponseCWProxy {
  GetMetricsSummary200Response queries(QueriesQueries? queries);

  GetMetricsSummary200Response clients(QueriesClients? clients);

  GetMetricsSummary200Response gravity(QueriesGravity? gravity);

  GetMetricsSummary200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsSummary200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsSummary200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsSummary200Response call({
    QueriesQueries? queries,
    QueriesClients? clients,
    QueriesGravity? gravity,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMetricsSummary200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMetricsSummary200Response.copyWith.fieldName(...)`
class _$GetMetricsSummary200ResponseCWProxyImpl
    implements _$GetMetricsSummary200ResponseCWProxy {
  const _$GetMetricsSummary200ResponseCWProxyImpl(this._value);

  final GetMetricsSummary200Response _value;

  @override
  GetMetricsSummary200Response queries(QueriesQueries? queries) =>
      this(queries: queries);

  @override
  GetMetricsSummary200Response clients(QueriesClients? clients) =>
      this(clients: clients);

  @override
  GetMetricsSummary200Response gravity(QueriesGravity? gravity) =>
      this(gravity: gravity);

  @override
  GetMetricsSummary200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMetricsSummary200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMetricsSummary200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMetricsSummary200Response call({
    Object? queries = const $CopyWithPlaceholder(),
    Object? clients = const $CopyWithPlaceholder(),
    Object? gravity = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMetricsSummary200Response(
      queries: queries == const $CopyWithPlaceholder()
          ? _value.queries
          // ignore: cast_nullable_to_non_nullable
          : queries as QueriesQueries?,
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as QueriesClients?,
      gravity: gravity == const $CopyWithPlaceholder()
          ? _value.gravity
          // ignore: cast_nullable_to_non_nullable
          : gravity as QueriesGravity?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMetricsSummary200ResponseCopyWith
    on GetMetricsSummary200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMetricsSummary200Response.copyWith(...)` or like so:`instanceOfGetMetricsSummary200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMetricsSummary200ResponseCWProxy get copyWith =>
      _$GetMetricsSummary200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMetricsSummary200Response _$GetMetricsSummary200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetMetricsSummary200Response', json, ($checkedConvert) {
  final val = GetMetricsSummary200Response(
    queries: $checkedConvert(
      'queries',
      (v) =>
          v == null ? null : QueriesQueries.fromJson(v as Map<String, dynamic>),
    ),
    clients: $checkedConvert(
      'clients',
      (v) =>
          v == null ? null : QueriesClients.fromJson(v as Map<String, dynamic>),
    ),
    gravity: $checkedConvert(
      'gravity',
      (v) =>
          v == null ? null : QueriesGravity.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetMetricsSummary200ResponseToJson(
  GetMetricsSummary200Response instance,
) => <String, dynamic>{
  'queries': ?instance.queries?.toJson(),
  'clients': ?instance.clients?.toJson(),
  'gravity': ?instance.gravity?.toJson(),
  'took': ?instance.took,
};
