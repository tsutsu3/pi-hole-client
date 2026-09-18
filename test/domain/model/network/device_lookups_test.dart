import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/network/device_lookups.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';

Device _device({
  required String hwaddr,
  required List<({String ip, String? name})> ips,
  DateTime? lastQuery,
  String? macVendor,
}) {
  final time = DateTime(2024);
  return Device(
    id: hwaddr.hashCode,
    hwaddr: hwaddr,
    interface: 'eth0',
    firstSeen: time,
    lastQuery: lastQuery ?? time,
    numQueries: 1,
    macVendor: macVendor,
    ips: [
      for (final addr in ips)
        DeviceIp(
          ip: addr.ip,
          name: addr.name,
          lastSeen: time,
          nameUpdated: time,
        ),
    ],
  );
}

void main() {
  group('toDeviceOptions', () {
    test('excludes unused devices and loopback addresses', () {
      final devices = [
        _device(
          hwaddr: 'aa',
          ips: [
            (ip: '127.0.0.1', name: null),
            (ip: '::', name: null),
            (ip: '::1', name: null),
            (ip: '192.168.1.10', name: null),
          ],
        ),
        _device(
          hwaddr: 'bb',
          lastQuery: DateTime.fromMillisecondsSinceEpoch(0),
          ips: [(ip: '192.168.1.20', name: null)],
        ),
      ];

      expect(devices.toDeviceOptions(), const [
        DeviceOption(ip: '192.168.1.10', hwaddr: 'aa', macVendor: ''),
      ]);
    });

    test('sorts IPv4 first, then by address', () {
      final devices = [
        _device(
          hwaddr: 'aa',
          macVendor: 'Vendor',
          ips: [
            (ip: 'fe80::1', name: null),
            (ip: '192.168.1.100', name: null),
            (ip: '192.168.1.9', name: null),
          ],
        ),
      ];

      expect(devices.toDeviceOptions().map((o) => o.ip), [
        '192.168.1.9',
        '192.168.1.100',
        'fe80::1',
      ]);
    });

    test('returns an empty list for no devices', () {
      expect(<Device>[].toDeviceOptions(), isEmpty);
    });
  });

  group('toLookups', () {
    test('builds IP, MAC and hostname maps', () {
      final devices = [
        _device(
          hwaddr: 'aa',
          ips: [
            (ip: '192.168.1.10', name: 'nas'),
            (ip: '192.168.1.11', name: ''),
          ],
        ),
        _device(hwaddr: 'bb', ips: [(ip: '192.168.1.20', name: null)]),
      ];

      final lookups = devices.toLookups();

      expect(lookups.ipToMac, {
        '192.168.1.10': 'aa',
        '192.168.1.11': 'aa',
        '192.168.1.20': 'bb',
      });
      expect(lookups.ipToHostname, {'192.168.1.10': 'nas'});
      // The first IP of each device is used.
      expect(lookups.macToIp, {'aa': '192.168.1.10', 'bb': '192.168.1.20'});
    });
  });
}
