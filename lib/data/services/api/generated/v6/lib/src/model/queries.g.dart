// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QueriesCWProxy {
  Queries queries(QueriesQueries? queries);

  Queries clients(QueriesClients? clients);

  Queries gravity(QueriesGravity? gravity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Queries(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Queries(...).copyWith(id: 12, name: "My name")
  /// ````
  Queries call({
    QueriesQueries? queries,
    QueriesClients? clients,
    QueriesGravity? gravity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueries.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueries.copyWith.fieldName(...)`
class _$QueriesCWProxyImpl implements _$QueriesCWProxy {
  const _$QueriesCWProxyImpl(this._value);

  final Queries _value;

  @override
  Queries queries(QueriesQueries? queries) => this(queries: queries);

  @override
  Queries clients(QueriesClients? clients) => this(clients: clients);

  @override
  Queries gravity(QueriesGravity? gravity) => this(gravity: gravity);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Queries(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Queries(...).copyWith(id: 12, name: "My name")
  /// ````
  Queries call({
    Object? queries = const $CopyWithPlaceholder(),
    Object? clients = const $CopyWithPlaceholder(),
    Object? gravity = const $CopyWithPlaceholder(),
  }) {
    return Queries(
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
    );
  }
}

extension $QueriesCopyWith on Queries {
  /// Returns a callable class that can be used as follows: `instanceOfQueries.copyWith(...)` or like so:`instanceOfQueries.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueriesCWProxy get copyWith => _$QueriesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Queries _$QueriesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Queries', json, ($checkedConvert) {
  final val = Queries(
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
  );
  return val;
});

Map<String, dynamic> _$QueriesToJson(Queries instance) => <String, dynamic>{
  'queries': ?instance.queries?.toJson(),
  'clients': ?instance.clients?.toJson(),
  'gravity': ?instance.gravity?.toJson(),
};
