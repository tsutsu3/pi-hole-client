// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_files.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigFilesCWProxy {
  ConfigConfigFiles pid(String? pid);

  ConfigConfigFiles database(String? database);

  ConfigConfigFiles gravity(String? gravity);

  ConfigConfigFiles gravityTmp(String? gravityTmp);

  ConfigConfigFiles macvendor(String? macvendor);

  ConfigConfigFiles pcap(String? pcap);

  ConfigConfigFiles log(ConfigConfigFilesLog? log);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigFiles(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigFiles(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigFiles call({
    String? pid,
    String? database,
    String? gravity,
    String? gravityTmp,
    String? macvendor,
    String? pcap,
    ConfigConfigFilesLog? log,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigFiles.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigFiles.copyWith.fieldName(...)`
class _$ConfigConfigFilesCWProxyImpl implements _$ConfigConfigFilesCWProxy {
  const _$ConfigConfigFilesCWProxyImpl(this._value);

  final ConfigConfigFiles _value;

  @override
  ConfigConfigFiles pid(String? pid) => this(pid: pid);

  @override
  ConfigConfigFiles database(String? database) => this(database: database);

  @override
  ConfigConfigFiles gravity(String? gravity) => this(gravity: gravity);

  @override
  ConfigConfigFiles gravityTmp(String? gravityTmp) =>
      this(gravityTmp: gravityTmp);

  @override
  ConfigConfigFiles macvendor(String? macvendor) => this(macvendor: macvendor);

  @override
  ConfigConfigFiles pcap(String? pcap) => this(pcap: pcap);

  @override
  ConfigConfigFiles log(ConfigConfigFilesLog? log) => this(log: log);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigFiles(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigFiles(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigFiles call({
    Object? pid = const $CopyWithPlaceholder(),
    Object? database = const $CopyWithPlaceholder(),
    Object? gravity = const $CopyWithPlaceholder(),
    Object? gravityTmp = const $CopyWithPlaceholder(),
    Object? macvendor = const $CopyWithPlaceholder(),
    Object? pcap = const $CopyWithPlaceholder(),
    Object? log = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigFiles(
      pid: pid == const $CopyWithPlaceholder()
          ? _value.pid
          // ignore: cast_nullable_to_non_nullable
          : pid as String?,
      database: database == const $CopyWithPlaceholder()
          ? _value.database
          // ignore: cast_nullable_to_non_nullable
          : database as String?,
      gravity: gravity == const $CopyWithPlaceholder()
          ? _value.gravity
          // ignore: cast_nullable_to_non_nullable
          : gravity as String?,
      gravityTmp: gravityTmp == const $CopyWithPlaceholder()
          ? _value.gravityTmp
          // ignore: cast_nullable_to_non_nullable
          : gravityTmp as String?,
      macvendor: macvendor == const $CopyWithPlaceholder()
          ? _value.macvendor
          // ignore: cast_nullable_to_non_nullable
          : macvendor as String?,
      pcap: pcap == const $CopyWithPlaceholder()
          ? _value.pcap
          // ignore: cast_nullable_to_non_nullable
          : pcap as String?,
      log: log == const $CopyWithPlaceholder()
          ? _value.log
          // ignore: cast_nullable_to_non_nullable
          : log as ConfigConfigFilesLog?,
    );
  }
}

extension $ConfigConfigFilesCopyWith on ConfigConfigFiles {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigFiles.copyWith(...)` or like so:`instanceOfConfigConfigFiles.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigFilesCWProxy get copyWith =>
      _$ConfigConfigFilesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigFiles _$ConfigConfigFilesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConfigConfigFiles', json, ($checkedConvert) {
      final val = ConfigConfigFiles(
        pid: $checkedConvert('pid', (v) => v as String?),
        database: $checkedConvert('database', (v) => v as String?),
        gravity: $checkedConvert('gravity', (v) => v as String?),
        gravityTmp: $checkedConvert('gravity_tmp', (v) => v as String?),
        macvendor: $checkedConvert('macvendor', (v) => v as String?),
        pcap: $checkedConvert('pcap', (v) => v as String?),
        log: $checkedConvert(
          'log',
          (v) => v == null
              ? null
              : ConfigConfigFilesLog.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'gravityTmp': 'gravity_tmp'});

Map<String, dynamic> _$ConfigConfigFilesToJson(ConfigConfigFiles instance) =>
    <String, dynamic>{
      'pid': ?instance.pid,
      'database': ?instance.database,
      'gravity': ?instance.gravity,
      'gravity_tmp': ?instance.gravityTmp,
      'macvendor': ?instance.macvendor,
      'pcap': ?instance.pcap,
      'log': ?instance.log?.toJson(),
    };
