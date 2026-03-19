import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/config_mapper.dart';
import 'package:pi_hole_client/data/model/v6/config/config.dart' as s;
import 'package:pi_hole_client/domain/model/config/config.dart' as d;
import 'package:pi_hole_client/domain/model/config/dns_config.dart' as d;

void main() {
  group('ConfigMapper (v6)', () {
    test('maps queryLogging=true correctly', () {
      const source = s.Config(
        config: s.ConfigData(dns: s.Dns(queryLogging: true)),
      );

      final domain = source.toDomain();

      expect(domain.dns, isNotNull);
      expect(domain.dns!.queryLogging, isTrue);
    });

    test('maps queryLogging=false correctly', () {
      const source = s.Config(
        config: s.ConfigData(dns: s.Dns(queryLogging: false)),
      );

      expect(source.toDomain().dns!.queryLogging, isFalse);
    });

    test('dns is null when queryLogging is absent', () {
      const source = s.Config(config: s.ConfigData(dns: s.Dns()));

      expect(source.toDomain().dns, isNull);
    });

    test('dns is null when config.dns is null', () {
      const source = s.Config(config: s.ConfigData());
      expect(source.toDomain().dns, isNull);
    });

    test('dns is null when config is null', () {
      const source = s.Config();
      expect(source.toDomain().dns, isNull);
    });
  });

  group('ConfigDataMapper (v6)', () {
    test('converts domain Config with queryLogging to ConfigData', () {
      const domain = d.Config(dns: d.DnsConfig(queryLogging: true));
      final data = domain.toData();

      expect(data.dns, isNotNull);
      expect(data.dns!.queryLogging, isTrue);
    });

    test('dns is null when DnsConfig is null', () {
      const domain = d.Config();
      expect(domain.toData().dns, isNull);
    });
  });
}
