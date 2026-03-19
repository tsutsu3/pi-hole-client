import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/dhcp_mapper.dart';
import 'package:pi_hole_client/data/model/v6/dhcp/dhcp.dart' as s;

void main() {
  group('DhcpMapper (v6)', () {
    test('maps all lease fields correctly', () {
      const source = s.Dhcp(
        leases: [
          s.DhcpData(
            expires: 1700007200,
            name: 'mydevice',
            hwaddr: 'aa:bb:cc:dd:ee:ff',
            ip: '192.168.1.100',
            clientid: 'client-001',
          ),
        ],
        took: 0.001,
      );

      final result = source.toDomain();

      expect(result.length, 1);
      final lease = result[0];
      expect(lease.expires, DateTime.fromMillisecondsSinceEpoch(1700007200 * 1000));
      expect(lease.name, 'mydevice');
      expect(lease.hwaddr, 'aa:bb:cc:dd:ee:ff');
      expect(lease.ip, '192.168.1.100');
      expect(lease.clientid, 'client-001');
    });

    test('maps multiple leases', () {
      const source = s.Dhcp(
        leases: [
          s.DhcpData(
            expires: 1700007200,
            name: 'device1',
            hwaddr: 'aa:bb:cc:dd:ee:01',
            ip: '192.168.1.101',
            clientid: 'c1',
          ),
          s.DhcpData(
            expires: 1700010800,
            name: 'device2',
            hwaddr: 'aa:bb:cc:dd:ee:02',
            ip: '192.168.1.102',
            clientid: 'c2',
          ),
        ],
        took: 0.001,
      );

      final result = source.toDomain();
      expect(result.length, 2);
      expect(result[1].name, 'device2');
    });

    test('returns empty list when leases is empty', () {
      const source = s.Dhcp(leases: [], took: 0.001);
      expect(source.toDomain(), isEmpty);
    });
  });
}
