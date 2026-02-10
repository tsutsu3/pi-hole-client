import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

/// Maps [GetDomainsInner] (OpenAPI-generated) to [Domain] (domain model).
extension GetDomainsInnerMapper on GetDomainsInner {
  Domain toDomain() {
    return Domain(
      id: id ?? 0,
      name: unicode ?? domain ?? '',
      type: type.toDomainType(),
      kind: kind.toDomainKind(),
      comment: comment,
      groups: groups ?? [0],
      enabled: enabled ?? true,
      dateAdded: DateTime.fromMillisecondsSinceEpoch((dateAdded ?? 0) * 1000),
      dateModified:
          DateTime.fromMillisecondsSinceEpoch((dateModified ?? 0) * 1000),
    );
  }
}

/// Maps [GetDomains200Response] (OpenAPI-generated) to domain model lists.
extension GetDomains200ResponseMapper on GetDomains200Response {
  List<Domain> toDomainList() {
    return (domains ?? []).map((d) => d.toDomain()).toList();
  }

  DomainLists toDomainLists() {
    final allowExact = <Domain>[];
    final allowRegex = <Domain>[];
    final denyExact = <Domain>[];
    final denyRegex = <Domain>[];

    for (final domain in toDomainList()) {
      switch ((domain.type, domain.kind)) {
        case (DomainType.allow, DomainKind.exact):
          allowExact.add(domain);
        case (DomainType.allow, DomainKind.regex):
          allowRegex.add(domain);
        case (DomainType.deny, DomainKind.exact):
          denyExact.add(domain);
        case (DomainType.deny, DomainKind.regex):
          denyRegex.add(domain);
      }
    }

    return DomainLists(
      allowExact: allowExact,
      allowRegex: allowRegex,
      denyExact: denyExact,
      denyRegex: denyRegex,
    );
  }
}

/// Converts [GetDomainsInnerTypeEnum] to [DomainType].
extension GetDomainsInnerTypeEnumMapper on GetDomainsInnerTypeEnum? {
  DomainType toDomainType() {
    return switch (this) {
      GetDomainsInnerTypeEnum.allow => DomainType.allow,
      GetDomainsInnerTypeEnum.deny => DomainType.deny,
      null => DomainType.allow,
    };
  }
}

/// Converts [GetDomainsInnerKindEnum] to [DomainKind].
extension GetDomainsInnerKindEnumMapper on GetDomainsInnerKindEnum? {
  DomainKind toDomainKind() {
    return switch (this) {
      GetDomainsInnerKindEnum.exact => DomainKind.exact,
      GetDomainsInnerKindEnum.regex => DomainKind.regex,
      null => DomainKind.exact,
    };
  }
}
