import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

/// Maps [ListsGetListsInner] (OpenAPI-generated) to [Adlist] (domain model).
extension ListsGetListsInnerMapper on ListsGetListsInner {
  Adlist toDomain() {
    return Adlist(
      id: id ?? 0,
      address: address ?? '',
      type: type.toListType(),
      groups: groups ?? [0],
      enabled: enabled ?? true,
      dateAdded: DateTime.fromMillisecondsSinceEpoch((dateAdded ?? 0) * 1000),
      dateModified:
          DateTime.fromMillisecondsSinceEpoch((dateModified ?? 0) * 1000),
      dateUpdated:
          DateTime.fromMillisecondsSinceEpoch((dateUpdated ?? 0) * 1000),
      number: number ?? 0,
      invalidDomains: invalidDomains ?? 0,
      abpEntries: abpEntries ?? 0,
      status: (status ?? 0).toListsStatus(),
      comment: comment,
    );
  }
}

/// Maps [GetLists200Response] (OpenAPI-generated) to domain model list.
extension GetLists200ResponseMapper on GetLists200Response {
  List<Adlist> toDomainList() {
    return (lists ?? []).map((l) => l.toDomain()).toList();
  }
}

/// Converts [ListsGetListsInnerTypeEnum] to [ListType].
extension ListsGetListsInnerTypeEnumMapper on ListsGetListsInnerTypeEnum? {
  ListType toListType() {
    return switch (this) {
      ListsGetListsInnerTypeEnum.allow => ListType.allow,
      ListsGetListsInnerTypeEnum.block => ListType.block,
      null => ListType.unknown,
    };
  }
}
