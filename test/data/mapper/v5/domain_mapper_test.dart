import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v5/domain_mapper.dart';
import 'package:pi_hole_client/data/model/v5/domains.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

void main() {
  group('DomainMapper (v5)', () {
    test('maps all fields correctly', () {
      const source = s.Domain(
        id: 1,
        type: 0, // white → allow/exact
        domain: 'example.com',
        enabled: 1,
        dateAdded: 1700000000,
        dateModified: 1700001000,
        comment: 'test comment',
        groups: [0, 1],
      );

      final domain = source.toDomain();

      expect(domain.id, 1);
      expect(domain.name, 'example.com');
      expect(domain.punyCode, 'example.com');
      expect(domain.type, DomainType.allow);
      expect(domain.kind, DomainKind.exact);
      expect(domain.comment, 'test comment');
      expect(domain.groups, [0, 1]);
      expect(domain.enabled, isTrue);
      expect(
        domain.dateAdded,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        domain.dateModified,
        DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000),
      );
    });

    test('enabled == 0 maps to false', () {
      const source = s.Domain(
        id: 2,
        type: 1,
        domain: 'blocked.com',
        enabled: 0,
        dateAdded: 0,
        dateModified: 0,
        comment: '',
        groups: [],
      );
      expect(source.toDomain().enabled, isFalse);
    });

    test('maps all V5DomainType values', () {
      final cases = {
        0: (DomainType.allow, DomainKind.exact), // white
        1: (DomainType.deny, DomainKind.exact), // black
        2: (DomainType.allow, DomainKind.regex), // regex_white
        3: (DomainType.deny, DomainKind.regex), // regex_black
      };

      for (final entry in cases.entries) {
        final domain = s.Domain(
          id: entry.key,
          type: entry.key,
          domain: 'test.com',
          enabled: 1,
          dateAdded: 0,
          dateModified: 0,
          comment: '',
          groups: [],
        ).toDomain();

        expect(domain.type, entry.value.$1, reason: 'type for index ${entry.key}');
        expect(domain.kind, entry.value.$2, reason: 'kind for index ${entry.key}');
      }
    });

    test('out-of-range type falls back to black (deny/exact)', () {
      const source = s.Domain(
        id: 99,
        type: 999,
        domain: 'test.com',
        enabled: 1,
        dateAdded: 0,
        dateModified: 0,
        comment: '',
        groups: [],
      );
      final domain = source.toDomain();
      expect(domain.type, DomainType.deny);
      expect(domain.kind, DomainKind.exact);
    });
  });

  group('DomainsMapper (v5)', () {
    test('toDomain maps multiple domains', () {
      const source = s.Domains(data: [
        s.Domain(
          id: 1,
          type: 0,
          domain: 'a.com',
          enabled: 1,
          dateAdded: 0,
          dateModified: 0,
          comment: '',
          groups: [],
        ),
        s.Domain(
          id: 2,
          type: 1,
          domain: 'b.com',
          enabled: 1,
          dateAdded: 0,
          dateModified: 0,
          comment: '',
          groups: [],
        ),
      ]);

      final list = source.toDomain();
      expect(list.length, 2);
      expect(list[0].name, 'a.com');
      expect(list[1].name, 'b.com');
    });

    test('toDomain returns empty list when data is empty', () {
      const source = s.Domains(data: []);
      expect(source.toDomain(), isEmpty);
    });

    test('toSingleDomain returns the one domain', () {
      const source = s.Domains(data: [
        s.Domain(
          id: 1,
          type: 0,
          domain: 'single.com',
          enabled: 1,
          dateAdded: 0,
          dateModified: 0,
          comment: '',
          groups: [],
        ),
      ]);
      expect(source.toSingleDomain().name, 'single.com');
    });

    test('toSingleDomain throws when data has 0 items', () {
      const source = s.Domains(data: []);
      expect(() => source.toSingleDomain(), throwsA(isA<Exception>()));
    });

    test('toSingleDomain throws when data has multiple items', () {
      const source = s.Domains(data: [
        s.Domain(
          id: 1,
          type: 0,
          domain: 'a.com',
          enabled: 1,
          dateAdded: 0,
          dateModified: 0,
          comment: '',
          groups: [],
        ),
        s.Domain(
          id: 2,
          type: 0,
          domain: 'b.com',
          enabled: 1,
          dateAdded: 0,
          dateModified: 0,
          comment: '',
          groups: [],
        ),
      ]);
      expect(() => source.toSingleDomain(), throwsA(isA<Exception>()));
    });
  });
}
