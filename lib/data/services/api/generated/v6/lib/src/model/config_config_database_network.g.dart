// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_database_network.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDatabaseNetworkCWProxy {
  ConfigConfigDatabaseNetwork parseARPcache(bool? parseARPcache);

  ConfigConfigDatabaseNetwork expire(int? expire);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDatabaseNetwork(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDatabaseNetwork(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDatabaseNetwork call({bool? parseARPcache, int? expire});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDatabaseNetwork.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDatabaseNetwork.copyWith.fieldName(...)`
class _$ConfigConfigDatabaseNetworkCWProxyImpl
    implements _$ConfigConfigDatabaseNetworkCWProxy {
  const _$ConfigConfigDatabaseNetworkCWProxyImpl(this._value);

  final ConfigConfigDatabaseNetwork _value;

  @override
  ConfigConfigDatabaseNetwork parseARPcache(bool? parseARPcache) =>
      this(parseARPcache: parseARPcache);

  @override
  ConfigConfigDatabaseNetwork expire(int? expire) => this(expire: expire);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDatabaseNetwork(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDatabaseNetwork(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDatabaseNetwork call({
    Object? parseARPcache = const $CopyWithPlaceholder(),
    Object? expire = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDatabaseNetwork(
      parseARPcache: parseARPcache == const $CopyWithPlaceholder()
          ? _value.parseARPcache
          // ignore: cast_nullable_to_non_nullable
          : parseARPcache as bool?,
      expire: expire == const $CopyWithPlaceholder()
          ? _value.expire
          // ignore: cast_nullable_to_non_nullable
          : expire as int?,
    );
  }
}

extension $ConfigConfigDatabaseNetworkCopyWith on ConfigConfigDatabaseNetwork {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDatabaseNetwork.copyWith(...)` or like so:`instanceOfConfigConfigDatabaseNetwork.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDatabaseNetworkCWProxy get copyWith =>
      _$ConfigConfigDatabaseNetworkCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDatabaseNetwork _$ConfigConfigDatabaseNetworkFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigDatabaseNetwork', json, ($checkedConvert) {
  final val = ConfigConfigDatabaseNetwork(
    parseARPcache: $checkedConvert('parseARPcache', (v) => v as bool?),
    expire: $checkedConvert('expire', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigDatabaseNetworkToJson(
  ConfigConfigDatabaseNetwork instance,
) => <String, dynamic>{
  'parseARPcache': ?instance.parseARPcache,
  'expire': ?instance.expire,
};
