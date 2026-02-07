// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_system_memory_swap.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemSystemMemorySwapCWProxy {
  SystemSystemMemorySwap total(int? total);

  SystemSystemMemorySwap used(int? used);

  SystemSystemMemorySwap free(int? free);

  SystemSystemMemorySwap percentUsed(num? percentUsed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemMemorySwap(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemMemorySwap(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemMemorySwap call({
    int? total,
    int? used,
    int? free,
    num? percentUsed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSystemSystemMemorySwap.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSystemSystemMemorySwap.copyWith.fieldName(...)`
class _$SystemSystemMemorySwapCWProxyImpl
    implements _$SystemSystemMemorySwapCWProxy {
  const _$SystemSystemMemorySwapCWProxyImpl(this._value);

  final SystemSystemMemorySwap _value;

  @override
  SystemSystemMemorySwap total(int? total) => this(total: total);

  @override
  SystemSystemMemorySwap used(int? used) => this(used: used);

  @override
  SystemSystemMemorySwap free(int? free) => this(free: free);

  @override
  SystemSystemMemorySwap percentUsed(num? percentUsed) =>
      this(percentUsed: percentUsed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemMemorySwap(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemMemorySwap(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemMemorySwap call({
    Object? total = const $CopyWithPlaceholder(),
    Object? used = const $CopyWithPlaceholder(),
    Object? free = const $CopyWithPlaceholder(),
    Object? percentUsed = const $CopyWithPlaceholder(),
  }) {
    return SystemSystemMemorySwap(
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      used: used == const $CopyWithPlaceholder()
          ? _value.used
          // ignore: cast_nullable_to_non_nullable
          : used as int?,
      free: free == const $CopyWithPlaceholder()
          ? _value.free
          // ignore: cast_nullable_to_non_nullable
          : free as int?,
      percentUsed: percentUsed == const $CopyWithPlaceholder()
          ? _value.percentUsed
          // ignore: cast_nullable_to_non_nullable
          : percentUsed as num?,
    );
  }
}

extension $SystemSystemMemorySwapCopyWith on SystemSystemMemorySwap {
  /// Returns a callable class that can be used as follows: `instanceOfSystemSystemMemorySwap.copyWith(...)` or like so:`instanceOfSystemSystemMemorySwap.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemSystemMemorySwapCWProxy get copyWith =>
      _$SystemSystemMemorySwapCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemSystemMemorySwap _$SystemSystemMemorySwapFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SystemSystemMemorySwap', json, ($checkedConvert) {
  final val = SystemSystemMemorySwap(
    total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
    used: $checkedConvert('used', (v) => (v as num?)?.toInt()),
    free: $checkedConvert('free', (v) => (v as num?)?.toInt()),
    percentUsed: $checkedConvert('%used', (v) => v as num?),
  );
  return val;
}, fieldKeyMap: const {'percentUsed': '%used'});

Map<String, dynamic> _$SystemSystemMemorySwapToJson(
  SystemSystemMemorySwap instance,
) => <String, dynamic>{
  'total': ?instance.total,
  'used': ?instance.used,
  'free': ?instance.free,
  '%used': ?instance.percentUsed,
};
