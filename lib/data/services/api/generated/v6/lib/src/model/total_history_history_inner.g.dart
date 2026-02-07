// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_history_history_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TotalHistoryHistoryInnerCWProxy {
  TotalHistoryHistoryInner timestamp(num? timestamp);

  TotalHistoryHistoryInner total(int? total);

  TotalHistoryHistoryInner cached(int? cached);

  TotalHistoryHistoryInner blocked(int? blocked);

  TotalHistoryHistoryInner forwarded(int? forwarded);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TotalHistoryHistoryInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TotalHistoryHistoryInner(...).copyWith(id: 12, name: "My name")
  /// ````
  TotalHistoryHistoryInner call({
    num? timestamp,
    int? total,
    int? cached,
    int? blocked,
    int? forwarded,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTotalHistoryHistoryInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTotalHistoryHistoryInner.copyWith.fieldName(...)`
class _$TotalHistoryHistoryInnerCWProxyImpl
    implements _$TotalHistoryHistoryInnerCWProxy {
  const _$TotalHistoryHistoryInnerCWProxyImpl(this._value);

  final TotalHistoryHistoryInner _value;

  @override
  TotalHistoryHistoryInner timestamp(num? timestamp) =>
      this(timestamp: timestamp);

  @override
  TotalHistoryHistoryInner total(int? total) => this(total: total);

  @override
  TotalHistoryHistoryInner cached(int? cached) => this(cached: cached);

  @override
  TotalHistoryHistoryInner blocked(int? blocked) => this(blocked: blocked);

  @override
  TotalHistoryHistoryInner forwarded(int? forwarded) =>
      this(forwarded: forwarded);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TotalHistoryHistoryInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TotalHistoryHistoryInner(...).copyWith(id: 12, name: "My name")
  /// ````
  TotalHistoryHistoryInner call({
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? cached = const $CopyWithPlaceholder(),
    Object? blocked = const $CopyWithPlaceholder(),
    Object? forwarded = const $CopyWithPlaceholder(),
  }) {
    return TotalHistoryHistoryInner(
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as num?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      cached: cached == const $CopyWithPlaceholder()
          ? _value.cached
          // ignore: cast_nullable_to_non_nullable
          : cached as int?,
      blocked: blocked == const $CopyWithPlaceholder()
          ? _value.blocked
          // ignore: cast_nullable_to_non_nullable
          : blocked as int?,
      forwarded: forwarded == const $CopyWithPlaceholder()
          ? _value.forwarded
          // ignore: cast_nullable_to_non_nullable
          : forwarded as int?,
    );
  }
}

extension $TotalHistoryHistoryInnerCopyWith on TotalHistoryHistoryInner {
  /// Returns a callable class that can be used as follows: `instanceOfTotalHistoryHistoryInner.copyWith(...)` or like so:`instanceOfTotalHistoryHistoryInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TotalHistoryHistoryInnerCWProxy get copyWith =>
      _$TotalHistoryHistoryInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalHistoryHistoryInner _$TotalHistoryHistoryInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TotalHistoryHistoryInner', json, ($checkedConvert) {
  final val = TotalHistoryHistoryInner(
    timestamp: $checkedConvert('timestamp', (v) => v as num?),
    total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
    cached: $checkedConvert('cached', (v) => (v as num?)?.toInt()),
    blocked: $checkedConvert('blocked', (v) => (v as num?)?.toInt()),
    forwarded: $checkedConvert('forwarded', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$TotalHistoryHistoryInnerToJson(
  TotalHistoryHistoryInner instance,
) => <String, dynamic>{
  'timestamp': ?instance.timestamp,
  'total': ?instance.total,
  'cached': ?instance.cached,
  'blocked': ?instance.blocked,
  'forwarded': ?instance.forwarded,
};
