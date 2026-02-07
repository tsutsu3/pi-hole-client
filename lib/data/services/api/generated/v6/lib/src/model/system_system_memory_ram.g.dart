// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_system_memory_ram.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemSystemMemoryRamCWProxy {
  SystemSystemMemoryRam total(int? total);

  SystemSystemMemoryRam free(int? free);

  SystemSystemMemoryRam used(int? used);

  SystemSystemMemoryRam available(int? available);

  SystemSystemMemoryRam percentUsed(num? percentUsed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemMemoryRam(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemMemoryRam(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemMemoryRam call({
    int? total,
    int? free,
    int? used,
    int? available,
    num? percentUsed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSystemSystemMemoryRam.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSystemSystemMemoryRam.copyWith.fieldName(...)`
class _$SystemSystemMemoryRamCWProxyImpl
    implements _$SystemSystemMemoryRamCWProxy {
  const _$SystemSystemMemoryRamCWProxyImpl(this._value);

  final SystemSystemMemoryRam _value;

  @override
  SystemSystemMemoryRam total(int? total) => this(total: total);

  @override
  SystemSystemMemoryRam free(int? free) => this(free: free);

  @override
  SystemSystemMemoryRam used(int? used) => this(used: used);

  @override
  SystemSystemMemoryRam available(int? available) => this(available: available);

  @override
  SystemSystemMemoryRam percentUsed(num? percentUsed) =>
      this(percentUsed: percentUsed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemMemoryRam(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemMemoryRam(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemMemoryRam call({
    Object? total = const $CopyWithPlaceholder(),
    Object? free = const $CopyWithPlaceholder(),
    Object? used = const $CopyWithPlaceholder(),
    Object? available = const $CopyWithPlaceholder(),
    Object? percentUsed = const $CopyWithPlaceholder(),
  }) {
    return SystemSystemMemoryRam(
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      free: free == const $CopyWithPlaceholder()
          ? _value.free
          // ignore: cast_nullable_to_non_nullable
          : free as int?,
      used: used == const $CopyWithPlaceholder()
          ? _value.used
          // ignore: cast_nullable_to_non_nullable
          : used as int?,
      available: available == const $CopyWithPlaceholder()
          ? _value.available
          // ignore: cast_nullable_to_non_nullable
          : available as int?,
      percentUsed: percentUsed == const $CopyWithPlaceholder()
          ? _value.percentUsed
          // ignore: cast_nullable_to_non_nullable
          : percentUsed as num?,
    );
  }
}

extension $SystemSystemMemoryRamCopyWith on SystemSystemMemoryRam {
  /// Returns a callable class that can be used as follows: `instanceOfSystemSystemMemoryRam.copyWith(...)` or like so:`instanceOfSystemSystemMemoryRam.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemSystemMemoryRamCWProxy get copyWith =>
      _$SystemSystemMemoryRamCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemSystemMemoryRam _$SystemSystemMemoryRamFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SystemSystemMemoryRam', json, ($checkedConvert) {
  final val = SystemSystemMemoryRam(
    total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
    free: $checkedConvert('free', (v) => (v as num?)?.toInt()),
    used: $checkedConvert('used', (v) => (v as num?)?.toInt()),
    available: $checkedConvert('available', (v) => (v as num?)?.toInt()),
    percentUsed: $checkedConvert('%used', (v) => v as num?),
  );
  return val;
}, fieldKeyMap: const {'percentUsed': '%used'});

Map<String, dynamic> _$SystemSystemMemoryRamToJson(
  SystemSystemMemoryRam instance,
) => <String, dynamic>{
  'total': ?instance.total,
  'free': ?instance.free,
  'used': ?instance.used,
  'available': ?instance.available,
  '%used': ?instance.percentUsed,
};
