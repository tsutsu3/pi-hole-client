// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_system.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SystemSystemCWProxy {
  SystemSystem uptime(int? uptime);

  SystemSystem memory(SystemSystemMemory? memory);

  SystemSystem procs(int? procs);

  SystemSystem cpu(SystemSystemCpu? cpu);

  SystemSystem ftl(SystemSystemFtl? ftl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystem(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystem call({
    int? uptime,
    SystemSystemMemory? memory,
    int? procs,
    SystemSystemCpu? cpu,
    SystemSystemFtl? ftl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSystemSystem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSystemSystem.copyWith.fieldName(...)`
class _$SystemSystemCWProxyImpl implements _$SystemSystemCWProxy {
  const _$SystemSystemCWProxyImpl(this._value);

  final SystemSystem _value;

  @override
  SystemSystem uptime(int? uptime) => this(uptime: uptime);

  @override
  SystemSystem memory(SystemSystemMemory? memory) => this(memory: memory);

  @override
  SystemSystem procs(int? procs) => this(procs: procs);

  @override
  SystemSystem cpu(SystemSystemCpu? cpu) => this(cpu: cpu);

  @override
  SystemSystem ftl(SystemSystemFtl? ftl) => this(ftl: ftl);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SystemSystem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SystemSystem(...).copyWith(id: 12, name: "My name")
  /// ````
  SystemSystem call({
    Object? uptime = const $CopyWithPlaceholder(),
    Object? memory = const $CopyWithPlaceholder(),
    Object? procs = const $CopyWithPlaceholder(),
    Object? cpu = const $CopyWithPlaceholder(),
    Object? ftl = const $CopyWithPlaceholder(),
  }) {
    return SystemSystem(
      uptime: uptime == const $CopyWithPlaceholder()
          ? _value.uptime
          // ignore: cast_nullable_to_non_nullable
          : uptime as int?,
      memory: memory == const $CopyWithPlaceholder()
          ? _value.memory
          // ignore: cast_nullable_to_non_nullable
          : memory as SystemSystemMemory?,
      procs: procs == const $CopyWithPlaceholder()
          ? _value.procs
          // ignore: cast_nullable_to_non_nullable
          : procs as int?,
      cpu: cpu == const $CopyWithPlaceholder()
          ? _value.cpu
          // ignore: cast_nullable_to_non_nullable
          : cpu as SystemSystemCpu?,
      ftl: ftl == const $CopyWithPlaceholder()
          ? _value.ftl
          // ignore: cast_nullable_to_non_nullable
          : ftl as SystemSystemFtl?,
    );
  }
}

extension $SystemSystemCopyWith on SystemSystem {
  /// Returns a callable class that can be used as follows: `instanceOfSystemSystem.copyWith(...)` or like so:`instanceOfSystemSystem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SystemSystemCWProxy get copyWith => _$SystemSystemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemSystem _$SystemSystemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SystemSystem', json, ($checkedConvert) {
      final val = SystemSystem(
        uptime: $checkedConvert('uptime', (v) => (v as num?)?.toInt()),
        memory: $checkedConvert(
          'memory',
          (v) => v == null
              ? null
              : SystemSystemMemory.fromJson(v as Map<String, dynamic>),
        ),
        procs: $checkedConvert('procs', (v) => (v as num?)?.toInt()),
        cpu: $checkedConvert(
          'cpu',
          (v) => v == null
              ? null
              : SystemSystemCpu.fromJson(v as Map<String, dynamic>),
        ),
        ftl: $checkedConvert(
          'ftl',
          (v) => v == null
              ? null
              : SystemSystemFtl.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SystemSystemToJson(SystemSystem instance) =>
    <String, dynamic>{
      'uptime': ?instance.uptime,
      'memory': ?instance.memory?.toJson(),
      'procs': ?instance.procs,
      'cpu': ?instance.cpu?.toJson(),
      'ftl': ?instance.ftl?.toJson(),
    };
