import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v6/domains/domains.dart' as s;
import 'package:pi_hole_client/domain/model/domain/domain.dart' as d;

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
    final allowExact = <d.Domain>[];
    final allowRegex = <d.Domain>[];
    final denyExact = <d.Domain>[];
    final denyRegex = <d.Domain>[];

    for (final domain in domains) {
      final dDomain = domain.toDomain();

      if (domain.type == DomainType.allow.name &&
          domain.kind == DomainKind.exact.name) {
        allowExact.add(dDomain);
      } else if (domain.type == DomainType.allow.name &&
          domain.kind == DomainKind.regex.name) {
        allowRegex.add(dDomain);
      } else if (domain.type == DomainType.deny.name &&
          domain.kind == DomainKind.exact.name) {
        denyExact.add(dDomain);
      } else if (domain.type == DomainType.deny.name &&
          domain.kind == DomainKind.regex.name) {
        denyRegex.add(dDomain);
      }
    }

    return d.DomainLists(
      allowExact: allowExact,
      allowRegex: allowRegex,
      denyExact: denyExact,
      denyRegex: denyRegex,
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
