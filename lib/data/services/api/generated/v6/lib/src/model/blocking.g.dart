// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocking.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BlockingCWProxy {
  Blocking blocking(BlockingBlockingEnum? blocking);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Blocking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Blocking(...).copyWith(id: 12, name: "My name")
  /// ````
  Blocking call({BlockingBlockingEnum? blocking});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBlocking.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBlocking.copyWith.fieldName(...)`
class _$BlockingCWProxyImpl implements _$BlockingCWProxy {
  const _$BlockingCWProxyImpl(this._value);

  final Blocking _value;

  @override
  Blocking blocking(BlockingBlockingEnum? blocking) => this(blocking: blocking);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Blocking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Blocking(...).copyWith(id: 12, name: "My name")
  /// ````
  Blocking call({Object? blocking = const $CopyWithPlaceholder()}) {
    return Blocking(
      blocking: blocking == const $CopyWithPlaceholder()
          ? _value.blocking
          // ignore: cast_nullable_to_non_nullable
          : blocking as BlockingBlockingEnum?,
    );
  }
}

extension $BlockingCopyWith on Blocking {
  /// Returns a callable class that can be used as follows: `instanceOfBlocking.copyWith(...)` or like so:`instanceOfBlocking.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BlockingCWProxy get copyWith => _$BlockingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blocking _$BlockingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Blocking', json, ($checkedConvert) {
      final val = Blocking(
        blocking: $checkedConvert(
          'blocking',
          (v) => $enumDecodeNullable(_$BlockingBlockingEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BlockingToJson(Blocking instance) => <String, dynamic>{
  'blocking': ?_$BlockingBlockingEnumEnumMap[instance.blocking],
};

const _$BlockingBlockingEnumEnumMap = {
  BlockingBlockingEnum.enabled: 'enabled',
  BlockingBlockingEnum.disabled: 'disabled',
  BlockingBlockingEnum.failed: 'failed',
  BlockingBlockingEnum.unknown: 'unknown',
};
