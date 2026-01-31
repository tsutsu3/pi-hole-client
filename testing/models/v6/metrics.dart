import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/metrics/history.dart' as srv;
import 'package:pi_hole_client/data/model/v6/metrics/query.dart' as srv;
import 'package:pi_hole_client/data/model/v6/metrics/stats.dart' as srv;
import 'package:pi_hole_client/domain/model/metrics/clients.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/history.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/queries.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/summary.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart' as repo;
import 'package:pi_hole_client/domain/model/overtime/overtime.dart' as repo;

const kSrvGetHistory = srv.History(
  history: [
    srv.HistoryData(
      timestamp: 1511819900,
      total: 2134,
      cached: 525,
      blocked: 413,
      forwarded: 1196,
    ),
    srv.HistoryData(
      timestamp: 1511820500,
      total: 2014,
      cached: 52,
      blocked: 43,
      forwarded: 1910,
    ),
  ],
  took: 0.003,
);

const kSrvGetHistoryClient = srv.HistoryClients(
  clients: {
    '127.0.0.1': srv.Client(name: 'localhost', total: 13428),
    '::1': srv.Client(name: 'ip6-localnet', total: 2100),
    '192.168.1.1': srv.Client(name: null, total: 254),
    '::': srv.Client(name: 'pi.hole', total: 29),
    '0.0.0.0': srv.Client(name: 'other clients', total: 14),
  },
  history: [
    srv.HistoryEntry(
      timestamp: 1511819900,
      data: {
        '127.0.0.1': 35,
        '::1': 63,
        '192.168.1.1': 20,
        '::': 9,
        '0.0.0.0': 0,
      },
    ),
    srv.HistoryEntry(
      timestamp: 1511820500,
      data: {'127.0.0.1': 10, '::1': 44, '192.168.1.1': 56, '0.0.0.0': 52},
    ),
  ],
  took: 0.003,
);

const kSrvGetQueries = srv.Queries(
  queries: [
    srv.Query(
      id: 1,
      time: 1581907991.539157,
      type: 'A',
      domain: 'community.stoplight.io',
      status: 'FORWARDED',
      client: srv.QueryClient(ip: '192.168.0.14', name: 'desktop.lan'),
      dnssec: 'INSECURE',
      reply: srv.Reply(type: 'IP', time: 19),
      upstream: 'localhost#5353',
      ede: srv.Ede(code: 0),
    ),
    srv.Query(
      id: 2,
      time: 1581907871.583821,
      type: 'AAAA',
      domain: 'api.github.com',
      status: 'FORWARDED',
      client: srv.QueryClient(ip: '127.0.0.1', name: 'localhost'),
      dnssec: 'UNKNOWN',
      reply: srv.Reply(type: 'IP', time: 12.3),
      upstream: 'localhost#5353',
      ede: srv.Ede(code: 0),
      cname: 'test.com',
      listId: 1,
    ),
  ],
  cursor: 175881,
  recordsTotal: 1234,
  recordsFiltered: 999,
  draw: 1,
  took: 0.003,
);

const kSrvGetStatsSummary = srv.StatsSummary(
  queries: srv.StatsQueries(
    total: 7497,
    blocked: 3465,
    percentBlocked: 34.5,
    uniqueDomains: 445,
    forwarded: 4574,
    cached: 9765,
    types: srv.StatsTypes(
      a: 3643,
      aaaa: 123,
      any: 3423,
      srv: 345,
      soa: 7567,
      ptr: 456,
      txt: 85,
      naptr: 346,
      mx: 457,
      ds: 456,
      rrsig: 345,
      dnskey: 55,
      ns: 868,
      svcb: 645,
      https: 4,
      other: 845,
    ),
    status: srv.StatsStatus(
      unknown: 3,
      gravity: 72,
      forwarded: 533,
      cache: 32,
      regex: 84,
      denylist: 31,
      externalBlockedIp: 0,
      externalBlockedNull: 0,
      externalBlockedNxra: 0,
      gravityCname: 0,
      regexCname: 0,
      denylistCname: 0,
      retried: 0,
      retriedDnssec: 0,
      inProgress: 0,
      dbbusy: 0,
      specialDomain: 0,
      cacheStale: 0,
    ),
    replies: srv.StatsReplies(
      unknown: 3,
      nodata: 72,
      nxdomain: 533,
      cname: 32,
      ip: 84,
      domain: 31,
      rrname: 0,
      servfail: 0,
      refused: 0,
      notimp: 0,
      other: 0,
      dnssec: 327,
      none: 0,
      blob: 286,
    ),
  ),
  clients: srv.StatsClients(active: 10, total: 22),
  gravity: srv.StatsGravity(
    domainsBeingBlocked: 104756,
    lastUpdate: 1725194639,
  ),
  took: 0.003,
);

