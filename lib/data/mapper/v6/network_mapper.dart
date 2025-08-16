import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v6/network/devices.dart' as s;
import 'package:pi_hole_client/data/model/v6/network/gateway.dart' as s;
import 'package:pi_hole_client/data/model/v6/network/interfaces.dart' as s;
import 'package:pi_hole_client/data/model/v6/network/routes.dart' as s;
import 'package:pi_hole_client/domain/model/network/network.dart' as d;

extension DevicesMapper on s.Devices {
  List<d.Device> toDomain() {
    return devices.map((device) {
      return d.Device(
        id: device.id,
        hwaddr: device.hwaddr,
        interface: device.interface,
        firstSeen: DateTime.fromMillisecondsSinceEpoch(device.firstSeen * 1000),
        lastQuery: DateTime.fromMillisecondsSinceEpoch(device.lastQuery * 1000),
        numQueries: device.numQueries,
        ips: device.ips.map((ip) => ip.toDomain()).toList(),
        macVendor: device.macVendor,
      );
    }).toList();
  }
}

extension DeviceIpMapper on s.DeviceIp {
  d.DeviceIp toDomain() {
    return d.DeviceIp(
      ip: ip,
      lastSeen: DateTime.fromMillisecondsSinceEpoch(lastSeen * 1000),
      nameUpdated: DateTime.fromMillisecondsSinceEpoch(nameUpdated * 1000),
      name: name,
    );
  }
}

extension GatewayMapper on s.Gateway {
  d.Gateways toDomain() {
    return d.Gateways(
      gateway: gateway.map((e) => e.toDomain()).toList(),
      interfaces: interfaces?.map((e) => e.toDomain()).toList(),
      routes: routes?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension GatewayDataMapper on s.GatewayData {
  d.Gateway toDomain() {
    return d.Gateway(
      family: family,
      interface: interface,
      address: address,
      local: local,
    );
  }
}

extension InterfacesMapper on s.InterfaceData {
  d.NetInterface toDomain() {
    return d.NetInterface(
      name: name,
      type: type,
      flags: flags,
      state: state,
      protoDown: protoDown,
      address: address,
      broadcast: broadcast,
      carrier: carrier,
      stats: stats.toDomain(),
      addresses: addresses.map((e) => e.toDomain()).toList(),
      index: index,
      family: family,
      speed: speed,
      permAddress: permAddress,
      ifname: ifname,
      txqlen: txqlen,
      linkmode: linkmode,
      mtu: mtu,
      minMtu: minMtu,
      maxMtu: maxMtu,
      group: group,
      promiscuity: promiscuity,
      unknown: unknown,
      numTxQueues: numTxQueues,
      numRxQueues: numRxQueues,
      gsoMaxSegs: gsoMaxSegs,
      gsoMaxSize: gsoMaxSize,
      map: map,
      carrierChanges: carrierChanges,
      carrierUpCount: carrierUpCount,
      carrierDownCount: carrierDownCount,
      linkKind: linkKind,
      qdisc: qdisc,
      parentDevName: parentDevName,
      parentDevBusName: parentDevBusName,
    );
  }
}

extension InterfaceStatsMapper on s.InterfaceStats {
  d.InterfaceStats toDomain() {
    return d.InterfaceStats(
      rxBytes: rxBytes.toDomain(),
      txBytes: txBytes.toDomain(),
      bits: bits,
      rxPackets: rxPackets,
      txPackets: txPackets,
      rxErrors: rxErrors,
      txErrors: txErrors,
      rxDropped: rxDropped,
      txDropped: txDropped,
      multicast: multicast,
      collisions: collisions,
      rxLengthErrors: rxLengthErrors,
      rxOverErrors: rxOverErrors,
      rxCrcErrors: rxCrcErrors,
      rxFrameErrors: rxFrameErrors,
      rxFifoErrors: rxFifoErrors,
      rxMissedErrors: rxMissedErrors,
      txAbortedErrors: txAbortedErrors,
      txCarrierErrors: txCarrierErrors,
      txFifoErrors: txFifoErrors,
      txHeartbeatErrors: txHeartbeatErrors,
      txWindowErrors: txWindowErrors,
      rxCompressed: rxCompressed,
      txCompressed: txCompressed,
      rxNohandler: rxNohandler,
    );
  }
}

extension ByteValueMapper on s.ByteValue {
  d.ByteValue toDomain() {
    return d.ByteValue(value: value, unit: unit);
  }
}

extension InterfaceAddressMapper on s.InterfaceAddress {
  d.InterfaceAddress toDomain() {
    return d.InterfaceAddress(
      address: address,
      addressType: addressType,
      index: index,
      family: family.toRouteFamilyType(),
      scope: scope,
      flags: flags,
      prefixlen: prefixlen,
      prefered: prefered,
      valid: valid,
      cstamp: cstamp,
      tstamp: tstamp,
      label: label,
      local: local,
      localType: localType,
      broadcast: broadcast,
      broadcastType: broadcastType,
      unknown: unknown,
    );
  }
}

extension RouteDataMapper on s.RouteData {
  d.Route toDomain() {
    return d.Route(
      table: table,
      family: family.toRouteFamilyType(),
      protocol: protocol,
      scope: scope,
      type: type,
      flags: flags,
      dst: dst,
      iflags: iflags,
      gateway: gateway,
      oif: oif,
      iif: iif,
      src: src,
      prefsrc: prefsrc,
      priority: priority,
      pref: pref,
      cstamp: cstamp,
      tstamp: tstamp,
      expires: expires,
      error: error,
      used: used,
    );
  }
}
