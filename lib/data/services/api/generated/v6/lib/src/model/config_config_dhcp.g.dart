// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_dhcp.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDhcpCWProxy {
  ConfigConfigDhcp active(bool? active);

  ConfigConfigDhcp start(String? start);

  ConfigConfigDhcp end(String? end);

  ConfigConfigDhcp router(String? router);

  ConfigConfigDhcp netmask(String? netmask);

  ConfigConfigDhcp leaseTime(String? leaseTime);

  ConfigConfigDhcp ipv6(bool? ipv6);

  ConfigConfigDhcp rapidCommit(bool? rapidCommit);

  ConfigConfigDhcp multiDNS(bool? multiDNS);

  ConfigConfigDhcp logging(bool? logging);

  ConfigConfigDhcp ignoreUnknownClients(bool? ignoreUnknownClients);

  ConfigConfigDhcp hosts(List<String>? hosts);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDhcp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDhcp(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDhcp call({
    bool? active,
    String? start,
    String? end,
    String? router,
    String? netmask,
    String? leaseTime,
    bool? ipv6,
    bool? rapidCommit,
    bool? multiDNS,
    bool? logging,
    bool? ignoreUnknownClients,
    List<String>? hosts,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDhcp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDhcp.copyWith.fieldName(...)`
class _$ConfigConfigDhcpCWProxyImpl implements _$ConfigConfigDhcpCWProxy {
  const _$ConfigConfigDhcpCWProxyImpl(this._value);

  final ConfigConfigDhcp _value;

  @override
  ConfigConfigDhcp active(bool? active) => this(active: active);

  @override
  ConfigConfigDhcp start(String? start) => this(start: start);

  @override
  ConfigConfigDhcp end(String? end) => this(end: end);

  @override
  ConfigConfigDhcp router(String? router) => this(router: router);

  @override
  ConfigConfigDhcp netmask(String? netmask) => this(netmask: netmask);

  @override
  ConfigConfigDhcp leaseTime(String? leaseTime) => this(leaseTime: leaseTime);

  @override
  ConfigConfigDhcp ipv6(bool? ipv6) => this(ipv6: ipv6);

  @override
  ConfigConfigDhcp rapidCommit(bool? rapidCommit) =>
      this(rapidCommit: rapidCommit);

  @override
  ConfigConfigDhcp multiDNS(bool? multiDNS) => this(multiDNS: multiDNS);

  @override
  ConfigConfigDhcp logging(bool? logging) => this(logging: logging);

  @override
  ConfigConfigDhcp ignoreUnknownClients(bool? ignoreUnknownClients) =>
      this(ignoreUnknownClients: ignoreUnknownClients);

  @override
  ConfigConfigDhcp hosts(List<String>? hosts) => this(hosts: hosts);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDhcp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDhcp(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDhcp call({
    Object? active = const $CopyWithPlaceholder(),
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
    Object? router = const $CopyWithPlaceholder(),
    Object? netmask = const $CopyWithPlaceholder(),
    Object? leaseTime = const $CopyWithPlaceholder(),
    Object? ipv6 = const $CopyWithPlaceholder(),
    Object? rapidCommit = const $CopyWithPlaceholder(),
    Object? multiDNS = const $CopyWithPlaceholder(),
    Object? logging = const $CopyWithPlaceholder(),
    Object? ignoreUnknownClients = const $CopyWithPlaceholder(),
    Object? hosts = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDhcp(
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as bool?,
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as String?,
      end: end == const $CopyWithPlaceholder()
          ? _value.end
          // ignore: cast_nullable_to_non_nullable
          : end as String?,
      router: router == const $CopyWithPlaceholder()
          ? _value.router
          // ignore: cast_nullable_to_non_nullable
          : router as String?,
      netmask: netmask == const $CopyWithPlaceholder()
          ? _value.netmask
          // ignore: cast_nullable_to_non_nullable
          : netmask as String?,
      leaseTime: leaseTime == const $CopyWithPlaceholder()
          ? _value.leaseTime
          // ignore: cast_nullable_to_non_nullable
          : leaseTime as String?,
      ipv6: ipv6 == const $CopyWithPlaceholder()
          ? _value.ipv6
          // ignore: cast_nullable_to_non_nullable
          : ipv6 as bool?,
      rapidCommit: rapidCommit == const $CopyWithPlaceholder()
          ? _value.rapidCommit
          // ignore: cast_nullable_to_non_nullable
          : rapidCommit as bool?,
      multiDNS: multiDNS == const $CopyWithPlaceholder()
          ? _value.multiDNS
          // ignore: cast_nullable_to_non_nullable
          : multiDNS as bool?,
      logging: logging == const $CopyWithPlaceholder()
          ? _value.logging
          // ignore: cast_nullable_to_non_nullable
          : logging as bool?,
      ignoreUnknownClients: ignoreUnknownClients == const $CopyWithPlaceholder()
          ? _value.ignoreUnknownClients
          // ignore: cast_nullable_to_non_nullable
          : ignoreUnknownClients as bool?,
      hosts: hosts == const $CopyWithPlaceholder()
          ? _value.hosts
          // ignore: cast_nullable_to_non_nullable
          : hosts as List<String>?,
    );
  }
}

extension $ConfigConfigDhcpCopyWith on ConfigConfigDhcp {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDhcp.copyWith(...)` or like so:`instanceOfConfigConfigDhcp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDhcpCWProxy get copyWith => _$ConfigConfigDhcpCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDhcp _$ConfigConfigDhcpFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConfigConfigDhcp', json, ($checkedConvert) {
      final val = ConfigConfigDhcp(
        active: $checkedConvert('active', (v) => v as bool?),
        start: $checkedConvert('start', (v) => v as String?),
        end: $checkedConvert('end', (v) => v as String?),
        router: $checkedConvert('router', (v) => v as String?),
        netmask: $checkedConvert('netmask', (v) => v as String?),
        leaseTime: $checkedConvert('leaseTime', (v) => v as String?),
        ipv6: $checkedConvert('ipv6', (v) => v as bool?),
        rapidCommit: $checkedConvert('rapidCommit', (v) => v as bool?),
        multiDNS: $checkedConvert('multiDNS', (v) => v as bool?),
        logging: $checkedConvert('logging', (v) => v as bool?),
        ignoreUnknownClients: $checkedConvert(
          'ignoreUnknownClients',
          (v) => v as bool?,
        ),
        hosts: $checkedConvert(
          'hosts',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConfigConfigDhcpToJson(ConfigConfigDhcp instance) =>
    <String, dynamic>{
      'active': ?instance.active,
      'start': ?instance.start,
      'end': ?instance.end,
      'router': ?instance.router,
      'netmask': ?instance.netmask,
      'leaseTime': ?instance.leaseTime,
      'ipv6': ?instance.ipv6,
      'rapidCommit': ?instance.rapidCommit,
      'multiDNS': ?instance.multiDNS,
      'logging': ?instance.logging,
      'ignoreUnknownClients': ?instance.ignoreUnknownClients,
      'hosts': ?instance.hosts,
    };
