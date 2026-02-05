// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_queries.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasQueriesCWProxy {
  SchemasQueries queries(List<SchemasQueriesQueriesInner>? queries);

  SchemasQueries cursor(int? cursor);

  SchemasQueries recordsTotal(int? recordsTotal);

  SchemasQueries recordsFiltered(int? recordsFiltered);

  SchemasQueries draw(int? draw);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasQueries(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasQueries(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasQueries call({
    List<SchemasQueriesQueriesInner>? queries,
    int? cursor,
    int? recordsTotal,
    int? recordsFiltered,
    int? draw,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasQueries.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasQueries.copyWith.fieldName(...)`
class _$SchemasQueriesCWProxyImpl implements _$SchemasQueriesCWProxy {
  const _$SchemasQueriesCWProxyImpl(this._value);

  final SchemasQueries _value;

  @override
  SchemasQueries queries(List<SchemasQueriesQueriesInner>? queries) =>
      this(queries: queries);

  @override
  SchemasQueries cursor(int? cursor) => this(cursor: cursor);

  @override
  SchemasQueries recordsTotal(int? recordsTotal) =>
      this(recordsTotal: recordsTotal);

  @override
  SchemasQueries recordsFiltered(int? recordsFiltered) =>
      this(recordsFiltered: recordsFiltered);

  @override
  SchemasQueries draw(int? draw) => this(draw: draw);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasQueries(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasQueries(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasQueries call({
    Object? queries = const $CopyWithPlaceholder(),
    Object? cursor = const $CopyWithPlaceholder(),
    Object? recordsTotal = const $CopyWithPlaceholder(),
    Object? recordsFiltered = const $CopyWithPlaceholder(),
    Object? draw = const $CopyWithPlaceholder(),
  }) {
    return SchemasQueries(
      queries: queries == const $CopyWithPlaceholder()
          ? _value.queries
          // ignore: cast_nullable_to_non_nullable
          : queries as List<SchemasQueriesQueriesInner>?,
      cursor: cursor == const $CopyWithPlaceholder()
          ? _value.cursor
          // ignore: cast_nullable_to_non_nullable
          : cursor as int?,
      recordsTotal: recordsTotal == const $CopyWithPlaceholder()
          ? _value.recordsTotal
          // ignore: cast_nullable_to_non_nullable
          : recordsTotal as int?,
      recordsFiltered: recordsFiltered == const $CopyWithPlaceholder()
          ? _value.recordsFiltered
          // ignore: cast_nullable_to_non_nullable
          : recordsFiltered as int?,
      draw: draw == const $CopyWithPlaceholder()
          ? _value.draw
          // ignore: cast_nullable_to_non_nullable
          : draw as int?,
    );
  }
}

extension $SchemasQueriesCopyWith on SchemasQueries {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasQueries.copyWith(...)` or like so:`instanceOfSchemasQueries.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasQueriesCWProxy get copyWith => _$SchemasQueriesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasQueries _$SchemasQueriesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SchemasQueries', json, ($checkedConvert) {
  final val = SchemasQueries(
    queries: $checkedConvert(
      'queries',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                SchemasQueriesQueriesInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    cursor: $checkedConvert('cursor', (v) => (v as num?)?.toInt()),
    recordsTotal: $checkedConvert('recordsTotal', (v) => (v as num?)?.toInt()),
    recordsFiltered: $checkedConvert(
      'recordsFiltered',
      (v) => (v as num?)?.toInt(),
    ),
    draw: $checkedConvert('draw', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$SchemasQueriesToJson(SchemasQueries instance) =>
    <String, dynamic>{
      'queries': ?instance.queries?.map((e) => e.toJson()).toList(),
      'cursor': ?instance.cursor,
      'recordsTotal': ?instance.recordsTotal,
      'recordsFiltered': ?instance.recordsFiltered,
      'draw': ?instance.draw,
    };
