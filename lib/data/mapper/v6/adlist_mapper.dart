import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v6/lists/lists.dart' as s;
import 'package:pi_hole_client/domain/model/list/adlist.dart' as d;

extension ListsMapper on s.Lists {
  List<d.Adlist> toDomain() {
    return lists.map((list) {
      return d.Adlist(
        address: list.address,
        type: list.type.toListType(),
        groups: list.groups,
        enabled: list.enabled,
        id: list.id,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(list.dateAdded * 1000),
        dateModified: DateTime.fromMillisecondsSinceEpoch(
          list.dateModified * 1000,
        ),
        dateUpdated: DateTime.fromMillisecondsSinceEpoch(
          list.dateUpdated * 1000,
        ),
        number: list.number,
        invalidDomains: list.invalidDomains,
        abpEntries: list.abpEntries,
        status: list.status.toListsStatus(),
        comment: list.comment,
      );
    }).toList();
  }

  d.Adlist toSingleDomain() {
    if (lists.length != 1) {
      throw StateError('Expected exactly 1 item in lists, got ${lists.length}');
    }
    return toDomain().first;
  }
}
