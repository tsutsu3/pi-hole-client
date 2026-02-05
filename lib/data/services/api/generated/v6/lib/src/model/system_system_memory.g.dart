// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_system_memory.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemSystemMemoryCWProxy {
  SystemSystemMemory ram(SystemSystemMemoryRam? ram);

  SystemSystemMemory swap(SystemSystemMemorySwap? swap);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemMemory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemMemory(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemMemory call({
    SystemSystemMemoryRam? ram,
    SystemSystemMemorySwap? swap,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSystemSystemMemory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSystemSystemMemory.copyWith.fieldName(...)`
class _$SystemSystemMemoryCWProxyImpl implements _$SystemSystemMemoryCWProxy {
  const _$SystemSystemMemoryCWProxyImpl(this._value);

  final SystemSystemMemory _value;

  @override
  SystemSystemMemory ram(SystemSystemMemoryRam? ram) => this(ram: ram);

  @override
  SystemSystemMemory swap(SystemSystemMemorySwap? swap) => this(swap: swap);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemMemory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemMemory(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemMemory call({
    Object? ram = const $CopyWithPlaceholder(),
    Object? swap = const $CopyWithPlaceholder(),
  }) {
    return SystemSystemMemory(
      ram: ram == const $CopyWithPlaceholder()
          ? _value.ram
          // ignore: cast_nullable_to_non_nullable
          : ram as SystemSystemMemoryRam?,
      swap: swap == const $CopyWithPlaceholder()
          ? _value.swap
          // ignore: cast_nullable_to_non_nullable
          : swap as SystemSystemMemorySwap?,
    );
  }
}

extension $SystemSystemMemoryCopyWith on SystemSystemMemory {
  /// Returns a callable class that can be used as follows: `instanceOfSystemSystemMemory.copyWith(...)` or like so:`instanceOfSystemSystemMemory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemSystemMemoryCWProxy get copyWith =>
      _$SystemSystemMemoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemSystemMemory _$SystemSystemMemoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SystemSystemMemory', json, ($checkedConvert) {
      final val = SystemSystemMemory(
        ram: $checkedConvert(
          'ram',
          (v) => v == null
              ? null
              : SystemSystemMemoryRam.fromJson(v as Map<String, dynamic>),
        ),
        swap: $checkedConvert(
          'swap',
          (v) => v == null
              ? null
              : SystemSystemMemorySwap.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SystemSystemMemoryToJson(SystemSystemMemory instance) =>
    <String, dynamic>{
      'ram': ?instance.ram?.toJson(),
      'swap': ?instance.swap?.toJson(),
    };
