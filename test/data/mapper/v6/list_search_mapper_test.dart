import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/list_search_mapper.dart';
import 'package:pi_hole_client/data/model/v6/lists/search.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

const _domainEntry = s.DomainEntry(
  id: 1,
  domain: 'example.com',
  enabled: true,
  type: s.DomainType.allow,
  kind: s.DomainKind.exact,
  dateAdded: 1700000000,
  dateModified: 1700001000,
  groups: [0],
  comment: 'test domain',
);

const _gravityEntry = s.GravityEntry(
  id: 10,
  domain: 'ads.example.com',
  address: 'https://example.com/list.txt',
  enabled: true,
  type: s.GravityType.block,
  dateAdded: 1700000000,
  dateModified: 1700001000,
  dateUpdated: 1700002000,
  number: 5000,
  invalidDomains: 2,
  abpEntries: 0,
  status: 2,
  groups: [0, 1],
  comment: null,
);

const _searchResults = s.SearchResults(
  domains: s.DomainMatchCount(exact: 1, regex: 0),
  gravity: s.GravityMatchCount(allow: 0, block: 1),
  total: 2,
);

const _searchData = s.SearchData(
  domains: [_domainEntry],
  gravity: [_gravityEntry],
  parameters: s.SearchParameters(
    partial: false,
    N: 25,
    domain: 'example.com',
    debug: false,
  ),
  results: _searchResults,
);

void main() {
  group('ListSearchMapper (v6)', () {
    test('maps search result meta correctly', () {
      const source = s.Search(search: _searchData, took: 0.001);
      final result = source.toDomain();

      expect(result.meta.domainsExact, 1);
      expect(result.meta.domainsRegex, 0);
      expect(result.meta.gravityAllow, 0);
      expect(result.meta.gravityBlock, 1);
      expect(result.meta.total, 2);
    });

    test('maps domain entries correctly', () {
      const source = s.Search(search: _searchData, took: 0.001);
      final result = source.toDomain();

      expect(result.domains.length, 1);
      final domain = result.domains[0];
      expect(domain.name, 'example.com');
      expect(domain.type, DomainType.allow);
      expect(domain.kind, DomainKind.exact);
      expect(domain.enabled, isTrue);
      expect(domain.comment, 'test domain');
    });

    test('maps gravity entries correctly', () {
      const source = s.Search(search: _searchData, took: 0.001);
      final result = source.toDomain();

      expect(result.gravityMatches.length, 1);
      final match = result.gravityMatches[0];
      expect(match.matchedDomain, 'ads.example.com');
      expect(match.adlist.address, 'https://example.com/list.txt');
      expect(match.adlist.type, ListType.block);
    });

    test('returns empty lists when no matches', () {
      const emptyData = s.SearchData(
        domains: [],
        gravity: [],
        parameters: s.SearchParameters(
          partial: false,
          N: 25,
          domain: '',
          debug: false,
        ),
        results: s.SearchResults(
          domains: s.DomainMatchCount(exact: 0, regex: 0),
          gravity: s.GravityMatchCount(allow: 0, block: 0),
          total: 0,
        ),
      );
      const source = s.Search(search: emptyData, took: 0.001);
      final result = source.toDomain();

      expect(result.domains, isEmpty);
      expect(result.gravityMatches, isEmpty);
    });
  });

  group('SearchDomainEntryMapper (v6)', () {
    test('maps deny/regex domain entry', () {
      const entry = s.DomainEntry(
        id: 2,
        domain: 'blocked.com',
        enabled: false,
        type: s.DomainType.deny,
        kind: s.DomainKind.regex,
        dateAdded: 0,
        dateModified: 0,
        groups: [],
      );
      final domain = entry.toDomain();
      expect(domain.type, DomainType.deny);
      expect(domain.kind, DomainKind.regex);
      expect(domain.enabled, isFalse);
    });
  });

  group('SearchGravityEntryMapper (v6)', () {
    test('maps allow type correctly', () {
      const entry = s.GravityEntry(
        id: 20,
        domain: 'safe.com',
        address: 'https://safe.com/allowlist.txt',
        enabled: true,
        type: s.GravityType.allow,
        dateAdded: 0,
        dateModified: 0,
        dateUpdated: 0,
        number: 100,
        invalidDomains: 0,
        abpEntries: 0,
        status: 1,
        groups: [],
      );
      final adlist = entry.toAdlist();
      expect(adlist.type, ListType.allow);
    });
  });
}
