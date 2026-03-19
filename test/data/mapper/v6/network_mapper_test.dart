import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/network_mapper.dart';
import 'package:pi_hole_client/data/model/v6/network/devices.dart' as s;

const _deviceIp = s.DeviceIp(
  ip: '192.168.1.50',
  lastSeen: 1700003600,
  nameUpdated: 1700000000,
  name: 'laptop',
);

const _device = s.DeviceData(
  id: 1,
  hwaddr: 'aa:bb:cc:dd:ee:ff',
  interface: 'eth0',
  firstSeen: 1700000000,
  lastQuery: 1700003600,
  numQueries: 500,
  ips: [_deviceIp],
  macVendor: 'Acme Corp',
);

void main() {
  group('DevicesMapper (v6)', () {
    test('maps all device fields correctly', () {
      const source = s.Devices(devices: [_device], took: 0.001);
      final result = source.toDomain();

      expect(result.length, 1);
      final device = result[0];
      expect(device.id, 1);
      expect(device.hwaddr, 'aa:bb:cc:dd:ee:ff');
      expect(device.interface, 'eth0');
      expect(device.firstSeen, DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000));
      expect(device.lastQuery, DateTime.fromMillisecondsSinceEpoch(1700003600 * 1000));
      expect(device.numQueries, 500);
      expect(device.macVendor, 'Acme Corp');
    });

    test('maps device IPs correctly', () {
      const source = s.Devices(devices: [_device], took: 0.001);
      final device = source.toDomain()[0];

      expect(device.ips.length, 1);
      expect(device.ips[0].ip, '192.168.1.50');
      expect(device.ips[0].lastSeen, DateTime.fromMillisecondsSinceEpoch(1700003600 * 1000));
      expect(device.ips[0].nameUpdated, DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000));
      expect(device.ips[0].name, 'laptop');
    });

    test('maps multiple devices', () {
      const source = s.Devices(devices: [_device, _device], took: 0.001);
      expect(source.toDomain().length, 2);
    });

    test('returns empty list when devices is empty', () {
      const source = s.Devices(devices: [], took: 0.001);
      expect(source.toDomain(), isEmpty);
    });
  });

  group('DeviceIpMapper (v6)', () {
    test('maps all fields correctly', () {
      final domain = _deviceIp.toDomain();

      expect(domain.ip, '192.168.1.50');
      expect(domain.lastSeen, DateTime.fromMillisecondsSinceEpoch(1700003600 * 1000));
      expect(domain.nameUpdated, DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000));
      expect(domain.name, 'laptop');
    });

    test('name is null when not provided', () {
      const ip = s.DeviceIp(
        ip: '10.0.0.1',
        lastSeen: 0,
        nameUpdated: 0,
      );
      expect(ip.toDomain().name, isNull);
    });
  });
}
