// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Padd _$PaddFromJson(Map<String, dynamic> json) => _Padd(
  recentBlocked: json['recent_blocked'] as String?,
  topDomain: json['top_domain'] as String?,
  topBlocked: json['top_blocked'] as String?,
  topClient: json['top_client'] as String?,
  activeClients: (json['active_clients'] as num).toInt(),
  gravitySize: (json['gravity_size'] as num).toInt(),
  blocking: json['blocking'] as String,
  queries: PaddQueries.fromJson(json['queries'] as Map<String, dynamic>),
  cache: PaddCache.fromJson(json['cache'] as Map<String, dynamic>),
  iface: PaddIface.fromJson(json['iface'] as Map<String, dynamic>),
  nodeName: json['node_name'] as String,
  hostModel: json['host_model'] as String?,
  config: PaddConfig.fromJson(json['config'] as Map<String, dynamic>),
  cpuPercent: (json['%cpu'] as num).toDouble(),
  memPercent: (json['%mem'] as num).toDouble(),
  pid: (json['pid'] as num).toInt(),
  sensors: PaddSensors.fromJson(json['sensors'] as Map<String, dynamic>),
  system: PaddSystem.fromJson(json['system'] as Map<String, dynamic>),
  version: VersionData.fromJson(json['version'] as Map<String, dynamic>),
  took: (json['took'] as num).toDouble(),
);

Map<String, dynamic> _$PaddToJson(_Padd instance) => <String, dynamic>{
  'recent_blocked': instance.recentBlocked,
  'top_domain': instance.topDomain,
  'top_blocked': instance.topBlocked,
  'top_client': instance.topClient,
  'active_clients': instance.activeClients,
  'gravity_size': instance.gravitySize,
  'blocking': instance.blocking,
  'queries': instance.queries.toJson(),
  'cache': instance.cache.toJson(),
  'iface': instance.iface.toJson(),
  'node_name': instance.nodeName,
  'host_model': instance.hostModel,
  'config': instance.config.toJson(),
  '%cpu': instance.cpuPercent,
  '%mem': instance.memPercent,
  'pid': instance.pid,
  'sensors': instance.sensors.toJson(),
  'system': instance.system.toJson(),
  'version': instance.version.toJson(),
  'took': instance.took,
};

_PaddQueries _$PaddQueriesFromJson(Map<String, dynamic> json) => _PaddQueries(
  total: (json['total'] as num).toInt(),
  blocked: (json['blocked'] as num).toInt(),
  percentBlocked: (json['percent_blocked'] as num).toDouble(),
);

Map<String, dynamic> _$PaddQueriesToJson(_PaddQueries instance) =>
    <String, dynamic>{
      'total': instance.total,
      'blocked': instance.blocked,
      'percent_blocked': instance.percentBlocked,
    };

_PaddCache _$PaddCacheFromJson(Map<String, dynamic> json) => _PaddCache(
  size: (json['size'] as num).toInt(),
  inserted: (json['inserted'] as num).toInt(),
  evicted: (json['evicted'] as num).toInt(),
);

Map<String, dynamic> _$PaddCacheToJson(_PaddCache instance) =>
    <String, dynamic>{
      'size': instance.size,
      'inserted': instance.inserted,
      'evicted': instance.evicted,
    };

