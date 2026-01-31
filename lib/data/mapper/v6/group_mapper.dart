import 'package:pi_hole_client/data/model/v6/groups/groups.dart' as s;
import 'package:pi_hole_client/domain/model/group/group.dart' as d;

extension GroupsMapper on s.Groups {
  List<d.Group> toDomain() {
    return groups.map((group) {
      return d.Group(
        id: group.id,
        name: group.name,
        enabled: group.enabled,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(group.dateAdded * 1000),
        dateModified: DateTime.fromMillisecondsSinceEpoch(
          group.dateModified * 1000,
        ),
        comment: group.comment,
      );
    }).toList();
  }
}
