import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v6/lists/search.dart' as s;
import 'package:pi_hole_client/domain/model/domain/domain.dart' as d;
import 'package:pi_hole_client/domain/model/list/adlist.dart' as a;
import 'package:pi_hole_client/domain/model/list/list_search_result.dart';
import 'package:pi_hole_client/utils/punycode.dart';

extension ListSearchMapper on s.Search {
  ListSearchResult toDomain() {
    return ListSearchResult(
      domains: search.domains.map((e) => e.toDomain()).toList(),
      gravityMatches: search.gravity
          .map(
            (e) => GravityMatch(
              adlist: e.toAdlist(),
              matchedDomain: e.domain,
            ),
          )
          .toList(),
      meta: ListSearchMeta(
        domainsExact: search.results.domains.exact,
        domainsRegex: search.results.domains.regex,
        gravityAllow: search.results.gravity.allow,
        gravityBlock: search.results.gravity.block,
        total: search.results.total,
      ),
    );
  }
}

extension SearchDomainEntryMapper on s.DomainEntry {
  d.Domain toDomain() {
    return d.Domain(
      id: id,
      type: type == s.DomainType.allow ? DomainType.allow : DomainType.deny,
      kind: kind == s.DomainKind.exact ? DomainKind.exact : DomainKind.regex,
      name: decodePunycode(domain),
      punyCode: domain,
      enabled: enabled,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(dateAdded * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(dateModified * 1000),
      comment: comment,
      groups: groups,
    );
  }
}

extension SearchGravityEntryMapper on s.GravityEntry {
  a.Adlist toAdlist() {
    return a.Adlist(
      address: address,
      type: type == s.GravityType.allow ? ListType.allow : ListType.block,
      comment: comment,
      groups: groups,
      enabled: enabled,
      id: id,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(dateAdded * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(dateModified * 1000),
      dateUpdated: DateTime.fromMillisecondsSinceEpoch(dateUpdated * 1000),
      number: number,
      invalidDomains: invalidDomains,
      abpEntries: abpEntries,
      status: status.toListsStatus(),
    );
  }
}
