import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/domain_mapper.dart';
import 'package:pi_hole_client/data/model/v6/domains/domains.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

const _allowExact = s.DomainData(
  id: 1,
  domain: 'example.com',
  unicode: 'example.com',
  type: 'allow',
  kind: 'exact',
  groups: [0],
  enabled: true,
  dateAdded: 1700000000,
  dateModified: 1700001000,
  comment: 'test',
);

const _denyRegex = s.DomainData(
  id: 2,
  domain: r'ads\.example\.com',
  unicode: r'ads\.example\.com',
  type: 'deny',
  kind: 'regex',
  groups: [],
  enabled: false,
  dateAdded: 1700002000,
  dateModified: 1700003000,
  comment: null,
);

void main() {
  group('DomainDataMapper (v6)', () {
    test('maps allow/exact domain correctly', () {
      final domain = _allowExact.toDomain();

      expect(domain.id, 1);
      expect(domain.name, 'example.com');
      expect(domain.punyCode, 'example.com');
      expect(domain.type, DomainType.allow);
      expect(domain.kind, DomainKind.exact);
      expect(domain.groups, [0]);
      expect(domain.enabled, isTrue);
      expect(domain.comment, 'test');
      expect(domain.dateAdded, DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000));
      expect(domain.dateModified, DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000));
    });

    test('maps deny/regex domain correctly', () {
      final domain = _denyRegex.toDomain();

      expect(domain.type, DomainType.deny);
      expect(domain.kind, DomainKind.regex);
      expect(domain.enabled, isFalse);
      expect(domain.comment, isNull);
    });
  });

  group('DomainsMapper (v6)', () {
    test('toDomain maps multiple domains', () {
      const source = s.Domains(domains: [_allowExact, _denyRegex], took: 0.001);
      final result = source.toDomain();

      expect(result.length, 2);
      expect(result[0].name, 'example.com');
      expect(result[1].type, DomainType.deny);
    });

    test('toDomain returns empty list when domains is empty', () {
      const source = s.Domains(domains: [], took: 0.001);
      expect(source.toDomain(), isEmpty);
    });

    test('toSingleDomain returns the one domain', () {
      const source = s.Domains(domains: [_allowExact], took: 0.001);
      expect(source.toSingleDomain().name, 'example.com');
    });

    test('toSingleDomain throws when empty', () {
      const source = s.Domains(domains: [], took: 0.001);
      expect(() => source.toSingleDomain(), throwsA(isA<Exception>()));
    });

    test('toSingleDomain throws when multiple', () {
      const source = s.Domains(domains: [_allowExact, _denyRegex], took: 0.001);
      expect(() => source.toSingleDomain(), throwsA(isA<Exception>()));
    });

    test('toDomainLists splits into 4 buckets correctly', () {
      const allowRegex = s.DomainData(
        id: 3,
        domain: r'safe\.com',
        unicode: r'safe\.com',
        type: 'allow',
        kind: 'regex',
        groups: [],
        enabled: true,
        dateAdded: 0,
        dateModified: 0,
      );
      const denyExact = s.DomainData(
        id: 4,
        domain: 'bad.com',
        unicode: 'bad.com',
        type: 'deny',
        kind: 'exact',
        groups: [],
        enabled: true,
        dateAdded: 0,
        dateModified: 0,
      );

      const source = s.Domains(
        domains: [_allowExact, allowRegex, denyExact, _denyRegex],
        took: 0.001,
      );
      final lists = source.toDomainLists();

      expect(lists.allowExact.length, 1);
      expect(lists.allowRegex.length, 1);
      expect(lists.denyExact.length, 1);
      expect(lists.denyRegex.length, 1);
      expect(lists.allowExact[0].name, 'example.com');
    });
  });
}
