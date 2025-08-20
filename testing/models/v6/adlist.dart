import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v6/lists/lists.dart' as srv;
import 'package:pi_hole_client/domain/model/list/adlist.dart' as repo;

const kSrvListItems = [
  srv.ListItem(
    address: 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
    type: 'block',
    groups: [0],
    enabled: true,
    id: 1,
    dateAdded: 1594670974,
    dateModified: 1595279300,
    dateUpdated: 1595279300,
    number: 134553,
    invalidDomains: 0,
    abpEntries: 0,
    status: 1,
  ),
  srv.ListItem(
    address: 'https://mirror1.malwaredomains.com/files/justdomains',
    type: 'block',
    groups: [0],
    enabled: true,
    id: 2,
    dateAdded: 1594670974,
    dateModified: 1594670974,
    dateUpdated: 0,
    number: 100,
    invalidDomains: 0,
    abpEntries: 0,
    status: 3,
    comment: 'Migrated from /etc/pihole/adlists.list',
  ),
];

const kSrvGetLists = srv.Lists(lists: kSrvListItems, took: 0.003);

final kSrvPostLists = srv.Lists(lists: [kSrvListItems[0]], took: 0.003);

final kSrvPutLists = srv.Lists(
  lists: [
    kSrvListItems[0].copyWith(enabled: false, groups: [1], comment: 'test'),
  ],
  took: 0.003,
);

// repo models

final kRepoFetchAdlists = [
  repo.Adlist(
    address: 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',
    type: ListType.block,
    groups: [0],
    enabled: true,
    id: 1,
    dateAdded: DateTime.fromMillisecondsSinceEpoch(1594670974 * 1000),
    dateModified: DateTime.fromMillisecondsSinceEpoch(1595279300 * 1000),
    dateUpdated: DateTime.fromMillisecondsSinceEpoch(1595279300 * 1000),
    number: 134553,
    invalidDomains: 0,
    abpEntries: 0,
    status: 1.toListsStatus(),
  ),
  repo.Adlist(
    address: 'https://mirror1.malwaredomains.com/files/justdomains',
    type: ListType.block,
    groups: [0],
    enabled: true,
    id: 2,
    dateAdded: DateTime.fromMillisecondsSinceEpoch(1594670974 * 1000),
    dateModified: DateTime.fromMillisecondsSinceEpoch(1594670974 * 1000),
    dateUpdated: DateTime.fromMillisecondsSinceEpoch(0),
    number: 100,
    invalidDomains: 0,
    abpEntries: 0,
    status: 3.toListsStatus(),
    comment: 'Migrated from /etc/pihole/adlists.list',
  ),
];

final kRepoAddAdlist = kRepoFetchAdlists[0];

final kRepoUpdateAdlist = kRepoFetchAdlists[0].copyWith(
  enabled: false,
  groups: [1],
  comment: 'test',
);