_PaddIface _$PaddIfaceFromJson(Map<String, dynamic> json) => _PaddIface(
  v4: PaddIfaceV4.fromJson(json['v4'] as Map<String, dynamic>),
  v6: PaddIfaceV6.fromJson(json['v6'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaddIfaceToJson(_PaddIface instance) =>
    <String, dynamic>{'v4': instance.v4.toJson(), 'v6': instance.v6.toJson()};

_PaddIfaceV4 _$PaddIfaceV4FromJson(Map<String, dynamic> json) => _PaddIfaceV4(
  addr: json['addr'] as String?,
  rxBytes: PaddIfaceBytes.fromJson(json['rx_bytes'] as Map<String, dynamic>),
  txBytes: PaddIfaceBytes.fromJson(json['tx_bytes'] as Map<String, dynamic>),
  numAddrs: (json['num_addrs'] as num).toInt(),
  name: json['name'] as String,
  gwAddr: json['gw_addr'] as String?,
);

Map<String, dynamic> _$PaddIfaceV4ToJson(_PaddIfaceV4 instance) =>
    <String, dynamic>{
      'addr': instance.addr,
      'rx_bytes': instance.rxBytes.toJson(),
      'tx_bytes': instance.txBytes.toJson(),
      'num_addrs': instance.numAddrs,
      'name': instance.name,
      'gw_addr': instance.gwAddr,
    };

_PaddIfaceV6 _$PaddIfaceV6FromJson(Map<String, dynamic> json) => _PaddIfaceV6(
  addr: json['addr'] as String?,
  numAddrs: (json['num_addrs'] as num).toInt(),
  name: json['name'] as String,
  gwAddr: json['gw_addr'] as String?,
);

Map<String, dynamic> _$PaddIfaceV6ToJson(_PaddIfaceV6 instance) =>
    <String, dynamic>{
      'addr': instance.addr,
      'num_addrs': instance.numAddrs,
      'name': instance.name,
      'gw_addr': instance.gwAddr,
    };

_PaddIfaceBytes _$PaddIfaceBytesFromJson(Map<String, dynamic> json) =>
    _PaddIfaceBytes(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$PaddIfaceBytesToJson(_PaddIfaceBytes instance) =>
    <String, dynamic>{'value': instance.value, 'unit': instance.unit};

_PaddConfig _$PaddConfigFromJson(Map<String, dynamic> json) => _PaddConfig(
  dhcpActive: json['dhcp_active'] as bool,
  dhcpStart: json['dhcp_start'] as String,
  dhcpEnd: json['dhcp_end'] as String,
  dhcpIpv6: json['dhcp_ipv6'] as bool,
  dnsDomain: json['dns_domain'] as String,
  dnsPort: (json['dns_port'] as num).toInt(),
  dnsNumUpstreams: (json['dns_num_upstreams'] as num).toInt(),
  dnsDnssec: json['dns_dnssec'] as bool,
  dnsRevServerActive: json['dns_revServer_active'] as bool,
  privacyLevel: (json['privacy_level'] as num).toInt(),
);

Map<String, dynamic> _$PaddConfigToJson(_PaddConfig instance) =>
    <String, dynamic>{
      'dhcp_active': instance.dhcpActive,
      'dhcp_start': instance.dhcpStart,
      'dhcp_end': instance.dhcpEnd,
      'dhcp_ipv6': instance.dhcpIpv6,
      'dns_domain': instance.dnsDomain,
      'dns_port': instance.dnsPort,
      'dns_num_upstreams': instance.dnsNumUpstreams,
      'dns_dnssec': instance.dnsDnssec,
      'dns_revServer_active': instance.dnsRevServerActive,
      'privacy_level': instance.privacyLevel,
    };

_PaddSensors _$PaddSensorsFromJson(Map<String, dynamic> json) => _PaddSensors(
  cpuTemp: (json['cpu_temp'] as num?)?.toDouble(),
  hotLimit: (json['hot_limit'] as num).toDouble(),
  unit: json['unit'] as String,
);

Map<String, dynamic> _$PaddSensorsToJson(_PaddSensors instance) =>
    <String, dynamic>{
      'cpu_temp': instance.cpuTemp,
      'hot_limit': instance.hotLimit,
      'unit': instance.unit,
    };

_PaddSystem _$PaddSystemFromJson(Map<String, dynamic> json) => _PaddSystem(
  uptime: (json['uptime'] as num).toInt(),
  memory: PaddSystemMemory.fromJson(json['memory'] as Map<String, dynamic>),
  procs: (json['procs'] as num).toInt(),
  cpu: PaddSystemCpu.fromJson(json['cpu'] as Map<String, dynamic>),
  ftl: PaddSystemFtl.fromJson(json['ftl'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaddSystemToJson(_PaddSystem instance) =>
    <String, dynamic>{
      'uptime': instance.uptime,
      'memory': instance.memory.toJson(),
      'procs': instance.procs,
      'cpu': instance.cpu.toJson(),
      'ftl': instance.ftl.toJson(),
    };

_PaddSystemMemory _$PaddSystemMemoryFromJson(Map<String, dynamic> json) =>
    _PaddSystemMemory(
      ram: PaddSystemRam.fromJson(json['ram'] as Map<String, dynamic>),
      swap: PaddSystemSwap.fromJson(json['swap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaddSystemMemoryToJson(_PaddSystemMemory instance) =>
    <String, dynamic>{
      'ram': instance.ram.toJson(),
      'swap': instance.swap.toJson(),
    };

_PaddSystemRam _$PaddSystemRamFromJson(Map<String, dynamic> json) =>
    _PaddSystemRam(
      total: (json['total'] as num).toInt(),
      free: (json['free'] as num).toInt(),
      used: (json['used'] as num).toInt(),
      available: (json['available'] as num).toInt(),
      percentUsed: (json['%used'] as num).toDouble(),
    );

Map<String, dynamic> _$PaddSystemRamToJson(_PaddSystemRam instance) =>
    <String, dynamic>{
      'total': instance.total,
      'free': instance.free,
      'used': instance.used,
      'available': instance.available,
      '%used': instance.percentUsed,
    };

_PaddSystemSwap _$PaddSystemSwapFromJson(Map<String, dynamic> json) =>
    _PaddSystemSwap(
      total: (json['total'] as num).toInt(),
      used: (json['used'] as num).toInt(),
      free: (json['free'] as num).toInt(),
      percentUsed: (json['%used'] as num).toDouble(),
    );

Map<String, dynamic> _$PaddSystemSwapToJson(_PaddSystemSwap instance) =>
    <String, dynamic>{
      'total': instance.total,
      'used': instance.used,
      'free': instance.free,
      '%used': instance.percentUsed,
    };

_PaddSystemCpu _$PaddSystemCpuFromJson(Map<String, dynamic> json) =>
    _PaddSystemCpu(
      nprocs: (json['nprocs'] as num).toInt(),
      percentCpu: (json['%cpu'] as num?)?.toDouble(),
      load: PaddSystemLoad.fromJson(json['load'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaddSystemCpuToJson(_PaddSystemCpu instance) =>
    <String, dynamic>{
      'nprocs': instance.nprocs,
      '%cpu': instance.percentCpu,
      'load': instance.load.toJson(),
    };

_PaddSystemLoad _$PaddSystemLoadFromJson(Map<String, dynamic> json) =>
    _PaddSystemLoad(
      raw: (json['raw'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      percent: (json['percent'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$PaddSystemLoadToJson(_PaddSystemLoad instance) =>
    <String, dynamic>{'raw': instance.raw, 'percent': instance.percent};

_PaddSystemFtl _$PaddSystemFtlFromJson(Map<String, dynamic> json) =>
    _PaddSystemFtl(
      percentMem: (json['%mem'] as num).toDouble(),
      percentCpu: (json['%cpu'] as num).toDouble(),
    );

Map<String, dynamic> _$PaddSystemFtlToJson(_PaddSystemFtl instance) =>
    <String, dynamic>{'%mem': instance.percentMem, '%cpu': instance.percentCpu};
