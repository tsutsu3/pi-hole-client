// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_resolver.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigResolverCWProxy {
  ConfigConfigResolver resolveIPv4(bool? resolveIPv4);

  ConfigConfigResolver resolveIPv6(bool? resolveIPv6);

  ConfigConfigResolver networkNames(bool? networkNames);

  ConfigConfigResolver refreshNames(String? refreshNames);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigResolver(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigResolver(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigResolver call({
    bool? resolveIPv4,
    bool? resolveIPv6,
    bool? networkNames,
    String? refreshNames,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigResolver.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigResolver.copyWith.fieldName(...)`
class _$ConfigConfigResolverCWProxyImpl
    implements _$ConfigConfigResolverCWProxy {
  const _$ConfigConfigResolverCWProxyImpl(this._value);

  final ConfigConfigResolver _value;

  @override
  ConfigConfigResolver resolveIPv4(bool? resolveIPv4) =>
      this(resolveIPv4: resolveIPv4);

  @override
  ConfigConfigResolver resolveIPv6(bool? resolveIPv6) =>
      this(resolveIPv6: resolveIPv6);

  @override
  ConfigConfigResolver networkNames(bool? networkNames) =>
      this(networkNames: networkNames);

  @override
  ConfigConfigResolver refreshNames(String? refreshNames) =>
      this(refreshNames: refreshNames);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigResolver(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigResolver(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigResolver call({
    Object? resolveIPv4 = const $CopyWithPlaceholder(),
    Object? resolveIPv6 = const $CopyWithPlaceholder(),
    Object? networkNames = const $CopyWithPlaceholder(),
    Object? refreshNames = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigResolver(
      resolveIPv4: resolveIPv4 == const $CopyWithPlaceholder()
          ? _value.resolveIPv4
          // ignore: cast_nullable_to_non_nullable
          : resolveIPv4 as bool?,
      resolveIPv6: resolveIPv6 == const $CopyWithPlaceholder()
          ? _value.resolveIPv6
          // ignore: cast_nullable_to_non_nullable
          : resolveIPv6 as bool?,
      networkNames: networkNames == const $CopyWithPlaceholder()
          ? _value.networkNames
          // ignore: cast_nullable_to_non_nullable
          : networkNames as bool?,
      refreshNames: refreshNames == const $CopyWithPlaceholder()
          ? _value.refreshNames
          // ignore: cast_nullable_to_non_nullable
          : refreshNames as String?,
    );
  }
}

extension $ConfigConfigResolverCopyWith on ConfigConfigResolver {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigResolver.copyWith(...)` or like so:`instanceOfConfigConfigResolver.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigResolverCWProxy get copyWith =>
      _$ConfigConfigResolverCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigResolver _$ConfigConfigResolverFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigResolver', json, ($checkedConvert) {
  final val = ConfigConfigResolver(
    resolveIPv4: $checkedConvert('resolveIPv4', (v) => v as bool?),
    resolveIPv6: $checkedConvert('resolveIPv6', (v) => v as bool?),
    networkNames: $checkedConvert('networkNames', (v) => v as bool?),
    refreshNames: $checkedConvert('refreshNames', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigResolverToJson(
  ConfigConfigResolver instance,
) => <String, dynamic>{
  'resolveIPv4': ?instance.resolveIPv4,
  'resolveIPv6': ?instance.resolveIPv6,
  'networkNames': ?instance.networkNames,
  'refreshNames': ?instance.refreshNames,
};
