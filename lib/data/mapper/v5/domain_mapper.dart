import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v5/domains.dart' as s;
import 'package:pi_hole_client/domain/model/domain/domain.dart' as d;

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
    final safeType = (type >= 0 && type < V5DomainType.values.length)
        ? V5DomainType.values[type]
        : V5DomainType.black; // fallback enum value

    return d.Domain(
      id: id,
      name: domain,
      type: safeType.toDomainType(),
      kind: safeType.toDomainKind(),
      comment: comment,
      groups: groups,
      enabled: enabled == 1,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(dateAdded * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(dateModified * 1000),
    );
  }
}
