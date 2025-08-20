import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/domains/domains.dart' as srv;
import 'package:pi_hole_client/domain/model/domain/domain.dart' as repo;

const kSrvGetDomains = srv.Domains(
  domains: [
    srv.DomainData(
      domain: 'example.com',
      unicode: 'example.com',
      type: 'allow',
      kind: 'exact',
      groups: [0],
      enabled: true,
      id: 1,
      dateAdded: 1581907991,
      dateModified: 1581907993,
    ),
    srv.DomainData(
      domain: r'xn--88jzah\.com$',
      unicode: r'てすと\.com$',
      type: 'deny',
      kind: 'regex',
      groups: [0],
      enabled: true,
      id: 2,
      dateAdded: 1581907991,
      dateModified: 1581907993,
    ),
  ],
  took: 0.003,
);

const kSrvPostDomains = srv.Domains(
  domains: [
    srv.DomainData(
      domain: 'example.com',
      unicode: 'example.com',
      type: 'allow',
      kind: 'exact',
      groups: [0],
      enabled: true,
      id: 1,
      dateAdded: 1581907991,
      dateModified: 1581907991,
    ),
  ],
  processed: srv.Processed(
    success: [srv.ProcessedItem(item: 'example.com')],
    errors: [],
  ),
  took: 0.003,
);

const kSrvPutDomains = srv.Domains(
  domains: [
    srv.DomainData(
      domain: 'example.com',
      unicode: 'example.com',
      type: 'allow',
      kind: 'exact',
      comment: 'test',
      groups: [1],
      enabled: false,
      id: 1,
      dateAdded: 1581907991,
      dateModified: 1581907993,
    ),
  ],
  processed: srv.Processed(
    success: [srv.ProcessedItem(item: 'example.com')],
    errors: [],
  ),
  took: 0.003,
);

// repo models

final kRepoFetchAllDomains = repo.DomainLists(
  whitelist: [
    repo.Domain(
      id: 1,
      name: 'example.com',
      type: DomainType.allow,
      kind: DomainKind.exact,
      comment: null,
      groups: [0],
      enabled: true,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(1581907991 * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(1581907993 * 1000),
    ),
  ],
  whitelistRegex: [],
  blacklist: [],
  blacklistRegex: [
    repo.Domain(
      id: 2,
      name: r'てすと\.com$',
      type: DomainType.deny,
      kind: DomainKind.regex,
      comment: null,
      groups: [0],
      enabled: true,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(1581907991 * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(1581907993 * 1000),
    ),
  ],
);

final kRepoAddDomain = repo.Domain(
  id: 1,
  name: 'example.com',
  type: DomainType.allow,
  kind: DomainKind.exact,
  comment: null,
  groups: [0],
  enabled: true,
  dateAdded: DateTime.fromMillisecondsSinceEpoch(1581907991 * 1000),
  dateModified: DateTime.fromMillisecondsSinceEpoch(1581907991 * 1000),
);

final kRepoUpdateDomain = repo.Domain(
  id: 1,
  name: 'example.com',
  type: DomainType.allow,
  kind: DomainKind.exact,
  comment: 'test',
  groups: [1],
  enabled: false,
  dateAdded: DateTime.fromMillisecondsSinceEpoch(1581907991 * 1000),
  dateModified: DateTime.fromMillisecondsSinceEpoch(1581907993 * 1000),
);
