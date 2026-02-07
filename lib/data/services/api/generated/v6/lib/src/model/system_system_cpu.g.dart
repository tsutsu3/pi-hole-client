// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_system_cpu.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemSystemCpuCWProxy {
  SystemSystemCpu nprocs(int? nprocs);

  SystemSystemCpu percentCpu(num? percentCpu);

  SystemSystemCpu load(SystemSystemCpuLoad? load);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemCpu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemCpu(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemCpu call({
    int? nprocs,
    num? percentCpu,
    SystemSystemCpuLoad? load,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSystemSystemCpu.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSystemSystemCpu.copyWith.fieldName(...)`
class _$SystemSystemCpuCWProxyImpl implements _$SystemSystemCpuCWProxy {
  const _$SystemSystemCpuCWProxyImpl(this._value);

  final SystemSystemCpu _value;

  @override
  SystemSystemCpu nprocs(int? nprocs) => this(nprocs: nprocs);

  @override
  SystemSystemCpu percentCpu(num? percentCpu) => this(percentCpu: percentCpu);

  @override
  SystemSystemCpu load(SystemSystemCpuLoad? load) => this(load: load);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystemCpu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystemCpu(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystemCpu call({
    Object? nprocs = const $CopyWithPlaceholder(),
    Object? percentCpu = const $CopyWithPlaceholder(),
    Object? load = const $CopyWithPlaceholder(),
  }) {
    return SystemSystemCpu(
      nprocs: nprocs == const $CopyWithPlaceholder()
          ? _value.nprocs
          // ignore: cast_nullable_to_non_nullable
          : nprocs as int?,
      percentCpu: percentCpu == const $CopyWithPlaceholder()
          ? _value.percentCpu
          // ignore: cast_nullable_to_non_nullable
          : percentCpu as num?,
      load: load == const $CopyWithPlaceholder()
          ? _value.load
          // ignore: cast_nullable_to_non_nullable
          : load as SystemSystemCpuLoad?,
    );
  }
}

extension $SystemSystemCpuCopyWith on SystemSystemCpu {
  /// Returns a callable class that can be used as follows: `instanceOfSystemSystemCpu.copyWith(...)` or like so:`instanceOfSystemSystemCpu.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemSystemCpuCWProxy get copyWith => _$SystemSystemCpuCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemSystemCpu _$SystemSystemCpuFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SystemSystemCpu', json, ($checkedConvert) {
      final val = SystemSystemCpu(
        nprocs: $checkedConvert('nprocs', (v) => (v as num?)?.toInt()),
        percentCpu: $checkedConvert('%cpu', (v) => v as num?),
        load: $checkedConvert(
          'load',
          (v) => v == null
              ? null
              : SystemSystemCpuLoad.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'percentCpu': '%cpu'});

Map<String, dynamic> _$SystemSystemCpuToJson(SystemSystemCpu instance) =>
    <String, dynamic>{
      'nprocs': ?instance.nprocs,
      '%cpu': ?instance.percentCpu,
      'load': ?instance.load?.toJson(),
    };
