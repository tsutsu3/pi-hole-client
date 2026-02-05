// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_misc_check.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigMiscCheckCWProxy {
  ConfigConfigMiscCheck load(bool? load);

  ConfigConfigMiscCheck shmem(int? shmem);

  ConfigConfigMiscCheck disk(int? disk);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigMiscCheck(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigMiscCheck(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigMiscCheck call({bool? load, int? shmem, int? disk});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigMiscCheck.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigMiscCheck.copyWith.fieldName(...)`
class _$ConfigConfigMiscCheckCWProxyImpl
    implements _$ConfigConfigMiscCheckCWProxy {
  const _$ConfigConfigMiscCheckCWProxyImpl(this._value);

  final ConfigConfigMiscCheck _value;

  @override
  ConfigConfigMiscCheck load(bool? load) => this(load: load);

  @override
  ConfigConfigMiscCheck shmem(int? shmem) => this(shmem: shmem);

  @override
  ConfigConfigMiscCheck disk(int? disk) => this(disk: disk);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigMiscCheck(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigMiscCheck(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigMiscCheck call({
    Object? load = const $CopyWithPlaceholder(),
    Object? shmem = const $CopyWithPlaceholder(),
    Object? disk = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigMiscCheck(
      load: load == const $CopyWithPlaceholder()
          ? _value.load
          // ignore: cast_nullable_to_non_nullable
          : load as bool?,
      shmem: shmem == const $CopyWithPlaceholder()
          ? _value.shmem
          // ignore: cast_nullable_to_non_nullable
          : shmem as int?,
      disk: disk == const $CopyWithPlaceholder()
          ? _value.disk
          // ignore: cast_nullable_to_non_nullable
          : disk as int?,
    );
  }
}

extension $ConfigConfigMiscCheckCopyWith on ConfigConfigMiscCheck {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigMiscCheck.copyWith(...)` or like so:`instanceOfConfigConfigMiscCheck.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigMiscCheckCWProxy get copyWith =>
      _$ConfigConfigMiscCheckCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigMiscCheck _$ConfigConfigMiscCheckFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigMiscCheck', json, ($checkedConvert) {
  final val = ConfigConfigMiscCheck(
    load: $checkedConvert('load', (v) => v as bool?),
    shmem: $checkedConvert('shmem', (v) => (v as num?)?.toInt()),
    disk: $checkedConvert('disk', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigMiscCheckToJson(
  ConfigConfigMiscCheck instance,
) => <String, dynamic>{
  'load': ?instance.load,
  'shmem': ?instance.shmem,
  'disk': ?instance.disk,
};
