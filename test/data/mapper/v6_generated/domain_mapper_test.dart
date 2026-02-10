import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/mapper/v6_generated/domain_mapper.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

void main() {
  group('GetDomainsInnerMapper', () {
    test('maps all fields correctly', () {
      final inner = GetDomainsInner(
        id: 1,
        domain: 'example.com',
        unicode: 'example.com',
        type: GetDomainsInnerTypeEnum.allow,
        kind: GetDomainsInnerKindEnum.exact,
        comment: 'test comment',
        groups: [0, 1],
        enabled: true,
        dateAdded: 1700000000,
        dateModified: 1700001000,
      );

      final domain = inner.toDomain();

      expect(domain.id, 1);
      expect(domain.name, 'example.com');
      expect(domain.type, DomainType.allow);
      expect(domain.kind, DomainKind.exact);
      expect(domain.comment, 'test comment');
      expect(domain.groups, [0, 1]);
      expect(domain.enabled, true);
      expect(
        domain.dateAdded,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        domain.dateModified,
        DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000),
      );
    });

    test('uses unicode field as name over domain field', () {
      final inner = GetDomainsInner(
        domain: 'xn--example.com',
        unicode: 'unicode-example.com',
      );

      final domain = inner.toDomain();

      expect(domain.name, 'unicode-example.com');
    });

    test('falls back to domain field when unicode is null', () {
      final inner = GetDomainsInner(domain: 'example.com');

      final domain = inner.toDomain();

      expect(domain.name, 'example.com');
    });

    test('maps deny type correctly', () {
      final inner = GetDomainsInner(
        type: GetDomainsInnerTypeEnum.deny,
        kind: GetDomainsInnerKindEnum.regex,
      );

      final domain = inner.toDomain();

      expect(domain.type, DomainType.deny);
      expect(domain.kind, DomainKind.regex);
    });

    test('uses defaults for null fields', () {
      final inner = GetDomainsInner();

      final domain = inner.toDomain();

      expect(domain.id, 0);
      expect(domain.name, '');
      expect(domain.type, DomainType.allow);
      expect(domain.kind, DomainKind.exact);
      expect(domain.groups, [0]);
      expect(domain.enabled, true);
      expect(domain.dateAdded, DateTime.fromMillisecondsSinceEpoch(0));
      expect(domain.dateModified, DateTime.fromMillisecondsSinceEpoch(0));
    });
  });

  group('GetDomains200ResponseMapper', () {
    test('toDomainList maps all entries', () {
      final response = GetDomains200Response(
        domains: [
          GetDomainsInner(id: 1, domain: 'a.com'),
          GetDomainsInner(id: 2, domain: 'b.com'),
        ],
      );

      final list = response.toDomainList();

      expect(list.length, 2);
      expect(list[0].id, 1);
      expect(list[1].id, 2);
    });

    test('toDomainList returns empty list when domains is null', () {
      final response = GetDomains200Response();

      final list = response.toDomainList();

      expect(list, isEmpty);
    });

    test('toDomainLists categorizes domains correctly', () {
      final response = GetDomains200Response(
        domains: [
          GetDomainsInner(
            id: 1,
            domain: 'allow-exact.com',
            type: GetDomainsInnerTypeEnum.allow,
            kind: GetDomainsInnerKindEnum.exact,
          ),
          GetDomainsInner(
            id: 2,
            domain: '.*allow-regex',
            type: GetDomainsInnerTypeEnum.allow,
            kind: GetDomainsInnerKindEnum.regex,
          ),
          GetDomainsInner(
            id: 3,
            domain: 'deny-exact.com',
            type: GetDomainsInnerTypeEnum.deny,
            kind: GetDomainsInnerKindEnum.exact,
          ),
          GetDomainsInner(
            id: 4,
            domain: '.*deny-regex',
            type: GetDomainsInnerTypeEnum.deny,
            kind: GetDomainsInnerKindEnum.regex,
          ),
        ],
      );

      final lists = response.toDomainLists();

      expect(lists.allowExact.length, 1);
      expect(lists.allowExact[0].name, 'allow-exact.com');
      expect(lists.allowRegex.length, 1);
      expect(lists.allowRegex[0].name, '.*allow-regex');
      expect(lists.denyExact.length, 1);
      expect(lists.denyExact[0].name, 'deny-exact.com');
      expect(lists.denyRegex.length, 1);
      expect(lists.denyRegex[0].name, '.*deny-regex');
    });

    test('toDomainLists returns empty lists when no domains', () {
      final response = GetDomains200Response();

      final lists = response.toDomainLists();

      expect(lists.allowExact, isEmpty);
      expect(lists.allowRegex, isEmpty);
      expect(lists.denyExact, isEmpty);
      expect(lists.denyRegex, isEmpty);
    });
  });

  group('GetDomainsInnerTypeEnumMapper', () {
    test('maps allow', () {
      expect(
        GetDomainsInnerTypeEnum.allow.toDomainType(),
        DomainType.allow,
      );
    });

    test('maps deny', () {
      expect(
        GetDomainsInnerTypeEnum.deny.toDomainType(),
        DomainType.deny,
      );
    });

    test('maps null to allow', () {
      const GetDomainsInnerTypeEnum? value = null;
      expect(value.toDomainType(), DomainType.allow);
    });
  });

  group('GetDomainsInnerKindEnumMapper', () {
    test('maps exact', () {
      expect(
        GetDomainsInnerKindEnum.exact.toDomainKind(),
        DomainKind.exact,
      );
    });

    test('maps regex', () {
      expect(
        GetDomainsInnerKindEnum.regex.toDomainKind(),
        DomainKind.regex,
      );
    });

    test('maps null to exact', () {
      const GetDomainsInnerKindEnum? value = null;
      expect(value.toDomainKind(), DomainKind.exact);
    });
  });
}
