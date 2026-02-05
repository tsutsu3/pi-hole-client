// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_config.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddConfigCWProxy {
  PaddConfig dhcpActive(bool? dhcpActive);

  PaddConfig dhcpStart(String? dhcpStart);

  PaddConfig dhcpEnd(String? dhcpEnd);

  PaddConfig dhcpIpv6(bool? dhcpIpv6);

  PaddConfig dnsDomain(String? dnsDomain);

  PaddConfig dnsPort(int? dnsPort);

  PaddConfig dnsNumUpstreams(int? dnsNumUpstreams);

  PaddConfig dnsDnssec(bool? dnsDnssec);

  PaddConfig dnsRevServerActive(bool? dnsRevServerActive);

  PaddConfig privacyLevel(int? privacyLevel);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddConfig call({
    bool? dhcpActive,
    String? dhcpStart,
    String? dhcpEnd,
    bool? dhcpIpv6,
    String? dnsDomain,
    int? dnsPort,
    int? dnsNumUpstreams,
    bool? dnsDnssec,
    bool? dnsRevServerActive,
    int? privacyLevel,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddConfig.copyWith.fieldName(...)`
class _$PaddConfigCWProxyImpl implements _$PaddConfigCWProxy {
  const _$PaddConfigCWProxyImpl(this._value);

  final PaddConfig _value;

  @override
  PaddConfig dhcpActive(bool? dhcpActive) => this(dhcpActive: dhcpActive);

  @override
  PaddConfig dhcpStart(String? dhcpStart) => this(dhcpStart: dhcpStart);

  @override
  PaddConfig dhcpEnd(String? dhcpEnd) => this(dhcpEnd: dhcpEnd);

  @override
  PaddConfig dhcpIpv6(bool? dhcpIpv6) => this(dhcpIpv6: dhcpIpv6);

  @override
  PaddConfig dnsDomain(String? dnsDomain) => this(dnsDomain: dnsDomain);

  @override
  PaddConfig dnsPort(int? dnsPort) => this(dnsPort: dnsPort);

  @override
  PaddConfig dnsNumUpstreams(int? dnsNumUpstreams) =>
      this(dnsNumUpstreams: dnsNumUpstreams);

  @override
  PaddConfig dnsDnssec(bool? dnsDnssec) => this(dnsDnssec: dnsDnssec);

  @override
  PaddConfig dnsRevServerActive(bool? dnsRevServerActive) =>
      this(dnsRevServerActive: dnsRevServerActive);

  @override
  PaddConfig privacyLevel(int? privacyLevel) =>
      this(privacyLevel: privacyLevel);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddConfig call({
    Object? dhcpActive = const $CopyWithPlaceholder(),
    Object? dhcpStart = const $CopyWithPlaceholder(),
    Object? dhcpEnd = const $CopyWithPlaceholder(),
    Object? dhcpIpv6 = const $CopyWithPlaceholder(),
    Object? dnsDomain = const $CopyWithPlaceholder(),
    Object? dnsPort = const $CopyWithPlaceholder(),
    Object? dnsNumUpstreams = const $CopyWithPlaceholder(),
    Object? dnsDnssec = const $CopyWithPlaceholder(),
    Object? dnsRevServerActive = const $CopyWithPlaceholder(),
    Object? privacyLevel = const $CopyWithPlaceholder(),
  }) {
    return PaddConfig(
      dhcpActive: dhcpActive == const $CopyWithPlaceholder()
          ? _value.dhcpActive
          // ignore: cast_nullable_to_non_nullable
          : dhcpActive as bool?,
      dhcpStart: dhcpStart == const $CopyWithPlaceholder()
          ? _value.dhcpStart
          // ignore: cast_nullable_to_non_nullable
          : dhcpStart as String?,
      dhcpEnd: dhcpEnd == const $CopyWithPlaceholder()
          ? _value.dhcpEnd
          // ignore: cast_nullable_to_non_nullable
          : dhcpEnd as String?,
      dhcpIpv6: dhcpIpv6 == const $CopyWithPlaceholder()
          ? _value.dhcpIpv6
          // ignore: cast_nullable_to_non_nullable
          : dhcpIpv6 as bool?,
      dnsDomain: dnsDomain == const $CopyWithPlaceholder()
          ? _value.dnsDomain
          // ignore: cast_nullable_to_non_nullable
          : dnsDomain as String?,
      dnsPort: dnsPort == const $CopyWithPlaceholder()
          ? _value.dnsPort
          // ignore: cast_nullable_to_non_nullable
          : dnsPort as int?,
      dnsNumUpstreams: dnsNumUpstreams == const $CopyWithPlaceholder()
          ? _value.dnsNumUpstreams
          // ignore: cast_nullable_to_non_nullable
          : dnsNumUpstreams as int?,
      dnsDnssec: dnsDnssec == const $CopyWithPlaceholder()
          ? _value.dnsDnssec
          // ignore: cast_nullable_to_non_nullable
          : dnsDnssec as bool?,
      dnsRevServerActive: dnsRevServerActive == const $CopyWithPlaceholder()
          ? _value.dnsRevServerActive
          // ignore: cast_nullable_to_non_nullable
          : dnsRevServerActive as bool?,
      privacyLevel: privacyLevel == const $CopyWithPlaceholder()
          ? _value.privacyLevel
          // ignore: cast_nullable_to_non_nullable
          : privacyLevel as int?,
    );
  }
}

extension $PaddConfigCopyWith on PaddConfig {
  /// Returns a callable class that can be used as follows: `instanceOfPaddConfig.copyWith(...)` or like so:`instanceOfPaddConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddConfigCWProxy get copyWith => _$PaddConfigCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddConfig _$PaddConfigFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PaddConfig',
  json,
  ($checkedConvert) {
    final val = PaddConfig(
      dhcpActive: $checkedConvert('dhcp_active', (v) => v as bool?),
      dhcpStart: $checkedConvert('dhcp_start', (v) => v as String?),
      dhcpEnd: $checkedConvert('dhcp_end', (v) => v as String?),
      dhcpIpv6: $checkedConvert('dhcp_ipv6', (v) => v as bool?),
      dnsDomain: $checkedConvert('dns_domain', (v) => v as String?),
      dnsPort: $checkedConvert('dns_port', (v) => (v as num?)?.toInt()),
      dnsNumUpstreams: $checkedConvert(
        'dns_num_upstreams',
        (v) => (v as num?)?.toInt(),
      ),
      dnsDnssec: $checkedConvert('dns_dnssec', (v) => v as bool?),
      dnsRevServerActive: $checkedConvert(
        'dns_revServer_active',
        (v) => v as bool?,
      ),
      privacyLevel: $checkedConvert(
        'privacy_level',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dhcpActive': 'dhcp_active',
    'dhcpStart': 'dhcp_start',
    'dhcpEnd': 'dhcp_end',
    'dhcpIpv6': 'dhcp_ipv6',
    'dnsDomain': 'dns_domain',
    'dnsPort': 'dns_port',
    'dnsNumUpstreams': 'dns_num_upstreams',
    'dnsDnssec': 'dns_dnssec',
    'dnsRevServerActive': 'dns_revServer_active',
    'privacyLevel': 'privacy_level',
  },
);

Map<String, dynamic> _$PaddConfigToJson(PaddConfig instance) =>
    <String, dynamic>{
      'dhcp_active': ?instance.dhcpActive,
      'dhcp_start': ?instance.dhcpStart,
      'dhcp_end': ?instance.dhcpEnd,
      'dhcp_ipv6': ?instance.dhcpIpv6,
      'dns_domain': ?instance.dnsDomain,
      'dns_port': ?instance.dnsPort,
      'dns_num_upstreams': ?instance.dnsNumUpstreams,
      'dns_dnssec': ?instance.dnsDnssec,
      'dns_revServer_active': ?instance.dnsRevServerActive,
      'privacy_level': ?instance.privacyLevel,
    };
