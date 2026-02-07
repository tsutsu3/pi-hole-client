// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_dns_special_domains.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDnsSpecialDomainsCWProxy {
  ConfigConfigDnsSpecialDomains mozillaCanary(bool? mozillaCanary);

  ConfigConfigDnsSpecialDomains iCloudPrivateRelay(bool? iCloudPrivateRelay);

  ConfigConfigDnsSpecialDomains designatedResolver(bool? designatedResolver);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsSpecialDomains(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsSpecialDomains(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsSpecialDomains call({
    bool? mozillaCanary,
    bool? iCloudPrivateRelay,
    bool? designatedResolver,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDnsSpecialDomains.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDnsSpecialDomains.copyWith.fieldName(...)`
class _$ConfigConfigDnsSpecialDomainsCWProxyImpl
    implements _$ConfigConfigDnsSpecialDomainsCWProxy {
  const _$ConfigConfigDnsSpecialDomainsCWProxyImpl(this._value);

  final ConfigConfigDnsSpecialDomains _value;

  @override
  ConfigConfigDnsSpecialDomains mozillaCanary(bool? mozillaCanary) =>
      this(mozillaCanary: mozillaCanary);

  @override
  ConfigConfigDnsSpecialDomains iCloudPrivateRelay(bool? iCloudPrivateRelay) =>
      this(iCloudPrivateRelay: iCloudPrivateRelay);

  @override
  ConfigConfigDnsSpecialDomains designatedResolver(bool? designatedResolver) =>
      this(designatedResolver: designatedResolver);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDnsSpecialDomains(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDnsSpecialDomains(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDnsSpecialDomains call({
    Object? mozillaCanary = const $CopyWithPlaceholder(),
    Object? iCloudPrivateRelay = const $CopyWithPlaceholder(),
    Object? designatedResolver = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDnsSpecialDomains(
      mozillaCanary: mozillaCanary == const $CopyWithPlaceholder()
          ? _value.mozillaCanary
          // ignore: cast_nullable_to_non_nullable
          : mozillaCanary as bool?,
      iCloudPrivateRelay: iCloudPrivateRelay == const $CopyWithPlaceholder()
          ? _value.iCloudPrivateRelay
          // ignore: cast_nullable_to_non_nullable
          : iCloudPrivateRelay as bool?,
      designatedResolver: designatedResolver == const $CopyWithPlaceholder()
          ? _value.designatedResolver
          // ignore: cast_nullable_to_non_nullable
          : designatedResolver as bool?,
    );
  }
}

extension $ConfigConfigDnsSpecialDomainsCopyWith
    on ConfigConfigDnsSpecialDomains {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDnsSpecialDomains.copyWith(...)` or like so:`instanceOfConfigConfigDnsSpecialDomains.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDnsSpecialDomainsCWProxy get copyWith =>
      _$ConfigConfigDnsSpecialDomainsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDnsSpecialDomains _$ConfigConfigDnsSpecialDomainsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfigConfigDnsSpecialDomains', json, ($checkedConvert) {
  final val = ConfigConfigDnsSpecialDomains(
    mozillaCanary: $checkedConvert('mozillaCanary', (v) => v as bool?),
    iCloudPrivateRelay: $checkedConvert(
      'iCloudPrivateRelay',
      (v) => v as bool?,
    ),
    designatedResolver: $checkedConvert(
      'designatedResolver',
      (v) => v as bool?,
    ),
  );
  return val;
});

Map<String, dynamic> _$ConfigConfigDnsSpecialDomainsToJson(
  ConfigConfigDnsSpecialDomains instance,
) => <String, dynamic>{
  'mozillaCanary': ?instance.mozillaCanary,
  'iCloudPrivateRelay': ?instance.iCloudPrivateRelay,
  'designatedResolver': ?instance.designatedResolver,
};
