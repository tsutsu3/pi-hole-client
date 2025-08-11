import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/services/api/model/v6/domains/domains.dart'
    as s;
import 'package:pi_hole_client/domain/models/domain/domain.dart' as d;

extension DomainsMapper on s.Domains {
  List<d.Domain> toDomain() {
    return domains.map((domain) {
      return domain.toDomain();
    }).toList();
  }

  d.Domain toSingleDomain() {
    if (domains.length != 1) {
      throw Exception('Expected exactly one domain, but got ${domains.length}');
    }

    return toDomain().first;
  }

  d.DomainLists toDomainLists() {
    final whitelist = <d.Domain>[];
    final whitelistRegex = <d.Domain>[];
    final blacklist = <d.Domain>[];
    final blacklistRegex = <d.Domain>[];

    for (final domain in domains) {
      final dDomain = domain.toDomain();

      if (domain.type == DomainType.allow.name &&
          domain.kind == DomainKind.exact.name) {
        whitelist.add(dDomain);
      } else if (domain.type == DomainType.allow.name &&
          domain.kind == DomainKind.regex.name) {
        whitelistRegex.add(dDomain);
      } else if (domain.type == DomainType.deny.name &&
          domain.kind == DomainKind.exact.name) {
        blacklist.add(dDomain);
      } else if (domain.type == DomainType.deny.name &&
          domain.kind == DomainKind.regex.name) {
        blacklistRegex.add(dDomain);
      }
    }

    return d.DomainLists(
      whitelist: whitelist,
      whitelistRegex: whitelistRegex,
      blacklist: blacklist,
      blacklistRegex: blacklistRegex,
    );
  }
}

extension DomainDataMapper on s.DomainData {
  d.Domain toDomain() {
    return d.Domain(
      id: id,
      name: unicode,
      type: type.toDomainType(),
      kind: kind.toDomainKind(),
      comment: comment,
      groups: groups,
      enabled: enabled,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(dateAdded * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(dateModified * 1000),
    );
  }
}
