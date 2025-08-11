import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/services/api/model/v5/domains.dart' as s;
import 'package:pi_hole_client/domain/models/domain/domain.dart' as d;

extension DomainsMapper on s.Domains {
  List<d.Domain> toDomain() {
    return data.map((domain) {
      return domain.toDomain();
    }).toList();
  }

  d.Domain toSingleDomain() {
    if (data.length != 1) {
      throw Exception('Expected exactly one domain, but got ${data.length}');
    }

    return toDomain().first;
  }
}

extension DomainMapper on s.Domain {
  d.Domain toDomain() {
    return d.Domain(
      id: id,
      name: domain,
      type: V5DomainType.values[type].toDomainType(),
      kind: V5DomainType.values[type].toDomainKind(),
      comment: comment,
      groups: groups,
      enabled: enabled == 1,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(dateAdded * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(dateModified * 1000),
    );
  }
}
