// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries_queries.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QueriesQueriesCWProxy {
  QueriesQueries total(int? total);

  QueriesQueries blocked(int? blocked);

  QueriesQueries percentBlocked(num? percentBlocked);

  QueriesQueries uniqueDomains(int? uniqueDomains);

  QueriesQueries forwarded(int? forwarded);

  QueriesQueries cached(int? cached);

  QueriesQueries frequency(num? frequency);

  QueriesQueries types(QueriesQueriesTypes? types);

  QueriesQueries status(QueriesQueriesStatus? status);

  QueriesQueries replies(QueriesQueriesReplies? replies);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueriesQueries(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueriesQueries(...).copyWith(id: 12, name: "My name")
  /// ````
  QueriesQueries call({
    int? total,
    int? blocked,
    num? percentBlocked,
    int? uniqueDomains,
    int? forwarded,
    int? cached,
    num? frequency,
    QueriesQueriesTypes? types,
    QueriesQueriesStatus? status,
    QueriesQueriesReplies? replies,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueriesQueries.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueriesQueries.copyWith.fieldName(...)`
class _$QueriesQueriesCWProxyImpl implements _$QueriesQueriesCWProxy {
  const _$QueriesQueriesCWProxyImpl(this._value);

  final QueriesQueries _value;

  @override
  QueriesQueries total(int? total) => this(total: total);

  @override
  QueriesQueries blocked(int? blocked) => this(blocked: blocked);

  @override
  QueriesQueries percentBlocked(num? percentBlocked) =>
      this(percentBlocked: percentBlocked);

  @override
  QueriesQueries uniqueDomains(int? uniqueDomains) =>
      this(uniqueDomains: uniqueDomains);

  @override
  QueriesQueries forwarded(int? forwarded) => this(forwarded: forwarded);

  @override
  QueriesQueries cached(int? cached) => this(cached: cached);

  @override
  QueriesQueries frequency(num? frequency) => this(frequency: frequency);

  @override
  QueriesQueries types(QueriesQueriesTypes? types) => this(types: types);

  @override
  QueriesQueries status(QueriesQueriesStatus? status) => this(status: status);

  @override
  QueriesQueries replies(QueriesQueriesReplies? replies) =>
      this(replies: replies);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueriesQueries(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueriesQueries(...).copyWith(id: 12, name: "My name")
  /// ````
  QueriesQueries call({
    Object? total = const $CopyWithPlaceholder(),
    Object? blocked = const $CopyWithPlaceholder(),
    Object? percentBlocked = const $CopyWithPlaceholder(),
    Object? uniqueDomains = const $CopyWithPlaceholder(),
    Object? forwarded = const $CopyWithPlaceholder(),
    Object? cached = const $CopyWithPlaceholder(),
    Object? frequency = const $CopyWithPlaceholder(),
    Object? types = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? replies = const $CopyWithPlaceholder(),
  }) {
    return QueriesQueries(
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      blocked: blocked == const $CopyWithPlaceholder()
          ? _value.blocked
          // ignore: cast_nullable_to_non_nullable
          : blocked as int?,
      percentBlocked: percentBlocked == const $CopyWithPlaceholder()
          ? _value.percentBlocked
          // ignore: cast_nullable_to_non_nullable
          : percentBlocked as num?,
      uniqueDomains: uniqueDomains == const $CopyWithPlaceholder()
          ? _value.uniqueDomains
          // ignore: cast_nullable_to_non_nullable
          : uniqueDomains as int?,
      forwarded: forwarded == const $CopyWithPlaceholder()
          ? _value.forwarded
          // ignore: cast_nullable_to_non_nullable
          : forwarded as int?,
      cached: cached == const $CopyWithPlaceholder()
          ? _value.cached
          // ignore: cast_nullable_to_non_nullable
          : cached as int?,
      frequency: frequency == const $CopyWithPlaceholder()
          ? _value.frequency
          // ignore: cast_nullable_to_non_nullable
          : frequency as num?,
      types: types == const $CopyWithPlaceholder()
          ? _value.types
          // ignore: cast_nullable_to_non_nullable
          : types as QueriesQueriesTypes?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as QueriesQueriesStatus?,
      replies: replies == const $CopyWithPlaceholder()
          ? _value.replies
          // ignore: cast_nullable_to_non_nullable
          : replies as QueriesQueriesReplies?,
    );
  }
}

extension $QueriesQueriesCopyWith on QueriesQueries {
  /// Returns a callable class that can be used as follows: `instanceOfQueriesQueries.copyWith(...)` or like so:`instanceOfQueriesQueries.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueriesQueriesCWProxy get copyWith => _$QueriesQueriesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueriesQueries _$QueriesQueriesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'QueriesQueries',
      json,
      ($checkedConvert) {
        final val = QueriesQueries(
          total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
          blocked: $checkedConvert('blocked', (v) => (v as num?)?.toInt()),
          percentBlocked: $checkedConvert('percent_blocked', (v) => v as num?),
          uniqueDomains: $checkedConvert(
            'unique_domains',
            (v) => (v as num?)?.toInt(),
          ),
          forwarded: $checkedConvert('forwarded', (v) => (v as num?)?.toInt()),
          cached: $checkedConvert('cached', (v) => (v as num?)?.toInt()),
          frequency: $checkedConvert('frequency', (v) => v as num?),
          types: $checkedConvert(
            'types',
            (v) => v == null
                ? null
                : QueriesQueriesTypes.fromJson(v as Map<String, dynamic>),
          ),
          status: $checkedConvert(
            'status',
            (v) => v == null
                ? null
                : QueriesQueriesStatus.fromJson(v as Map<String, dynamic>),
          ),
          replies: $checkedConvert(
            'replies',
            (v) => v == null
                ? null
                : QueriesQueriesReplies.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'percentBlocked': 'percent_blocked',
        'uniqueDomains': 'unique_domains',
      },
    );

Map<String, dynamic> _$QueriesQueriesToJson(QueriesQueries instance) =>
    <String, dynamic>{
      'total': ?instance.total,
      'blocked': ?instance.blocked,
      'percent_blocked': ?instance.percentBlocked,
      'unique_domains': ?instance.uniqueDomains,
      'forwarded': ?instance.forwarded,
      'cached': ?instance.cached,
      'frequency': ?instance.frequency,
      'types': ?instance.types?.toJson(),
      'status': ?instance.status?.toJson(),
      'replies': ?instance.replies?.toJson(),
    };
