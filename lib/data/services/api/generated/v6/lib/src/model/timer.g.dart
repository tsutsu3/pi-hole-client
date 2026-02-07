// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TimerCWProxy {
  Timer timer(num? timer);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Timer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Timer(...).copyWith(id: 12, name: "My name")
  /// ````
  Timer call({num? timer});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimer.copyWith.fieldName(...)`
class _$TimerCWProxyImpl implements _$TimerCWProxy {
  const _$TimerCWProxyImpl(this._value);

  final Timer _value;

  @override
  Timer timer(num? timer) => this(timer: timer);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Timer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Timer(...).copyWith(id: 12, name: "My name")
  /// ````
  Timer call({Object? timer = const $CopyWithPlaceholder()}) {
    return Timer(
      timer: timer == const $CopyWithPlaceholder()
          ? _value.timer
          // ignore: cast_nullable_to_non_nullable
          : timer as num?,
    );
  }
}

extension $TimerCopyWith on Timer {
  /// Returns a callable class that can be used as follows: `instanceOfTimer.copyWith(...)` or like so:`instanceOfTimer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimerCWProxy get copyWith => _$TimerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timer _$TimerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Timer', json, ($checkedConvert) {
      final val = Timer(timer: $checkedConvert('timer', (v) => v as num?));
      return val;
    });

Map<String, dynamic> _$TimerToJson(Timer instance) => <String, dynamic>{
  'timer': ?instance.timer,
};
