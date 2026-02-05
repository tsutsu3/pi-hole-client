// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_summary.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DatabaseSummaryCWProxy {
  DatabaseSummary sumQueries(int? sumQueries);

  DatabaseSummary sumBlocked(int? sumBlocked);

  DatabaseSummary percentBlocked(num? percentBlocked);

  DatabaseSummary totalClients(int? totalClients);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DatabaseSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DatabaseSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  DatabaseSummary call({
    int? sumQueries,
    int? sumBlocked,
    num? percentBlocked,
    int? totalClients,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDatabaseSummary.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDatabaseSummary.copyWith.fieldName(...)`
class _$DatabaseSummaryCWProxyImpl implements _$DatabaseSummaryCWProxy {
  const _$DatabaseSummaryCWProxyImpl(this._value);

  final DatabaseSummary _value;

  @override
  DatabaseSummary sumQueries(int? sumQueries) => this(sumQueries: sumQueries);

  @override
  DatabaseSummary sumBlocked(int? sumBlocked) => this(sumBlocked: sumBlocked);

  @override
  DatabaseSummary percentBlocked(num? percentBlocked) =>
      this(percentBlocked: percentBlocked);

  @override
  DatabaseSummary totalClients(int? totalClients) =>
      this(totalClients: totalClients);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DatabaseSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DatabaseSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  DatabaseSummary call({
    Object? sumQueries = const $CopyWithPlaceholder(),
    Object? sumBlocked = const $CopyWithPlaceholder(),
    Object? percentBlocked = const $CopyWithPlaceholder(),
    Object? totalClients = const $CopyWithPlaceholder(),
  }) {
    return DatabaseSummary(
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
    );
  }
}

extension $DatabaseSummaryCopyWith on DatabaseSummary {
  /// Returns a callable class that can be used as follows: `instanceOfDatabaseSummary.copyWith(...)` or like so:`instanceOfDatabaseSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DatabaseSummaryCWProxy get copyWith => _$DatabaseSummaryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseSummary _$DatabaseSummaryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'DatabaseSummary',
  json,
  ($checkedConvert) {
    final val = DatabaseSummary(
      sumQueries: $checkedConvert('sum_queries', (v) => (v as num?)?.toInt()),
      sumBlocked: $checkedConvert('sum_blocked', (v) => (v as num?)?.toInt()),
      percentBlocked: $checkedConvert('percent_blocked', (v) => v as num?),
      totalClients: $checkedConvert(
        'total_clients',
        (v) => (v as num?)?.toInt(),
      ),
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

Map<String, dynamic> _$DatabaseSummaryToJson(DatabaseSummary instance) =>
    <String, dynamic>{
      'sum_queries': ?instance.sumQueries,
      'sum_blocked': ?instance.sumBlocked,
      'percent_blocked': ?instance.percentBlocked,
      'total_clients': ?instance.totalClients,
    };
