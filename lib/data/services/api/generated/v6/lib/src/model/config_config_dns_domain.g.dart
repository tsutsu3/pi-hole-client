// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_dns_domain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDnsDomainCWProxy {
  ConfigConfigDnsDomain name(String? name);

  ConfigConfigDnsDomain local(bool? local);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsDomain(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsDomain call({String? name, bool? local});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDnsDomain.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDnsDomain.copyWith.fieldName(...)`
class _$ConfigConfigDnsDomainCWProxyImpl
    implements _$ConfigConfigDnsDomainCWProxy {
  const _$ConfigConfigDnsDomainCWProxyImpl(this._value);

  final ConfigConfigDnsDomain _value;

  @override
  ConfigConfigDnsDomain name(String? name) => this(name: name);

  @override
  ConfigConfigDnsDomain local(bool? local) => this(local: local);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsDomain(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsDomain(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsDomain call({
    Object? name = const $CopyWithPlaceholder(),
    Object? local = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDnsDomain(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      local: local == const $CopyWithPlaceholder()
          ? _value.local
          // ignore: cast_nullable_to_non_nullable
          : local as bool?,
    );
  }
}

extension $ConfigConfigDnsDomainCopyWith on ConfigConfigDnsDomain {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDnsDomain.copyWith(...)` or like so:`instanceOfConfigConfigDnsDomain.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDnsDomainCWProxy get copyWith =>
      _$ConfigConfigDnsDomainCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDnsDomain _$ConfigConfigDnsDomainFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigDnsDomain', json, ($checkedConvert) {
  final val = ConfigConfigDnsDomain(
    name: $checkedConvert('name', (v) => v as String?),
    local: $checkedConvert('local', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigDnsDomainToJson(
  ConfigConfigDnsDomain instance,
) => <String, dynamic>{'name': ?instance.name, 'local': ?instance.local};
