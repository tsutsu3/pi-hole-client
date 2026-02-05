// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_history_history_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientHistoryHistoryInnerCWProxy {
  ClientHistoryHistoryInner timestamp(num? timestamp);

  ClientHistoryHistoryInner data(Map<String, int>? data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientHistoryHistoryInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientHistoryHistoryInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientHistoryHistoryInner call({num? timestamp, Map<String, int>? data});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientHistoryHistoryInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientHistoryHistoryInner.copyWith.fieldName(...)`
class _$ClientHistoryHistoryInnerCWProxyImpl
    implements _$ClientHistoryHistoryInnerCWProxy {
  const _$ClientHistoryHistoryInnerCWProxyImpl(this._value);

  final ClientHistoryHistoryInner _value;

  @override
  ClientHistoryHistoryInner timestamp(num? timestamp) =>
      this(timestamp: timestamp);

  @override
  ClientHistoryHistoryInner data(Map<String, int>? data) => this(data: data);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientHistoryHistoryInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientHistoryHistoryInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientHistoryHistoryInner call({
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return ClientHistoryHistoryInner(
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as num?,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as Map<String, int>?,
    );
  }
}

extension $ClientHistoryHistoryInnerCopyWith on ClientHistoryHistoryInner {
  /// Returns a callable class that can be used as follows: `instanceOfClientHistoryHistoryInner.copyWith(...)` or like so:`instanceOfClientHistoryHistoryInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientHistoryHistoryInnerCWProxy get copyWith =>
      _$ClientHistoryHistoryInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientHistoryHistoryInner _$ClientHistoryHistoryInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientHistoryHistoryInner', json, ($checkedConvert) {
  final val = ClientHistoryHistoryInner(
    timestamp: $checkedConvert('timestamp', (v) => v as num?),
    data: $checkedConvert(
      'data',
      (v) => (v as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ClientHistoryHistoryInnerToJson(
  ClientHistoryHistoryInner instance,
) => <String, dynamic>{
  'timestamp': ?instance.timestamp,
  'data': ?instance.data,
};
