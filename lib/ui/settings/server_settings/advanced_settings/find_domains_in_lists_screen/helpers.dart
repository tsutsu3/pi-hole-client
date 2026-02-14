import 'package:pi_hole_client/config/enums.dart' show ListType, ListsStatus;
import 'package:pi_hole_client/data/model/v6/lists/search.dart' as v6_search;
import 'package:pi_hole_client/domain/model/list/adlist.dart';

Adlist mapGravityEntry(v6_search.GravityEntry entry) {
  return Adlist(
    address: entry.address,
    type: entry.type == v6_search.GravityType.allow
        ? ListType.allow
        : ListType.block,
    comment: entry.comment,
    groups: entry.groups,
    enabled: entry.enabled,
    id: entry.id,
    dateAdded: DateTime.fromMillisecondsSinceEpoch(entry.dateAdded * 1000),
    dateModified: DateTime.fromMillisecondsSinceEpoch(
      entry.dateModified * 1000,
    ),
    dateUpdated: DateTime.fromMillisecondsSinceEpoch(entry.dateUpdated * 1000),
    number: entry.number,
    invalidDomains: entry.invalidDomains,
    abpEntries: entry.abpEntries,
    status: mapListStatus(entry.status),
  );
}

ListsStatus mapListStatus(int status) {
  if (status >= 0 && status < ListsStatus.values.length) {
    return ListsStatus.values[status];
  }
  return ListsStatus.unknown;
}

String formatTimestamp(DateTime dateTime) {
  final y = dateTime.year.toString().padLeft(4, '0');
  final m = dateTime.month.toString().padLeft(2, '0');
  final d = dateTime.day.toString().padLeft(2, '0');
  final h = dateTime.hour.toString().padLeft(2, '0');
  final min = dateTime.minute.toString().padLeft(2, '0');
  final s = dateTime.second.toString().padLeft(2, '0');
  return '$y-$m-$d $h:$min:$s';
}