const kSrvGetStatsUpstreams = srv.StatsUpstreams(
  upstreams: [
    srv.StatsUpstream(
      ip: 'blocklist',
      name: 'blocklist',
      port: -1,
      count: 0,
      statistics: srv.Statistics(response: 0, variance: 0),
    ),
    srv.StatsUpstream(
      ip: 'cache',
      name: 'cache',
      port: -1,
      count: 2,
      statistics: srv.Statistics(response: 0, variance: 0),
    ),
    srv.StatsUpstream(
      ip: '8.8.8.8',
      name: 'dns.google',
      port: 53,
      count: 8,
      statistics: srv.Statistics(
        response: 0.0516872935824924,
        variance: 0.0049697216173868828,
      ),
    ),
  ],
  totalQueries: 8,
  forwardedQueries: 6,
  took: 0.003,
);

const kSrvGetStatsTopDomainsBlocked = srv.StatsTopDomains(
  domains: [srv.StatsDomain(domain: 'pi-hole.net', count: 8516)],
  totalQueries: 29160,
  blockedQueries: 6379,
  took: 0.003,
);

const kSrvGetStatsTopDomains = srv.StatsTopDomains(
  domains: [srv.StatsDomain(domain: 'pi-hole.net', count: 8516)],
  totalQueries: 29160,
  blockedQueries: 6379,
  took: 0.003,
);

const kSrvGetStatsTopClientsBlocked = srv.StatsTopClients(
  clients: [
    srv.StatsClient(ip: '192.168.0.44', name: 'raspberrypi.lan', count: 5896),
  ],
  totalQueries: 29160,
  blockedQueries: 6379,
  took: 0.003,
);

const kSrvGetStatsTopClients = srv.StatsTopClients(
  clients: [
    srv.StatsClient(ip: '192.168.0.44', name: 'raspberrypi.lan', count: 5896),
  ],
  totalQueries: 29160,
  blockedQueries: 6379,
  took: 0.003,
);

// repo models
final kRepoFetchHistory = repo.History(
  domainsOverTime: [
    repo.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1511819900 * 1000),
      count: 2134,
    ),
    repo.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1511820500 * 1000),
      count: 2014,
    ),
  ],
  adsOverTime: [
    repo.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1511819900 * 1000),
      count: 413,
    ),
    repo.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1511820500 * 1000),
      count: 43,
    ),
  ],
);

final kRepoFetchHistoryClient = repo.Clients(
  clients: const [
    repo.Client(name: 'localhost', ip: '127.0.0.1'),
    repo.Client(name: 'ip6-localnet', ip: '::1'),
    repo.Client(name: '', ip: '192.168.1.1'), // TODO: name null, not empty
    repo.Client(name: 'pi.hole', ip: '::'),
    repo.Client(name: 'other clients', ip: '0.0.0.0'),
  ],
  overTime: [
    repo.ClientOverTimeEntry(
      time: DateTime.fromMillisecondsSinceEpoch(1511819900 * 1000),
      values: [35, 63, 20, 9, 0],
    ),
    repo.ClientOverTimeEntry(
      time: DateTime.fromMillisecondsSinceEpoch(1511820500 * 1000),
      values: [10, 44, 56, 0, 52],
    ),
  ],
);

final kRepoFetchQueries = repo.Logs(
  logs: [
    repo.Log(
      dateTime: DateTime.fromMillisecondsSinceEpoch(1581907991 * 1000),
      type: DnsRecordType.a,
      url: 'community.stoplight.io',
      device: 'desktop.lan',
      replyTime: BigInt.from(190000),
      status: QueryStatusType.forwarded,
      replyType: ReplyType.ip,
      id: 1,
      answeredBy: 'localhost#5353',
    ),
    repo.Log(
      dateTime: DateTime.fromMillisecondsSinceEpoch(1581907871 * 1000),
      type: DnsRecordType.aaaa,
      url: 'api.github.com',
      device: 'localhost',
      replyTime: BigInt.from(123000),
      status: QueryStatusType.forwarded,
      replyType: ReplyType.ip,
      id: 2,
      answeredBy: 'localhost#5353',
    ),
  ],
  cursor: 175881,
  recordsTotal: 1234,
  recordsFiltered: 999,
);

