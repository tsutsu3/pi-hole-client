import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

/// Maps [GroupsGetGroupsInner] (OpenAPI-generated) to [Group] (domain model).
extension GroupsGetGroupsInnerMapper on GroupsGetGroupsInner {
  Group toDomain() {
    return Group(
      id: id ?? 0,
      name: name ?? '',
      enabled: enabled ?? true,
      dateAdded: DateTime.fromMillisecondsSinceEpoch((dateAdded ?? 0) * 1000),
      dateModified:
          DateTime.fromMillisecondsSinceEpoch((dateModified ?? 0) * 1000),
      comment: comment,
    );
  }
}

/// Maps [GetGroups200Response] (OpenAPI-generated) to domain model list.
extension GetGroups200ResponseMapper on GetGroups200Response {
  List<Group> toDomainList() {
    return (groups ?? []).map((g) => g.toDomain()).toList();
  }
}
