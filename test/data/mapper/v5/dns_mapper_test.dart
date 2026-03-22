import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v5/dns_mapper.dart';
import 'package:pi_hole_client/data/model/v5/dns.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

void main() {
  group('BlockingMapperV5', () {
    test('maps enabled status correctly', () {
      const source = s.Blocking(status: 'enabled');
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.enabled);
      expect(domain.timer, isNull);
    });

    test('maps disabled status correctly', () {
      const source = s.Blocking(status: 'disabled');
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.disabled);
      expect(domain.timer, isNull);
    });

    test('maps unknown status to unknown', () {
      const source = s.Blocking(status: 'unknown');
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.unknown);
      expect(domain.timer, isNull);
    });

    test('maps unrecognized status to unknown', () {
      const source = s.Blocking(status: 'invalid_value');
      final domain = source.toDomain();
      expect(domain.status, DnsBlockingStatus.unknown);
    });

    test('timer is always null for v5', () {
      for (final status in ['enabled', 'disabled', 'unknown']) {
        final domain = s.Blocking(status: status).toDomain();
        expect(domain.timer, isNull, reason: 'timer should be null for v5');
      }
    });
  });
}
