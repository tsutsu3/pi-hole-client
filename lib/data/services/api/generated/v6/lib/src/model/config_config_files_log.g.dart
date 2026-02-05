// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_files_log.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigFilesLogCWProxy {
  ConfigConfigFilesLog ftl(String? ftl);

  ConfigConfigFilesLog dnsmasq(String? dnsmasq);

  ConfigConfigFilesLog webserver(String? webserver);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigFilesLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigFilesLog(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigFilesLog call({String? ftl, String? dnsmasq, String? webserver});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigFilesLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigFilesLog.copyWith.fieldName(...)`
class _$ConfigConfigFilesLogCWProxyImpl
    implements _$ConfigConfigFilesLogCWProxy {
  const _$ConfigConfigFilesLogCWProxyImpl(this._value);

  final ConfigConfigFilesLog _value;

  @override
  ConfigConfigFilesLog ftl(String? ftl) => this(ftl: ftl);

  @override
  ConfigConfigFilesLog dnsmasq(String? dnsmasq) => this(dnsmasq: dnsmasq);

  @override
  ConfigConfigFilesLog webserver(String? webserver) =>
      this(webserver: webserver);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigFilesLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigFilesLog(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigFilesLog call({
    Object? ftl = const $CopyWithPlaceholder(),
    Object? dnsmasq = const $CopyWithPlaceholder(),
    Object? webserver = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigFilesLog(
      ftl: ftl == const $CopyWithPlaceholder()
          ? _value.ftl
          // ignore: cast_nullable_to_non_nullable
          : ftl as String?,
      dnsmasq: dnsmasq == const $CopyWithPlaceholder()
          ? _value.dnsmasq
          // ignore: cast_nullable_to_non_nullable
          : dnsmasq as String?,
      webserver: webserver == const $CopyWithPlaceholder()
          ? _value.webserver
          // ignore: cast_nullable_to_non_nullable
          : webserver as String?,
    );
  }
}

extension $ConfigConfigFilesLogCopyWith on ConfigConfigFilesLog {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigFilesLog.copyWith(...)` or like so:`instanceOfConfigConfigFilesLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigFilesLogCWProxy get copyWith =>
      _$ConfigConfigFilesLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigFilesLog _$ConfigConfigFilesLogFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigFilesLog', json, ($checkedConvert) {
  final val = ConfigConfigFilesLog(
    ftl: $checkedConvert('ftl', (v) => v as String?),
    dnsmasq: $checkedConvert('dnsmasq', (v) => v as String?),
    webserver: $checkedConvert('webserver', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigFilesLogToJson(
  ConfigConfigFilesLog instance,
) => <String, dynamic>{
  'ftl': ?instance.ftl,
  'dnsmasq': ?instance.dnsmasq,
  'webserver': ?instance.webserver,
};
