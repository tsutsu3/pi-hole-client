// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dns_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DnsConfig _$DnsConfigFromJson(Map<String, dynamic> json) => _DnsConfig(
  queryLogging: json['queryLogging'] as bool,
  upstreams: (json['upstreams'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  dnssec: json['dnssec'] as bool?,
  bogusPriv: json['bogusPriv'] as bool?,
  domainNeeded: json['domainNeeded'] as bool?,
  expandHosts: json['expandHosts'] as bool?,
  listeningMode: $enumDecodeNullable(
    _$ListeningModeEnumMap,
    json['listeningMode'],
  ),
  port: (json['port'] as num?)?.toInt(),
  blockTTL: (json['blockTTL'] as num?)?.toInt(),
  cnameRecords: (json['cnameRecords'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  revServers: (json['revServers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  hosts: (json['hosts'] as List<dynamic>?)?.map((e) => e as String).toList(),
  blocking: json['blocking'] == null
      ? null
      : DnsBlockingConfig.fromJson(json['blocking'] as Map<String, dynamic>),
  rateLimit: json['rateLimit'] == null
      ? null
      : DnsRateLimitConfig.fromJson(json['rateLimit'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DnsConfigToJson(_DnsConfig instance) =>
    <String, dynamic>{
      'queryLogging': instance.queryLogging,
      'upstreams': ?instance.upstreams,
      'dnssec': ?instance.dnssec,
      'bogusPriv': ?instance.bogusPriv,
      'domainNeeded': ?instance.domainNeeded,
      'expandHosts': ?instance.expandHosts,
      'listeningMode': ?_$ListeningModeEnumMap[instance.listeningMode],
      'port': ?instance.port,
      'blockTTL': ?instance.blockTTL,
      'cnameRecords': ?instance.cnameRecords,
      'revServers': ?instance.revServers,
      'hosts': ?instance.hosts,
      'blocking': ?instance.blocking?.toJson(),
      'rateLimit': ?instance.rateLimit?.toJson(),
    };

const _$ListeningModeEnumMap = {
  ListeningMode.local: 'local',
  ListeningMode.all: 'all',
  ListeningMode.single: 'single',
  ListeningMode.bind: 'bind',
  ListeningMode.none: 'none',
  ListeningMode.unknown: 'unknown',
};

_DnsBlockingConfig _$DnsBlockingConfigFromJson(Map<String, dynamic> json) =>
    _DnsBlockingConfig(
      active: json['active'] as bool,
      mode: $enumDecode(_$BlockingModeEnumMap, json['mode']),
    );

Map<String, dynamic> _$DnsBlockingConfigToJson(_DnsBlockingConfig instance) =>
    <String, dynamic>{
      'active': instance.active,
      'mode': _$BlockingModeEnumMap[instance.mode]!,
    };

const _$BlockingModeEnumMap = {
  BlockingMode.nullMode: 'nullMode',
  BlockingMode.ipNodataAaaa: 'ipNodataAaaa',
  BlockingMode.ip: 'ip',
  BlockingMode.nxdomain: 'nxdomain',
  BlockingMode.nodata: 'nodata',
  BlockingMode.unknown: 'unknown',
};

_DnsRateLimitConfig _$DnsRateLimitConfigFromJson(Map<String, dynamic> json) =>
    _DnsRateLimitConfig(
      count: (json['count'] as num).toInt(),
      interval: (json['interval'] as num).toInt(),
    );

Map<String, dynamic> _$DnsRateLimitConfigToJson(_DnsRateLimitConfig instance) =>
    <String, dynamic>{'count': instance.count, 'interval': instance.interval};
