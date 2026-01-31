import 'package:pi_hole_client/data/model/v6/groups/groups.dart' as srv;
import 'package:pi_hole_client/domain/model/group/group.dart';

const kSrvGetGroups = srv.Groups(
  groups: [
    srv.Group(
      id: 0,
      name: 'Default',
      comment: 'The default group',
      enabled: true,
      dateAdded: 1594670974,
      dateModified: 1611157897,
    ),
    srv.Group(
      id: 5,
      name: 'test',
      enabled: false,
      dateAdded: 1604871899,
      dateModified: 1604871899,
    ),
  ],
  took: 0.003,
);

final kRepoFetchGroups = [
  Group(
    id: 0,
    name: 'Default',
    comment: 'The default group',
    enabled: true,
    dateAdded: DateTime.fromMillisecondsSinceEpoch(1594670974 * 1000),
    dateModified: DateTime.fromMillisecondsSinceEpoch(1611157897 * 1000),
  ),
  Group(
    id: 5,
    name: 'test',
    enabled: false,
    dateAdded: DateTime.fromMillisecondsSinceEpoch(1604871899 * 1000),
    dateModified: DateTime.fromMillisecondsSinceEpoch(1604871899 * 1000),
  ),
];
