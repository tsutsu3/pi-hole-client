// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Gateways _$GatewaysFromJson(Map<String, dynamic> json) => _Gateways(
  gateways: (json['gateways'] as List<dynamic>)
      .map((e) => Gateway.fromJson(e as Map<String, dynamic>))
      .toList(),
  interfaces: (json['interfaces'] as List<dynamic>?)
      ?.map((e) => NetInterface.fromJson(e as Map<String, dynamic>))
      .toList(),
  routes: (json['routes'] as List<dynamic>?)
      ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GatewaysToJson(_Gateways instance) => <String, dynamic>{
  'gateways': instance.gateways.map((e) => e.toJson()).toList(),
  'interfaces': instance.interfaces?.map((e) => e.toJson()).toList(),
  'routes': instance.routes?.map((e) => e.toJson()).toList(),
};

_Gateway _$GatewayFromJson(Map<String, dynamic> json) => _Gateway(
  family: json['family'] as String,
  interface: json['interface'] as String,
  address: json['address'] as String,
  local: (json['local'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$GatewayToJson(_Gateway instance) => <String, dynamic>{
  'family': instance.family,
  'interface': instance.interface,
  'address': instance.address,
  'local': instance.local,
};

_NetInterface _$NetInterfaceFromJson(Map<String, dynamic> json) =>
    _NetInterface(
      name: json['name'] as String,
      type: json['type'] as String,
      flags: (json['flags'] as List<dynamic>).map((e) => e as String).toList(),
      state: json['state'] as String,
      protoDown: json['protoDown'] as bool,
      address: json['address'] as String,
      broadcast: json['broadcast'] as String,
      carrier: json['carrier'] as bool,
      stats: InterfaceStats.fromJson(json['stats'] as Map<String, dynamic>),
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => InterfaceAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: (json['index'] as num?)?.toInt(),
      family: json['family'] as String?,
      speed: (json['speed'] as num?)?.toInt(),
      permAddress: json['permAddress'] as String?,
      ifname: json['ifname'] as String?,
      txqlen: (json['txqlen'] as num?)?.toInt(),
      linkmode: (json['linkmode'] as num?)?.toInt(),
      mtu: (json['mtu'] as num?)?.toInt(),
      minMtu: (json['minMtu'] as num?)?.toInt(),
      maxMtu: (json['maxMtu'] as num?)?.toInt(),
      group: (json['group'] as num?)?.toInt(),
      promiscuity: (json['promiscuity'] as num?)?.toInt(),
      unknown: (json['unknown'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      numTxQueues: (json['numTxQueues'] as num?)?.toInt(),
      numRxQueues: (json['numRxQueues'] as num?)?.toInt(),
      gsoMaxSegs: (json['gsoMaxSegs'] as num?)?.toInt(),
      gsoMaxSize: (json['gsoMaxSize'] as num?)?.toInt(),
      map: (json['map'] as num?)?.toInt(),
      carrierChanges: (json['carrierChanges'] as num?)?.toInt(),
      carrierUpCount: (json['carrierUpCount'] as num?)?.toInt(),
      carrierDownCount: (json['carrierDownCount'] as num?)?.toInt(),
      linkKind: json['linkKind'] as String?,
      qdisc: json['qdisc'] as String?,
      parentDevName: json['parentDevName'] as String?,
      parentDevBusName: json['parentDevBusName'] as String?,
    );

Map<String, dynamic> _$NetInterfaceToJson(_NetInterface instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'flags': instance.flags,
      'state': instance.state,
      'protoDown': instance.protoDown,
      'address': instance.address,
      'broadcast': instance.broadcast,
      'carrier': instance.carrier,
      'stats': instance.stats,
      'addresses': instance.addresses,
      'index': instance.index,
      'family': instance.family,
      'speed': instance.speed,
      'permAddress': instance.permAddress,
      'ifname': instance.ifname,
      'txqlen': instance.txqlen,
      'linkmode': instance.linkmode,
      'mtu': instance.mtu,
      'minMtu': instance.minMtu,
      'maxMtu': instance.maxMtu,
      'group': instance.group,
      'promiscuity': instance.promiscuity,
      'unknown': instance.unknown,
      'numTxQueues': instance.numTxQueues,
      'numRxQueues': instance.numRxQueues,
      'gsoMaxSegs': instance.gsoMaxSegs,
      'gsoMaxSize': instance.gsoMaxSize,
      'map': instance.map,
      'carrierChanges': instance.carrierChanges,
      'carrierUpCount': instance.carrierUpCount,
      'carrierDownCount': instance.carrierDownCount,
      'linkKind': instance.linkKind,
      'qdisc': instance.qdisc,
      'parentDevName': instance.parentDevName,
      'parentDevBusName': instance.parentDevBusName,
    };

_InterfaceStats _$InterfaceStatsFromJson(Map<String, dynamic> json) =>
    _InterfaceStats(
      rxBytes: ByteValue.fromJson(json['rxBytes'] as Map<String, dynamic>),
      txBytes: ByteValue.fromJson(json['txBytes'] as Map<String, dynamic>),
      bits: (json['bits'] as num).toInt(),
      rxPackets: (json['rxPackets'] as num).toInt(),
      txPackets: (json['txPackets'] as num).toInt(),
      rxErrors: (json['rxErrors'] as num).toInt(),
      txErrors: (json['txErrors'] as num).toInt(),
      rxDropped: (json['rxDropped'] as num).toInt(),
      txDropped: (json['txDropped'] as num).toInt(),
      multicast: (json['multicast'] as num).toInt(),
      collisions: (json['collisions'] as num).toInt(),
      rxLengthErrors: (json['rxLengthErrors'] as num).toInt(),
      rxOverErrors: (json['rxOverErrors'] as num).toInt(),
      rxCrcErrors: (json['rxCrcErrors'] as num).toInt(),
      rxFrameErrors: (json['rxFrameErrors'] as num).toInt(),
      rxFifoErrors: (json['rxFifoErrors'] as num).toInt(),
      rxMissedErrors: (json['rxMissedErrors'] as num).toInt(),
      txAbortedErrors: (json['txAbortedErrors'] as num).toInt(),
      txCarrierErrors: (json['txCarrierErrors'] as num).toInt(),
      txFifoErrors: (json['txFifoErrors'] as num).toInt(),
      txHeartbeatErrors: (json['txHeartbeatErrors'] as num).toInt(),
      txWindowErrors: (json['txWindowErrors'] as num).toInt(),
      rxCompressed: (json['rxCompressed'] as num).toInt(),
      txCompressed: (json['txCompressed'] as num).toInt(),
      rxNohandler: (json['rxNohandler'] as num).toInt(),
    );

Map<String, dynamic> _$InterfaceStatsToJson(_InterfaceStats instance) =>
    <String, dynamic>{
      'rxBytes': instance.rxBytes,
      'txBytes': instance.txBytes,
      'bits': instance.bits,
      'rxPackets': instance.rxPackets,
      'txPackets': instance.txPackets,
      'rxErrors': instance.rxErrors,
      'txErrors': instance.txErrors,
      'rxDropped': instance.rxDropped,
      'txDropped': instance.txDropped,
      'multicast': instance.multicast,
      'collisions': instance.collisions,
      'rxLengthErrors': instance.rxLengthErrors,
      'rxOverErrors': instance.rxOverErrors,
      'rxCrcErrors': instance.rxCrcErrors,
      'rxFrameErrors': instance.rxFrameErrors,
      'rxFifoErrors': instance.rxFifoErrors,
      'rxMissedErrors': instance.rxMissedErrors,
      'txAbortedErrors': instance.txAbortedErrors,
      'txCarrierErrors': instance.txCarrierErrors,
      'txFifoErrors': instance.txFifoErrors,
      'txHeartbeatErrors': instance.txHeartbeatErrors,
      'txWindowErrors': instance.txWindowErrors,
      'rxCompressed': instance.rxCompressed,
      'txCompressed': instance.txCompressed,
      'rxNohandler': instance.rxNohandler,
    };

_ByteValue _$ByteValueFromJson(Map<String, dynamic> json) => _ByteValue(
  value: (json['value'] as num).toDouble(),
  unit: json['unit'] as String,
);

Map<String, dynamic> _$ByteValueToJson(_ByteValue instance) =>
    <String, dynamic>{'value': instance.value, 'unit': instance.unit};

_InterfaceAddress _$InterfaceAddressFromJson(Map<String, dynamic> json) =>
    _InterfaceAddress(
      address: json['address'] as String,
      addressType: json['addressType'] as String,
      index: (json['index'] as num).toInt(),
      family: $enumDecode(_$RouteFamilyTypeEnumMap, json['family']),
      scope: json['scope'] as String,
      flags: (json['flags'] as List<dynamic>).map((e) => e as String).toList(),
      prefixlen: (json['prefixlen'] as num).toInt(),
      prefered: (json['prefered'] as num).toInt(),
      valid: (json['valid'] as num).toInt(),
      cstamp: (json['cstamp'] as num).toDouble(),
      tstamp: (json['tstamp'] as num).toDouble(),
      label: json['label'] as String?,
      local: json['local'] as String?,
      localType: json['localType'] as String?,
      broadcast: json['broadcast'] as String?,
      broadcastType: json['broadcastType'] as String?,
      unknown: (json['unknown'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$InterfaceAddressToJson(_InterfaceAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'addressType': instance.addressType,
      'index': instance.index,
      'family': _$RouteFamilyTypeEnumMap[instance.family]!,
      'scope': instance.scope,
      'flags': instance.flags,
      'prefixlen': instance.prefixlen,
      'prefered': instance.prefered,
      'valid': instance.valid,
      'cstamp': instance.cstamp,
      'tstamp': instance.tstamp,
      'label': instance.label,
      'local': instance.local,
      'localType': instance.localType,
      'broadcast': instance.broadcast,
      'broadcastType': instance.broadcastType,
      'unknown': instance.unknown,
    };

const _$RouteFamilyTypeEnumMap = {
  RouteFamilyType.inet: 'inet',
  RouteFamilyType.inet6: 'inet6',
  RouteFamilyType.link: 'link',
  RouteFamilyType.mpls: 'mpls',
  RouteFamilyType.bridge: 'bridge',
  RouteFamilyType.unknown: 'unknown',
};

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: (json['id'] as num).toInt(),
  hwaddr: json['hwaddr'] as String,
  interface: json['interface'] as String,
  firstSeen: DateTime.parse(json['firstSeen'] as String),
  lastQuery: DateTime.parse(json['lastQuery'] as String),
  numQueries: (json['numQueries'] as num).toInt(),
  ips: (json['ips'] as List<dynamic>)
      .map((e) => DeviceIp.fromJson(e as Map<String, dynamic>))
      .toList(),
  macVendor: json['macVendor'] as String?,
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'hwaddr': instance.hwaddr,
  'interface': instance.interface,
  'firstSeen': instance.firstSeen.toIso8601String(),
  'lastQuery': instance.lastQuery.toIso8601String(),
  'numQueries': instance.numQueries,
  'ips': instance.ips.map((e) => e.toJson()).toList(),
  'macVendor': instance.macVendor,
};

_DeviceIp _$DeviceIpFromJson(Map<String, dynamic> json) => _DeviceIp(
  ip: json['ip'] as String,
  lastSeen: DateTime.parse(json['lastSeen'] as String),
  nameUpdated: DateTime.parse(json['nameUpdated'] as String),
  name: json['name'] as String?,
);

Map<String, dynamic> _$DeviceIpToJson(_DeviceIp instance) => <String, dynamic>{
  'ip': instance.ip,
  'lastSeen': instance.lastSeen.toIso8601String(),
  'nameUpdated': instance.nameUpdated.toIso8601String(),
  'name': instance.name,
};

_Route _$RouteFromJson(Map<String, dynamic> json) => _Route(
  table: (json['table'] as num).toInt(),
  family: $enumDecode(_$RouteFamilyTypeEnumMap, json['family']),
  protocol: json['protocol'] as String,
  scope: json['scope'] as String,
  type: json['type'] as String,
  flags: (json['flags'] as List<dynamic>).map((e) => e as String).toList(),
  dst: json['dst'] as String,
  iflags: (json['iflags'] as num?)?.toInt(),
  gateway: json['gateway'] as String?,
  oif: json['oif'] as String?,
  iif: json['iif'] as String?,
  src: json['src'] as String?,
  prefsrc: json['prefsrc'] as String?,
  priority: (json['priority'] as num?)?.toInt(),
  pref: (json['pref'] as num?)?.toInt(),
  cstamp: (json['cstamp'] as num?)?.toDouble(),
  tstamp: (json['tstamp'] as num?)?.toDouble(),
  expires: (json['expires'] as num?)?.toInt(),
  error: (json['error'] as num?)?.toInt(),
  used: (json['used'] as num?)?.toInt(),
);

Map<String, dynamic> _$RouteToJson(_Route instance) => <String, dynamic>{
  'table': instance.table,
  'family': _$RouteFamilyTypeEnumMap[instance.family]!,
  'protocol': instance.protocol,
  'scope': instance.scope,
  'type': instance.type,
  'flags': instance.flags,
  'dst': instance.dst,
  'iflags': instance.iflags,
  'gateway': instance.gateway,
  'oif': instance.oif,
  'iif': instance.iif,
  'src': instance.src,
  'prefsrc': instance.prefsrc,
  'priority': instance.priority,
  'pref': instance.pref,
  'cstamp': instance.cstamp,
  'tstamp': instance.tstamp,
  'expires': instance.expires,
  'error': instance.error,
  'used': instance.used,
};
