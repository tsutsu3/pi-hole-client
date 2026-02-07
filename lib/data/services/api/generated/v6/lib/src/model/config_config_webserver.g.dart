// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_webserver.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigWebserverCWProxy {
  ConfigConfigWebserver domain(String? domain);

  ConfigConfigWebserver acl(String? acl);

  ConfigConfigWebserver port(String? port);

  ConfigConfigWebserver threads(int? threads);

  ConfigConfigWebserver headers(List<String>? headers);

  ConfigConfigWebserver serveAll(bool? serveAll);

  ConfigConfigWebserver advancedOpts(List<String>? advancedOpts);

  ConfigConfigWebserver session(ConfigConfigWebserverSession? session);

  ConfigConfigWebserver tls(ConfigConfigWebserverTls? tls);

  ConfigConfigWebserver paths(ConfigConfigWebserverPaths? paths);

  ConfigConfigWebserver interface_(ConfigConfigWebserverInterface? interface_);

  ConfigConfigWebserver api(ConfigConfigWebserverApi? api);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserver(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserver(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserver call({
    String? domain,
    String? acl,
    String? port,
    int? threads,
    List<String>? headers,
    bool? serveAll,
    List<String>? advancedOpts,
    ConfigConfigWebserverSession? session,
    ConfigConfigWebserverTls? tls,
    ConfigConfigWebserverPaths? paths,
    ConfigConfigWebserverInterface? interface_,
    ConfigConfigWebserverApi? api,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigWebserver.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigWebserver.copyWith.fieldName(...)`
class _$ConfigConfigWebserverCWProxyImpl
    implements _$ConfigConfigWebserverCWProxy {
  const _$ConfigConfigWebserverCWProxyImpl(this._value);

  final ConfigConfigWebserver _value;

  @override
  ConfigConfigWebserver domain(String? domain) => this(domain: domain);

  @override
  ConfigConfigWebserver acl(String? acl) => this(acl: acl);

  @override
  ConfigConfigWebserver port(String? port) => this(port: port);

  @override
  ConfigConfigWebserver threads(int? threads) => this(threads: threads);

  @override
  ConfigConfigWebserver headers(List<String>? headers) =>
      this(headers: headers);

  @override
  ConfigConfigWebserver serveAll(bool? serveAll) => this(serveAll: serveAll);

  @override
  ConfigConfigWebserver advancedOpts(List<String>? advancedOpts) =>
      this(advancedOpts: advancedOpts);

  @override
  ConfigConfigWebserver session(ConfigConfigWebserverSession? session) =>
      this(session: session);

  @override
  ConfigConfigWebserver tls(ConfigConfigWebserverTls? tls) => this(tls: tls);

  @override
  ConfigConfigWebserver paths(ConfigConfigWebserverPaths? paths) =>
      this(paths: paths);

  @override
  ConfigConfigWebserver interface_(
    ConfigConfigWebserverInterface? interface_,
  ) => this(interface_: interface_);

  @override
  ConfigConfigWebserver api(ConfigConfigWebserverApi? api) => this(api: api);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserver(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserver(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserver call({
    Object? domain = const $CopyWithPlaceholder(),
    Object? acl = const $CopyWithPlaceholder(),
    Object? port = const $CopyWithPlaceholder(),
    Object? threads = const $CopyWithPlaceholder(),
    Object? headers = const $CopyWithPlaceholder(),
    Object? serveAll = const $CopyWithPlaceholder(),
    Object? advancedOpts = const $CopyWithPlaceholder(),
    Object? session = const $CopyWithPlaceholder(),
    Object? tls = const $CopyWithPlaceholder(),
    Object? paths = const $CopyWithPlaceholder(),
    Object? interface_ = const $CopyWithPlaceholder(),
    Object? api = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigWebserver(
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String?,
      acl: acl == const $CopyWithPlaceholder()
          ? _value.acl
          // ignore: cast_nullable_to_non_nullable
          : acl as String?,
      port: port == const $CopyWithPlaceholder()
          ? _value.port
          // ignore: cast_nullable_to_non_nullable
          : port as String?,
      threads: threads == const $CopyWithPlaceholder()
          ? _value.threads
          // ignore: cast_nullable_to_non_nullable
          : threads as int?,
      headers: headers == const $CopyWithPlaceholder()
          ? _value.headers
          // ignore: cast_nullable_to_non_nullable
          : headers as List<String>?,
      serveAll: serveAll == const $CopyWithPlaceholder()
          ? _value.serveAll
          // ignore: cast_nullable_to_non_nullable
          : serveAll as bool?,
      advancedOpts: advancedOpts == const $CopyWithPlaceholder()
          ? _value.advancedOpts
          // ignore: cast_nullable_to_non_nullable
          : advancedOpts as List<String>?,
      session: session == const $CopyWithPlaceholder()
          ? _value.session
          // ignore: cast_nullable_to_non_nullable
          : session as ConfigConfigWebserverSession?,
      tls: tls == const $CopyWithPlaceholder()
          ? _value.tls
          // ignore: cast_nullable_to_non_nullable
          : tls as ConfigConfigWebserverTls?,
      paths: paths == const $CopyWithPlaceholder()
          ? _value.paths
          // ignore: cast_nullable_to_non_nullable
          : paths as ConfigConfigWebserverPaths?,
      interface_: interface_ == const $CopyWithPlaceholder()
          ? _value.interface_
          // ignore: cast_nullable_to_non_nullable
          : interface_ as ConfigConfigWebserverInterface?,
      api: api == const $CopyWithPlaceholder()
          ? _value.api
          // ignore: cast_nullable_to_non_nullable
          : api as ConfigConfigWebserverApi?,
    );
  }
}

extension $ConfigConfigWebserverCopyWith on ConfigConfigWebserver {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigWebserver.copyWith(...)` or like so:`instanceOfConfigConfigWebserver.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigWebserverCWProxy get copyWith =>
      _$ConfigConfigWebserverCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigWebserver _$ConfigConfigWebserverFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ConfigConfigWebserver',
  json,
  ($checkedConvert) {
    final val = ConfigConfigWebserver(
      domain: $checkedConvert('domain', (v) => v as String?),
      acl: $checkedConvert('acl', (v) => v as String?),
      port: $checkedConvert('port', (v) => v as String?),
      threads: $checkedConvert('threads', (v) => (v as num?)?.toInt()),
      headers: $checkedConvert(
        'headers',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      serveAll: $checkedConvert('serve_all', (v) => v as bool?),
      advancedOpts: $checkedConvert(
        'advancedOpts',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      session: $checkedConvert(
        'session',
        (v) => v == null
            ? null
            : ConfigConfigWebserverSession.fromJson(v as Map<String, dynamic>),
      ),
      tls: $checkedConvert(
        'tls',
        (v) => v == null
            ? null
            : ConfigConfigWebserverTls.fromJson(v as Map<String, dynamic>),
      ),
      paths: $checkedConvert(
        'paths',
        (v) => v == null
            ? null
            : ConfigConfigWebserverPaths.fromJson(v as Map<String, dynamic>),
      ),
      interface_: $checkedConvert(
        'interface',
        (v) => v == null
            ? null
            : ConfigConfigWebserverInterface.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      api: $checkedConvert(
        'api',
        (v) => v == null
            ? null
            : ConfigConfigWebserverApi.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'serveAll': 'serve_all', 'interface_': 'interface'},
);

Map<String, dynamic> _$ConfigConfigWebserverToJson(
  ConfigConfigWebserver instance,
) => <String, dynamic>{
  'domain': ?instance.domain,
  'acl': ?instance.acl,
  'port': ?instance.port,
  'threads': ?instance.threads,
  'headers': ?instance.headers,
  'serve_all': ?instance.serveAll,
  'advancedOpts': ?instance.advancedOpts,
  'session': ?instance.session?.toJson(),
  'tls': ?instance.tls?.toJson(),
  'paths': ?instance.paths?.toJson(),
  'interface': ?instance.interface_?.toJson(),
  'api': ?instance.api?.toJson(),
};
