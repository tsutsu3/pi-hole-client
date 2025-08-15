import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v5/domains.dart' as srv;
import 'package:pi_hole_client/domain/model/domain/domain.dart' as repo;

final kJsonGetDomainsWhite = {
  'data': [
    {
      'id': 14,
      'type': 0,
      'domain': 'example.com',
      'enabled': 1,
      'date_added': 1733401118,
      'date_modified': 1733496612,
      'comment': '',
      'groups': [0],
    },
  ],
};

final kJsonGetDomainsWhiteRegex = {'data': []};

final kJsonGetDomainsBlack = {
  'data': [
    {
      'id': 2,
      'type': 1,
      'domain': 'test.com',
      'enabled': 1,
      'date_added': 1733401118,
      'date_modified': 1733496612,
      'comment': '',
      'groups': [0],
    },
  ],
};

final kJsonGetDomainsBlackRegex = {
  'data': [
    {
      'id': 3,
      'type': 3,
      'domain': r'test\.com$',
      'enabled': 0,
      'date_added': 1733401118,
      'date_modified': 1733496612,
      'comment': 'test',
      'groups': [0],
    },
  ],
};

final kSrvGetDomainsWhite = srv.Domains.fromJson(kJsonGetDomainsWhite);

final kSrvGetDomainsBlack = srv.Domains.fromJson(kJsonGetDomainsBlack);

final kSrvGetDomainsWhiteRegex = srv.Domains.fromJson(
  kJsonGetDomainsWhiteRegex,
);

final kSrvGetDomainsBlackRegex = srv.Domains.fromJson(
  kJsonGetDomainsBlackRegex,
);

// repo model

final kRepoGetDomainsWhite = repo.Domain(
  id: 14,
  name: 'example.com',
  type: DomainType.allow,
  kind: DomainKind.exact,
  comment: '',
  groups: [0],
  enabled: true,
  dateAdded: DateTime.fromMillisecondsSinceEpoch(1733401118 * 1000),
  dateModified: DateTime.fromMillisecondsSinceEpoch(1733496612 * 1000),
);

// final kRepoGetDomainsWhiteRegex = null;

final kRepoGetDomainsBlack = repo.Domain(
  id: 2,
  name: 'test.com',
  type: DomainType.deny,
  kind: DomainKind.exact,
  comment: '',
  groups: [0],
  enabled: true,
  dateAdded: DateTime.fromMillisecondsSinceEpoch(1733401118 * 1000),
  dateModified: DateTime.fromMillisecondsSinceEpoch(1733496612 * 1000),
);

final kRepoGetDomainsBlackRegex = repo.Domain(
  id: 3,
  name: r'test\.com$',
  type: DomainType.deny,
  kind: DomainKind.regex,
  comment: 'test',
  groups: [0],
  enabled: false,
  dateAdded: DateTime.fromMillisecondsSinceEpoch(1733401118 * 1000),
  dateModified: DateTime.fromMillisecondsSinceEpoch(1733496612 * 1000),
);

final kRepoGetDomains = repo.DomainLists(
  whitelist: [kRepoGetDomainsWhite],
  whitelistRegex: [],
  blacklist: [kRepoGetDomainsBlack],
  blacklistRegex: [kRepoGetDomainsBlackRegex],
);
