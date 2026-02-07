// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_log_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LogLogInnerCWProxy {
  LogLogInner timestamp(num? timestamp);

  LogLogInner message(String? message);

  LogLogInner prio(String? prio);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LogLogInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LogLogInner(...).copyWith(id: 12, name: "My name")
  /// ````
  LogLogInner call({num? timestamp, String? message, String? prio});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLogLogInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLogLogInner.copyWith.fieldName(...)`
class _$LogLogInnerCWProxyImpl implements _$LogLogInnerCWProxy {
  const _$LogLogInnerCWProxyImpl(this._value);

  final LogLogInner _value;

  @override
  LogLogInner timestamp(num? timestamp) => this(timestamp: timestamp);

  @override
  LogLogInner message(String? message) => this(message: message);

  @override
  LogLogInner prio(String? prio) => this(prio: prio);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LogLogInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LogLogInner(...).copyWith(id: 12, name: "My name")
  /// ````
  LogLogInner call({
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? prio = const $CopyWithPlaceholder(),
  }) {
    return LogLogInner(
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as num?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      prio: prio == const $CopyWithPlaceholder()
          ? _value.prio
          // ignore: cast_nullable_to_non_nullable
          : prio as String?,
    );
  }
}

extension $LogLogInnerCopyWith on LogLogInner {
  /// Returns a callable class that can be used as follows: `instanceOfLogLogInner.copyWith(...)` or like so:`instanceOfLogLogInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LogLogInnerCWProxy get copyWith => _$LogLogInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogLogInner _$LogLogInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LogLogInner', json, ($checkedConvert) {
      final val = LogLogInner(
        timestamp: $checkedConvert('timestamp', (v) => v as num?),
        message: $checkedConvert('message', (v) => v as String?),
        prio: $checkedConvert('prio', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LogLogInnerToJson(LogLogInner instance) =>
    <String, dynamic>{
      'timestamp': ?instance.timestamp,
      'message': ?instance.message,
      'prio': ?instance.prio,
    };
