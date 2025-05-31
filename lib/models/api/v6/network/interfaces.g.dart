// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interfaces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Interfaces _$InterfacesFromJson(Map<String, dynamic> json) => _Interfaces(
      interfaces: (json['interfaces'] as List<dynamic>)
          .map((e) => InterfaceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$InterfacesToJson(_Interfaces instance) =>
    <String, dynamic>{
      'interfaces': instance.interfaces,
      'took': instance.took,
    };

_InterfaceData _$InterfaceDataFromJson(Map<String, dynamic> json) =>
    _InterfaceData(
      name: json['name'] as String,
      type: json['type'] as String,
      flags: (json['flags'] as List<dynamic>).map((e) => e as String).toList(),
      state: json['state'] as String,
      protoDown: json['proto_down'] as bool,
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
      permAddress: json['perm_address'] as String?,
      ifname: json['ifname'] as String?,
      txqlen: (json['txqlen'] as num?)?.toInt(),
      linkmode: (json['linkmode'] as num?)?.toInt(),
      mtu: (json['mtu'] as num?)?.toInt(),
      minMtu: (json['min_mtu'] as num?)?.toInt(),
      maxMtu: (json['max_mtu'] as num?)?.toInt(),
      group: (json['group'] as num?)?.toInt(),
      promiscuity: (json['promiscuity'] as num?)?.toInt(),
      unknown: (json['unknown'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      numTxQueues: (json['num_tx_queues'] as num?)?.toInt(),
      numRxQueues: (json['num_rx_queues'] as num?)?.toInt(),
      gsoMaxSegs: (json['gso_max_segs'] as num?)?.toInt(),
      gsoMaxSize: (json['gso_max_size'] as num?)?.toInt(),
      map: (json['map'] as num?)?.toInt(),
      carrierChanges: (json['carrier_changes'] as num?)?.toInt(),
      carrierUpCount: (json['carrier_up_count'] as num?)?.toInt(),
      carrierDownCount: (json['carrier_down_count'] as num?)?.toInt(),
      linkKind: json['link_kind'] as String?,
      qdisc: json['qdisc'] as String?,
      parentDevName: json['parent_dev_name'] as String?,
      parentDevBusName: json['parent_dev_bus_name'] as String?,
    );

Map<String, dynamic> _$InterfaceDataToJson(_InterfaceData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'flags': instance.flags,
      'state': instance.state,
      'proto_down': instance.protoDown,
      'address': instance.address,
      'broadcast': instance.broadcast,
      'carrier': instance.carrier,
      'stats': instance.stats,
      'addresses': instance.addresses,
      'index': instance.index,
      'family': instance.family,
      'speed': instance.speed,
      'perm_address': instance.permAddress,
      'ifname': instance.ifname,
      'txqlen': instance.txqlen,
      'linkmode': instance.linkmode,
      'mtu': instance.mtu,
      'min_mtu': instance.minMtu,
      'max_mtu': instance.maxMtu,
      'group': instance.group,
      'promiscuity': instance.promiscuity,
      'unknown': instance.unknown,
      'num_tx_queues': instance.numTxQueues,
      'num_rx_queues': instance.numRxQueues,
      'gso_max_segs': instance.gsoMaxSegs,
      'gso_max_size': instance.gsoMaxSize,
      'map': instance.map,
      'carrier_changes': instance.carrierChanges,
      'carrier_up_count': instance.carrierUpCount,
      'carrier_down_count': instance.carrierDownCount,
      'link_kind': instance.linkKind,
      'qdisc': instance.qdisc,
      'parent_dev_name': instance.parentDevName,
      'parent_dev_bus_name': instance.parentDevBusName,
    };

_InterfaceStats _$InterfaceStatsFromJson(Map<String, dynamic> json) =>
    _InterfaceStats(
      rxBytes: ByteValue.fromJson(json['rx_bytes'] as Map<String, dynamic>),
      txBytes: ByteValue.fromJson(json['tx_bytes'] as Map<String, dynamic>),
      bits: (json['bits'] as num).toInt(),
      rxPackets: (json['rx_packets'] as num).toInt(),
      txPackets: (json['tx_packets'] as num).toInt(),
      rxErrors: (json['rx_errors'] as num).toInt(),
      txErrors: (json['tx_errors'] as num).toInt(),
      rxDropped: (json['rx_dropped'] as num).toInt(),
      txDropped: (json['tx_dropped'] as num).toInt(),
      multicast: (json['multicast'] as num).toInt(),
      collisions: (json['collisions'] as num).toInt(),
      rxLengthErrors: (json['rx_length_errors'] as num).toInt(),
      rxOverErrors: (json['rx_over_errors'] as num).toInt(),
      rxCrcErrors: (json['rx_crc_errors'] as num).toInt(),
      rxFrameErrors: (json['rx_frame_errors'] as num).toInt(),
      rxFifoErrors: (json['rx_fifo_errors'] as num).toInt(),
      rxMissedErrors: (json['rx_missed_errors'] as num).toInt(),
      txAbortedErrors: (json['tx_aborted_errors'] as num).toInt(),
      txCarrierErrors: (json['tx_carrier_errors'] as num).toInt(),
      txFifoErrors: (json['tx_fifo_errors'] as num).toInt(),
      txHeartbeatErrors: (json['tx_heartbeat_errors'] as num).toInt(),
      txWindowErrors: (json['tx_window_errors'] as num).toInt(),
      rxCompressed: (json['rx_compressed'] as num).toInt(),
      txCompressed: (json['tx_compressed'] as num).toInt(),
      rxNohandler: (json['rx_nohandler'] as num).toInt(),
    );

Map<String, dynamic> _$InterfaceStatsToJson(_InterfaceStats instance) =>
    <String, dynamic>{
      'rx_bytes': instance.rxBytes,
      'tx_bytes': instance.txBytes,
      'bits': instance.bits,
      'rx_packets': instance.rxPackets,
      'tx_packets': instance.txPackets,
      'rx_errors': instance.rxErrors,
      'tx_errors': instance.txErrors,
      'rx_dropped': instance.rxDropped,
      'tx_dropped': instance.txDropped,
      'multicast': instance.multicast,
      'collisions': instance.collisions,
      'rx_length_errors': instance.rxLengthErrors,
      'rx_over_errors': instance.rxOverErrors,
      'rx_crc_errors': instance.rxCrcErrors,
      'rx_frame_errors': instance.rxFrameErrors,
      'rx_fifo_errors': instance.rxFifoErrors,
      'rx_missed_errors': instance.rxMissedErrors,
      'tx_aborted_errors': instance.txAbortedErrors,
      'tx_carrier_errors': instance.txCarrierErrors,
      'tx_fifo_errors': instance.txFifoErrors,
      'tx_heartbeat_errors': instance.txHeartbeatErrors,
      'tx_window_errors': instance.txWindowErrors,
      'rx_compressed': instance.rxCompressed,
      'tx_compressed': instance.txCompressed,
      'rx_nohandler': instance.rxNohandler,
    };

_ByteValue _$ByteValueFromJson(Map<String, dynamic> json) => _ByteValue(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$ByteValueToJson(_ByteValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

_InterfaceAddress _$InterfaceAddressFromJson(Map<String, dynamic> json) =>
    _InterfaceAddress(
      address: json['address'] as String,
      addressType: json['address_type'] as String,
      index: (json['index'] as num).toInt(),
      family: $enumDecode(_$RouteFamilyEnumMap, json['family']),
      scope: json['scope'] as String,
      flags: (json['flags'] as List<dynamic>).map((e) => e as String).toList(),
      prefixlen: (json['prefixlen'] as num).toInt(),
      prefered: (json['prefered'] as num).toInt(),
      valid: (json['valid'] as num).toInt(),
      cstamp: (json['cstamp'] as num).toDouble(),
      tstamp: (json['tstamp'] as num).toDouble(),
      label: json['label'] as String?,
      local: json['local'] as String?,
      localType: json['local_type'] as String?,
      broadcast: json['broadcast'] as String?,
      broadcastType: json['broadcast_type'] as String?,
      unknown: (json['unknown'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$InterfaceAddressToJson(_InterfaceAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_type': instance.addressType,
      'index': instance.index,
      'family': _$RouteFamilyEnumMap[instance.family]!,
      'scope': instance.scope,
      'flags': instance.flags,
      'prefixlen': instance.prefixlen,
      'prefered': instance.prefered,
      'valid': instance.valid,
      'cstamp': instance.cstamp,
      'tstamp': instance.tstamp,
      'label': instance.label,
      'local': instance.local,
      'local_type': instance.localType,
      'broadcast': instance.broadcast,
      'broadcast_type': instance.broadcastType,
      'unknown': instance.unknown,
    };

const _$RouteFamilyEnumMap = {
  RouteFamily.inet: 'inet',
  RouteFamily.inet6: 'inet6',
  RouteFamily.link: 'link',
  RouteFamily.mpls: 'mpls',
  RouteFamily.bridge: 'bridge',
  RouteFamily.unknown: 'unknown',
};
