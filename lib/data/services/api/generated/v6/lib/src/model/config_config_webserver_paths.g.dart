// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_webserver_paths.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigWebserverPathsCWProxy {
  ConfigConfigWebserverPaths webroot(String? webroot);

  ConfigConfigWebserverPaths webhome(String? webhome);

  ConfigConfigWebserverPaths prefix(String? prefix);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverPaths(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverPaths(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverPaths call({
    String? webroot,
    String? webhome,
    String? prefix,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigWebserverPaths.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigWebserverPaths.copyWith.fieldName(...)`
class _$ConfigConfigWebserverPathsCWProxyImpl
    implements _$ConfigConfigWebserverPathsCWProxy {
  const _$ConfigConfigWebserverPathsCWProxyImpl(this._value);

  final ConfigConfigWebserverPaths _value;

  @override
  ConfigConfigWebserverPaths webroot(String? webroot) => this(webroot: webroot);

  @override
  ConfigConfigWebserverPaths webhome(String? webhome) => this(webhome: webhome);

  @override
  ConfigConfigWebserverPaths prefix(String? prefix) => this(prefix: prefix);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverPaths(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverPaths(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverPaths call({
    Object? webroot = const $CopyWithPlaceholder(),
    Object? webhome = const $CopyWithPlaceholder(),
    Object? prefix = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigWebserverPaths(
      webroot: webroot == const $CopyWithPlaceholder()
          ? _value.webroot
          // ignore: cast_nullable_to_non_nullable
          : webroot as String?,
      webhome: webhome == const $CopyWithPlaceholder()
          ? _value.webhome
          // ignore: cast_nullable_to_non_nullable
          : webhome as String?,
      prefix: prefix == const $CopyWithPlaceholder()
          ? _value.prefix
          // ignore: cast_nullable_to_non_nullable
          : prefix as String?,
    );
  }
}

extension $ConfigConfigWebserverPathsCopyWith on ConfigConfigWebserverPaths {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigWebserverPaths.copyWith(...)` or like so:`instanceOfConfigConfigWebserverPaths.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigWebserverPathsCWProxy get copyWith =>
      _$ConfigConfigWebserverPathsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigWebserverPaths _$ConfigConfigWebserverPathsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigWebserverPaths', json, ($checkedConvert) {
  final val = ConfigConfigWebserverPaths(
    webroot: $checkedConvert('webroot', (v) => v as String?),
    webhome: $checkedConvert('webhome', (v) => v as String?),
    prefix: $checkedConvert('prefix', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigWebserverPathsToJson(
  ConfigConfigWebserverPaths instance,
) => <String, dynamic>{
  'webroot': ?instance.webroot,
  'webhome': ?instance.webhome,
  'prefix': ?instance.prefix,
};
