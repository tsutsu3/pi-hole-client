// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_history.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TotalHistoryCWProxy {
  TotalHistory history(List<TotalHistoryHistoryInner>? history);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TotalHistory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TotalHistory(...).copyWith(id: 12, name: "My name")
  /// ````
  TotalHistory call({List<TotalHistoryHistoryInner>? history});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTotalHistory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTotalHistory.copyWith.fieldName(...)`
class _$TotalHistoryCWProxyImpl implements _$TotalHistoryCWProxy {
  const _$TotalHistoryCWProxyImpl(this._value);

  final TotalHistory _value;

  @override
  TotalHistory history(List<TotalHistoryHistoryInner>? history) =>
      this(history: history);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TotalHistory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TotalHistory(...).copyWith(id: 12, name: "My name")
  /// ````
  TotalHistory call({Object? history = const $CopyWithPlaceholder()}) {
    return TotalHistory(
      history: history == const $CopyWithPlaceholder()
          ? _value.history
          // ignore: cast_nullable_to_non_nullable
          : history as List<TotalHistoryHistoryInner>?,
    );
  }
}

extension $TotalHistoryCopyWith on TotalHistory {
  /// Returns a callable class that can be used as follows: `instanceOfTotalHistory.copyWith(...)` or like so:`instanceOfTotalHistory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TotalHistoryCWProxy get copyWith => _$TotalHistoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalHistory _$TotalHistoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TotalHistory', json, ($checkedConvert) {
      final val = TotalHistory(
        history: $checkedConvert(
          'history',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => TotalHistoryHistoryInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TotalHistoryToJson(TotalHistory instance) =>
    <String, dynamic>{
      'history': ?instance.history?.map((e) => e.toJson()).toList(),
    };
