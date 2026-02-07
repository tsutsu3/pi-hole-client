// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocking_bool.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BlockingBoolCWProxy {
  BlockingBool blocking(bool? blocking);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BlockingBool(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BlockingBool(...).copyWith(id: 12, name: "My name")
  /// ````
  BlockingBool call({bool? blocking});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBlockingBool.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBlockingBool.copyWith.fieldName(...)`
class _$BlockingBoolCWProxyImpl implements _$BlockingBoolCWProxy {
  const _$BlockingBoolCWProxyImpl(this._value);

  final BlockingBool _value;

  @override
  BlockingBool blocking(bool? blocking) => this(blocking: blocking);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BlockingBool(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BlockingBool(...).copyWith(id: 12, name: "My name")
  /// ````
  BlockingBool call({Object? blocking = const $CopyWithPlaceholder()}) {
    return BlockingBool(
      blocking: blocking == const $CopyWithPlaceholder()
          ? _value.blocking
          // ignore: cast_nullable_to_non_nullable
          : blocking as bool?,
    );
  }
}

extension $BlockingBoolCopyWith on BlockingBool {
  /// Returns a callable class that can be used as follows: `instanceOfBlockingBool.copyWith(...)` or like so:`instanceOfBlockingBool.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BlockingBoolCWProxy get copyWith => _$BlockingBoolCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockingBool _$BlockingBoolFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BlockingBool', json, ($checkedConvert) {
      final val = BlockingBool(
        blocking: $checkedConvert('blocking', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$BlockingBoolToJson(BlockingBool instance) =>
    <String, dynamic>{'blocking': ?instance.blocking};
