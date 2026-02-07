// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_system_cpu_load.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemSystemCpuLoadCWProxy {
  SystemSystemCpuLoad raw(List<num>? raw);

  SystemSystemCpuLoad percent(List<num>? percent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemCpuLoad(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemCpuLoad(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemCpuLoad call({List<num>? raw, List<num>? percent});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSystemSystemCpuLoad.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSystemSystemCpuLoad.copyWith.fieldName(...)`
class _$SystemSystemCpuLoadCWProxyImpl implements _$SystemSystemCpuLoadCWProxy {
  const _$SystemSystemCpuLoadCWProxyImpl(this._value);

  final SystemSystemCpuLoad _value;

  @override
  SystemSystemCpuLoad raw(List<num>? raw) => this(raw: raw);

  @override
  SystemSystemCpuLoad percent(List<num>? percent) => this(percent: percent);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemCpuLoad(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemCpuLoad(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemCpuLoad call({
    Object? raw = const $CopyWithPlaceholder(),
    Object? percent = const $CopyWithPlaceholder(),
  }) {
    return SystemSystemCpuLoad(
      raw: raw == const $CopyWithPlaceholder()
          ? _value.raw
          // ignore: cast_nullable_to_non_nullable
          : raw as List<num>?,
      percent: percent == const $CopyWithPlaceholder()
          ? _value.percent
          // ignore: cast_nullable_to_non_nullable
          : percent as List<num>?,
    );
  }
}

extension $SystemSystemCpuLoadCopyWith on SystemSystemCpuLoad {
  /// Returns a callable class that can be used as follows: `instanceOfSystemSystemCpuLoad.copyWith(...)` or like so:`instanceOfSystemSystemCpuLoad.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemSystemCpuLoadCWProxy get copyWith =>
      _$SystemSystemCpuLoadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemSystemCpuLoad _$SystemSystemCpuLoadFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SystemSystemCpuLoad', json, ($checkedConvert) {
      final val = SystemSystemCpuLoad(
        raw: $checkedConvert(
          'raw',
          (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
        ),
        percent: $checkedConvert(
          'percent',
          (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SystemSystemCpuLoadToJson(
  SystemSystemCpuLoad instance,
) => <String, dynamic>{'raw': ?instance.raw, 'percent': ?instance.percent};
