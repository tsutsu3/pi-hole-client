// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_queries.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddQueriesCWProxy {
  PaddQueries total(int? total);

  PaddQueries blocked(int? blocked);

  PaddQueries percentBlocked(num? percentBlocked);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddQueries(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddQueries(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddQueries call({int? total, int? blocked, num? percentBlocked});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddQueries.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddQueries.copyWith.fieldName(...)`
class _$PaddQueriesCWProxyImpl implements _$PaddQueriesCWProxy {
  const _$PaddQueriesCWProxyImpl(this._value);

  final PaddQueries _value;

  @override
  PaddQueries total(int? total) => this(total: total);

  @override
  PaddQueries blocked(int? blocked) => this(blocked: blocked);

  @override
  PaddQueries percentBlocked(num? percentBlocked) =>
      this(percentBlocked: percentBlocked);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddQueries(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddQueries(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddQueries call({
    Object? total = const $CopyWithPlaceholder(),
    Object? blocked = const $CopyWithPlaceholder(),
    Object? percentBlocked = const $CopyWithPlaceholder(),
  }) {
    return PaddQueries(
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
    );
  }
}

extension $PaddQueriesCopyWith on PaddQueries {
  /// Returns a callable class that can be used as follows: `instanceOfPaddQueries.copyWith(...)` or like so:`instanceOfPaddQueries.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddQueriesCWProxy get copyWith => _$PaddQueriesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddQueries _$PaddQueriesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaddQueries', json, ($checkedConvert) {
      final val = PaddQueries(
        total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
        blocked: $checkedConvert('blocked', (v) => (v as num?)?.toInt()),
        percentBlocked: $checkedConvert('percent_blocked', (v) => v as num?),
      );
      return val;
    }, fieldKeyMap: const {'percentBlocked': 'percent_blocked'});

Map<String, dynamic> _$PaddQueriesToJson(PaddQueries instance) =>
    <String, dynamic>{
      'total': ?instance.total,
      'blocked': ?instance.blocked,
      'percent_blocked': ?instance.percentBlocked,
    };
