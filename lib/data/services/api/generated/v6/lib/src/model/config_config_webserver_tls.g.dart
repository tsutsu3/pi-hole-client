// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_webserver_tls.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigWebserverTlsCWProxy {
  ConfigConfigWebserverTls cert(String? cert);

  ConfigConfigWebserverTls validity(int? validity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverTls(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverTls(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverTls call({String? cert, int? validity});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigWebserverTls.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigWebserverTls.copyWith.fieldName(...)`
class _$ConfigConfigWebserverTlsCWProxyImpl
    implements _$ConfigConfigWebserverTlsCWProxy {
  const _$ConfigConfigWebserverTlsCWProxyImpl(this._value);

  final ConfigConfigWebserverTls _value;

  @override
  ConfigConfigWebserverTls cert(String? cert) => this(cert: cert);

  @override
  ConfigConfigWebserverTls validity(int? validity) => this(validity: validity);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigWebserverTls(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigWebserverTls(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigWebserverTls call({
    Object? cert = const $CopyWithPlaceholder(),
    Object? validity = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigWebserverTls(
      cert: cert == const $CopyWithPlaceholder()
          ? _value.cert
          // ignore: cast_nullable_to_non_nullable
          : cert as String?,
      validity: validity == const $CopyWithPlaceholder()
          ? _value.validity
          // ignore: cast_nullable_to_non_nullable
          : validity as int?,
    );
  }
}

extension $ConfigConfigWebserverTlsCopyWith on ConfigConfigWebserverTls {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigWebserverTls.copyWith(...)` or like so:`instanceOfConfigConfigWebserverTls.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigWebserverTlsCWProxy get copyWith =>
      _$ConfigConfigWebserverTlsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigWebserverTls _$ConfigConfigWebserverTlsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigWebserverTls', json, ($checkedConvert) {
  final val = ConfigConfigWebserverTls(
    cert: $checkedConvert('cert', (v) => v as String?),
    validity: $checkedConvert('validity', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigWebserverTlsToJson(
  ConfigConfigWebserverTls instance,
) => <String, dynamic>{'cert': ?instance.cert, 'validity': ?instance.validity};
