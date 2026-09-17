import 'dart:io';

import 'package:pi_hole_client/domain/model/network/network.dart';

typedef DeviceLookups = ({
  Map<String, String> ipToMac,
  Map<String, String> ipToHostname,
  Map<String, String> macToIp,
});

extension DeviceListLookups on List<Device> {
  List<DeviceOption> toDeviceOptions() {
    final list = where((device) => device.lastQuery.millisecondsSinceEpoch != 0)
        .expand((device) {
          return device.ips
              .where(
                (addr) =>
                    addr.ip != '127.0.0.1' &&
                    addr.ip != '::' &&
                    addr.ip != '::1',
              )
              .map(
                (addr) => DeviceOption(
                  ip: addr.ip,
                  hwaddr: device.hwaddr,
                  macVendor: device.macVendor ?? '',
                ),
              );
        })
        .toList();

    list.sort((a, b) {
      final ipA = InternetAddress.tryParse(a.ip);
      final ipB = InternetAddress.tryParse(b.ip);

      if (ipA == null || ipB == null) {
        return a.ip.compareTo(b.ip);
      }

      if (ipA.type != ipB.type) {
        return ipA.type == InternetAddressType.IPv4 ? -1 : 1;
      }

      final bytesA = ipA.rawAddress;
      final bytesB = ipB.rawAddress;
      for (var i = 0; i < bytesA.length; i++) {
        final diff = bytesA[i].compareTo(bytesB[i]);
        if (diff != 0) return diff;
      }
      return 0;
    });

    return list;
  }

  DeviceLookups toLookups() {
    final ipToMac = <String, String>{};
    final ipToHostname = <String, String>{};
    final macToIp = <String, String>{};

    for (final device in this) {
      for (final addr in device.ips) {
        ipToMac[addr.ip] = device.hwaddr;
        if ((addr.name ?? '').isNotEmpty) {
          ipToHostname[addr.ip] = addr.name!;
        }
        // TODO: Uses the first IP from the API. Pick the most recent (lastSeen)
        // or prefer IPv4 instead.
        macToIp.putIfAbsent(device.hwaddr, () => addr.ip);
      }
    }

    return (ipToMac: ipToMac, ipToHostname: ipToHostname, macToIp: macToIp);
  }
}
