import 'package:pi_hole_client/data2/services/gateways/v6/models/network/devices.dart';

/// Application-specific model representing a list of devices.
///
/// By design, we do not use the API model (`model/api/v6/network/devices.dart`) directly.
/// Instead, the data is converted into this app-specific model for clearer separation of concerns
/// and to maintain flexibility within the app layer.
class DevicesInfo {
  DevicesInfo({
    required this.devices,
  });

  factory DevicesInfo.fromV6(Devices devices) {
    return DevicesInfo(
      devices: devices.devices.map(DeviceInfo.fromV6).toList(),
    );
  }

  final List<DeviceInfo> devices;

  Map<String, dynamic> toJson() {
    return {
      'devices': devices.map((device) => device.toJson()).toList(),
    };
  }
}

class DeviceInfo {
  DeviceInfo({
    required this.id,
    required this.hwaddr,
    required this.interface,
    required this.firstSeen,
    required this.lastQuery,
    required this.numQueries,
    required this.ips,
    this.macVendor,
  });

  factory DeviceInfo.fromV6(DeviceData deviceData) {
    return DeviceInfo(
      id: deviceData.id,
      hwaddr: deviceData.hwaddr,
      interface: deviceData.interface,
      firstSeen:
          DateTime.fromMillisecondsSinceEpoch(deviceData.firstSeen * 1000),
      lastQuery:
          DateTime.fromMillisecondsSinceEpoch(deviceData.lastQuery * 1000),
      numQueries: deviceData.numQueries,
      ips: deviceData.ips.map(DeviceAddress.fromV6).toList(),
      macVendor: deviceData.macVendor,
    );
  }

  final int id;
  final String hwaddr;
  final String interface;
  final DateTime firstSeen;
  final DateTime lastQuery;
  final int numQueries;
  final List<DeviceAddress> ips;
  final String? macVendor;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hwaddr': hwaddr,
      'interface': interface,
      'firstSeen': firstSeen.toIso8601String(),
      'lastQuery': lastQuery.toIso8601String(),
      'numQueries': numQueries,
      'ips': ips.map((ip) => ip.toJson()).toList(),
      'macVendor': macVendor,
    };
  }
}

class DeviceAddress {
  DeviceAddress({
    required this.ip,
    required this.lastSeen,
    required this.nameUpdated,
    this.name,
  });

  factory DeviceAddress.fromV6(DeviceIp deviceIp) {
    return DeviceAddress(
      ip: deviceIp.ip,
      lastSeen: DateTime.fromMillisecondsSinceEpoch(deviceIp.lastSeen * 1000),
      nameUpdated:
          DateTime.fromMillisecondsSinceEpoch(deviceIp.nameUpdated * 1000),
      name: deviceIp.name,
    );
  }

  final String ip;
  final DateTime lastSeen;
  final DateTime nameUpdated;
  final String? name;

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'lastSeen': lastSeen.toIso8601String(),
      'nameUpdated': nameUpdated.toIso8601String(),
      'name': name,
    };
  }
}
