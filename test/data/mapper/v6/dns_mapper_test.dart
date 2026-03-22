import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/dns_mapper.dart';
import 'package:pi_hole_client/data/model/v6/dns/dns.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

void main() {
  group('BlockingMapper (v6)', () {
    test('maps enabled status correctly', () {
      final source = s.Blocking(blocking: 'enabled', timer: null, took: 0.001);
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.enabled);
      expect(domain.timer, isNull);
    });

    test('maps disabled status correctly', () {
      final source = s.Blocking(blocking: 'disabled', timer: 300, took: 0.001);
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.disabled);
      expect(domain.timer, 300);
    });

    test('maps failed status correctly', () {
      final source = s.Blocking(blocking: 'failed', timer: null, took: 0.001);
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.failed);
    });

    test('maps unknown status correctly', () {
      final source = s.Blocking(blocking: 'unknown', timer: null, took: 0.001);
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.unknown);
    });

    test('unrecognized status maps to unknown', () {
      final source = s.Blocking(
        blocking: 'invalid_value',
        timer: null,
        took: 0.001,
      );
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.unknown);
    });

    test('timer value is passed through', () {
      final source = s.Blocking(blocking: 'disabled', timer: 600, took: 0.001);
      expect(source.toDomain().timer, 600);
    });
  });

  group('convertBlockingStatus', () {
    test('maps all known status strings', () {
      expect(convertBlockingStatus('enabled'), DnsBlockingStatus.enabled);
      expect(convertBlockingStatus('disabled'), DnsBlockingStatus.disabled);
      expect(convertBlockingStatus('failed'), DnsBlockingStatus.failed);
      expect(convertBlockingStatus('unknown'), DnsBlockingStatus.unknown);
      expect(convertBlockingStatus('other'), DnsBlockingStatus.unknown);
    });
  });
}
