// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigCWProxy {
  ConfigConfig dns(ConfigConfigDns? dns);

  ConfigConfig dhcp(ConfigConfigDhcp? dhcp);

  ConfigConfig ntp(ConfigConfigNtp? ntp);

  ConfigConfig resolver(ConfigConfigResolver? resolver);

  ConfigConfig database(ConfigConfigDatabase? database);

  ConfigConfig webserver(ConfigConfigWebserver? webserver);

  ConfigConfig files(ConfigConfigFiles? files);

  ConfigConfig misc(ConfigConfigMisc? misc);

  ConfigConfig debug(ConfigConfigDebug? debug);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfig call({
    ConfigConfigDns? dns,
    ConfigConfigDhcp? dhcp,
    ConfigConfigNtp? ntp,
    ConfigConfigResolver? resolver,
    ConfigConfigDatabase? database,
    ConfigConfigWebserver? webserver,
    ConfigConfigFiles? files,
    ConfigConfigMisc? misc,
    ConfigConfigDebug? debug,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfig.copyWith.fieldName(...)`
class _$ConfigConfigCWProxyImpl implements _$ConfigConfigCWProxy {
  const _$ConfigConfigCWProxyImpl(this._value);

  final ConfigConfig _value;

  @override
  ConfigConfig dns(ConfigConfigDns? dns) => this(dns: dns);

  @override
  ConfigConfig dhcp(ConfigConfigDhcp? dhcp) => this(dhcp: dhcp);

  @override
  ConfigConfig ntp(ConfigConfigNtp? ntp) => this(ntp: ntp);

  @override
  ConfigConfig resolver(ConfigConfigResolver? resolver) =>
      this(resolver: resolver);

  @override
  ConfigConfig database(ConfigConfigDatabase? database) =>
      this(database: database);

  @override
  ConfigConfig webserver(ConfigConfigWebserver? webserver) =>
      this(webserver: webserver);

  @override
  ConfigConfig files(ConfigConfigFiles? files) => this(files: files);

  @override
  ConfigConfig misc(ConfigConfigMisc? misc) => this(misc: misc);

  @override
  ConfigConfig debug(ConfigConfigDebug? debug) => this(debug: debug);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfig call({
    Object? dns = const $CopyWithPlaceholder(),
    Object? dhcp = const $CopyWithPlaceholder(),
    Object? ntp = const $CopyWithPlaceholder(),
    Object? resolver = const $CopyWithPlaceholder(),
    Object? database = const $CopyWithPlaceholder(),
    Object? webserver = const $CopyWithPlaceholder(),
    Object? files = const $CopyWithPlaceholder(),
    Object? misc = const $CopyWithPlaceholder(),
    Object? debug = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfig(
      dns: dns == const $CopyWithPlaceholder()
          ? _value.dns
          // ignore: cast_nullable_to_non_nullable
          : dns as ConfigConfigDns?,
      dhcp: dhcp == const $CopyWithPlaceholder()
          ? _value.dhcp
          // ignore: cast_nullable_to_non_nullable
          : dhcp as ConfigConfigDhcp?,
      ntp: ntp == const $CopyWithPlaceholder()
          ? _value.ntp
          // ignore: cast_nullable_to_non_nullable
          : ntp as ConfigConfigNtp?,
      resolver: resolver == const $CopyWithPlaceholder()
          ? _value.resolver
          // ignore: cast_nullable_to_non_nullable
          : resolver as ConfigConfigResolver?,
      database: database == const $CopyWithPlaceholder()
          ? _value.database
          // ignore: cast_nullable_to_non_nullable
          : database as ConfigConfigDatabase?,
      webserver: webserver == const $CopyWithPlaceholder()
          ? _value.webserver
          // ignore: cast_nullable_to_non_nullable
          : webserver as ConfigConfigWebserver?,
      files: files == const $CopyWithPlaceholder()
          ? _value.files
          // ignore: cast_nullable_to_non_nullable
          : files as ConfigConfigFiles?,
      misc: misc == const $CopyWithPlaceholder()
          ? _value.misc
          // ignore: cast_nullable_to_non_nullable
          : misc as ConfigConfigMisc?,
      debug: debug == const $CopyWithPlaceholder()
          ? _value.debug
          // ignore: cast_nullable_to_non_nullable
          : debug as ConfigConfigDebug?,
    );
  }
}

extension $ConfigConfigCopyWith on ConfigConfig {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfig.copyWith(...)` or like so:`instanceOfConfigConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigCWProxy get copyWith => _$ConfigConfigCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfig _$ConfigConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConfigConfig', json, ($checkedConvert) {
      final val = ConfigConfig(
        dns: $checkedConvert(
          'dns',
          (v) => v == null
              ? null
              : ConfigConfigDns.fromJson(v as Map<String, dynamic>),
        ),
        dhcp: $checkedConvert(
          'dhcp',
          (v) => v == null
              ? null
              : ConfigConfigDhcp.fromJson(v as Map<String, dynamic>),
        ),
        ntp: $checkedConvert(
          'ntp',
          (v) => v == null
              ? null
              : ConfigConfigNtp.fromJson(v as Map<String, dynamic>),
        ),
        resolver: $checkedConvert(
          'resolver',
          (v) => v == null
              ? null
              : ConfigConfigResolver.fromJson(v as Map<String, dynamic>),
        ),
        database: $checkedConvert(
          'database',
          (v) => v == null
              ? null
              : ConfigConfigDatabase.fromJson(v as Map<String, dynamic>),
        ),
        webserver: $checkedConvert(
          'webserver',
          (v) => v == null
              ? null
              : ConfigConfigWebserver.fromJson(v as Map<String, dynamic>),
        ),
        files: $checkedConvert(
          'files',
          (v) => v == null
              ? null
              : ConfigConfigFiles.fromJson(v as Map<String, dynamic>),
        ),
        misc: $checkedConvert(
          'misc',
          (v) => v == null
              ? null
              : ConfigConfigMisc.fromJson(v as Map<String, dynamic>),
        ),
        debug: $checkedConvert(
          'debug',
          (v) => v == null
              ? null
              : ConfigConfigDebug.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConfigConfigToJson(ConfigConfig instance) =>
    <String, dynamic>{
      'dns': ?instance.dns?.toJson(),
      'dhcp': ?instance.dhcp?.toJson(),
      'ntp': ?instance.ntp?.toJson(),
      'resolver': ?instance.resolver?.toJson(),
      'database': ?instance.database?.toJson(),
      'webserver': ?instance.webserver?.toJson(),
      'files': ?instance.files?.toJson(),
      'misc': ?instance.misc?.toJson(),
      'debug': ?instance.debug?.toJson(),
    };