final kRepoFetchStatsSummary = repo.Summary(
  domainsBeingBlocked: 104756,
  dnsQueriesToday: 7497,
  adsBlockedToday: 3465,
  adsPercentageToday: 34.5,
  uniqueDomains: 445,
  queriesForwarded: 4574,
  queriesCached: 9765,
  clientsEverSeen: 22,
  uniqueClients: 10,
  dnsQueriesAllTypes: 7497,
  replyUnknown: 3,
  replyNodata: 72,
  replyNxdomain: 533,
  replyCname: 32,
  replyIp: 84,
  replyDomain: 31,
  replyRrname: 0,
  replyServfail: 0,
  replyRefused: 0,
  replyNotimp: 0,
  replyOther: 0,
  replyDnssec: 327,
  replyNone: 0,
  replyBlob: 286,
  dnsQueriesAllReplies: 7497,
  queryTypes: const [
    repo.QueryTypeStat(type: DnsRecordType.a, percentage: 3643 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.aaaa, percentage: 123 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.any, percentage: 3423 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.srv, percentage: 345 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.soa, percentage: 7567 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.ptr, percentage: 456 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.txt, percentage: 85 / 19663 * 100),
    repo.QueryTypeStat(
      type: DnsRecordType.naptr,
      percentage: 346 / 19663 * 100,
    ),
    repo.QueryTypeStat(type: DnsRecordType.mx, percentage: 457 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.ds, percentage: 456 / 19663 * 100),
    repo.QueryTypeStat(
      type: DnsRecordType.rrsig,
      percentage: 345 / 19663 * 100,
    ),
    repo.QueryTypeStat(
      type: DnsRecordType.dnskey,
      percentage: 55 / 19663 * 100,
    ),
    repo.QueryTypeStat(type: DnsRecordType.ns, percentage: 868 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.svcb, percentage: 645 / 19663 * 100),
    repo.QueryTypeStat(type: DnsRecordType.https, percentage: 4 / 19663 * 100),
    repo.QueryTypeStat(
      type: DnsRecordType.other,
      percentage: 845 / 19663 * 100,
    ),
  ],
);

const kRepoFetchStatsUpstreams = [
  repo.DestinationStat(destination: 'blocklist|blocklist', percentage: 0.0),
  repo.DestinationStat(destination: 'cache|cache', percentage: 20.0),
  repo.DestinationStat(
    destination: 'dns.google#53|8.8.8.8#53',
    percentage: 80.0,
  ),
];

const kRepoFetchStatsTopDomainsBlocked = [
  repo.QueryStat(domain: 'pi-hole.net', count: 8516),
];

const kRepoFetchStatsTopDomainsAllowed = [
  repo.QueryStat(domain: 'pi-hole.net', count: 8516),
];

const kRepoFetchStatsTopClientsBlocked = [
  repo.SourceStat(source: 'raspberrypi.lan|192.168.0.44', count: 5896),
];

const kRepoFetchStatsTopClientsAllowed = [
  repo.SourceStat(source: 'raspberrypi.lan|192.168.0.44', count: 5896),
];

final kRepoFetchOverTime = repo.OverTime(
  domainsOverTime: [
    repo.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1511819900 * 1000),
      count: 2134,
    ),
    repo.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1511820500 * 1000),
      count: 2014,
    ),
  ],
  adsOverTime: [
    repo.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1511819900 * 1000),
      count: 413,
    ),
    repo.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(1511820500 * 1000),
      count: 43,
    ),
  ],
  clients: const [
    repo.Client(ip: '127.0.0.1', name: 'localhost'),
    repo.Client(ip: '::1', name: 'ip6-localnet'),
    repo.Client(ip: '192.168.1.1', name: ''), // TODO: name null
    repo.Client(ip: '::', name: 'pi.hole'),
    repo.Client(ip: '0.0.0.0', name: 'other clients'),
  ],
  overTime: [
    repo.ClientOverTimeEntry(
      time: DateTime.fromMillisecondsSinceEpoch(1511819900 * 1000),
      values: [35, 63, 20, 9, 0],
    ),
    repo.ClientOverTimeEntry(
      time: DateTime.fromMillisecondsSinceEpoch(1511820500 * 1000),
      values: [10, 44, 56, 0, 52],
    ),
  ],
);
