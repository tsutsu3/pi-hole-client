import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/metrics_mapper.dart';
import 'package:pi_hole_client/data/model/v6/metrics/history.dart' as sh;
import 'package:pi_hole_client/data/model/v6/metrics/stats.dart' as ss;

const _replies = ss.StatsReplies(
  unknown: 1, nodata: 2, nxdomain: 3, cname: 4,
  ip: 5, domain: 6, rrname: 7, servfail: 8,
  refused: 9, notimp: 10, other: 11, dnssec: 12,
  none: 13, blob: 14,
);

const _types = ss.StatsTypes(
  a: 100, aaaa: 50, any: 0, srv: 0, soa: 0,
  ptr: 10, txt: 5, naptr: 0, mx: 0, ds: 0,
  rrsig: 0, dnskey: 0, ns: 3, svcb: 0, https: 2, other: 0,
);

const _status = ss.StatsStatus(
  unknown: 0, gravity: 50, forwarded: 300, cache: 150, regex: 10,
  denylist: 5, externalBlockedIp: 0, externalBlockedNull: 0,
  externalBlockedNxra: 0, gravityCname: 0, regexCname: 0,
  denylistCname: 0, retried: 0, retriedDnssec: 0, inProgress: 0,
  dbbusy: 0, specialDomain: 0, cacheStale: 0,
);

const _queries = ss.StatsQueries(
  total: 5000,
  blocked: 500,
  percentBlocked: 10.0,
  uniqueDomains: 300,
  forwarded: 3000,
  cached: 1500,
  types: _types,
  status: _status,
  replies: _replies,
);

const _statsSummary = ss.StatsSummary(
  queries: _queries,
  clients: ss.StatsClients(active: 8, total: 10),
  gravity: ss.StatsGravity(domainsBeingBlocked: 100000, lastUpdate: 1700000000),
  took: 0.001,
);

void main() {
  group('HistoryMapper (v6)', () {
    test('maps history to domainsOverTime and adsOverTime', () {
      const source = sh.History(
        history: [
          sh.HistoryData(
            timestamp: 1700000000.0,
            total: 100,
            cached: 30,
            blocked: 20,
            forwarded: 50,
          ),
          sh.HistoryData(
            timestamp: 1700000300.0,
            total: 80,
            cached: 20,
            blocked: 10,
            forwarded: 50,
          ),
        ],
        took: 0.001,
      );

      final domain = source.toDomain();

      expect(domain.domainsOverTime.length, 2);
      expect(domain.domainsOverTime[0].count, 100);
      expect(
        domain.domainsOverTime[0].timestamp,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(domain.adsOverTime[0].count, 20);
      expect(domain.adsOverTime[1].count, 10);
    });

    test('returns empty lists when history is empty', () {
      const source = sh.History(history: [], took: 0.001);
      final domain = source.toDomain();
      expect(domain.domainsOverTime, isEmpty);
      expect(domain.adsOverTime, isEmpty);
    });
  });

  group('StatsSummaryMapper (v6)', () {
    test('maps all summary fields correctly', () {
      final domain = _statsSummary.toDomain();

      expect(domain.domainsBeingBlocked, 100000);
      expect(domain.dnsQueriesToday, 5000);
      expect(domain.adsBlockedToday, 500);
      expect(domain.adsPercentageToday, 10.0);
      expect(domain.uniqueDomains, 300);
      expect(domain.queriesForwarded, 3000);
      expect(domain.queriesCached, 1500);
      expect(domain.clientsEverSeen, 10);
      expect(domain.uniqueClients, 8);
    });

    test('maps reply counts correctly', () {
      final replies = _statsSummary.toDomain().replies;
      expect(replies.unknown, 1);
      expect(replies.nodata, 2);
      expect(replies.nxDomain, 3);
      expect(replies.cname, 4);
      expect(replies.ip, 5);
    });
  });

  group('StatsUpstreamsMapper (v6)', () {
    test('calculates percentages correctly', () {
      const source = ss.StatsUpstreams(
        upstreams: [
          ss.StatsUpstream(
            ip: '8.8.8.8',
            name: 'google',
            port: 53,
            count: 300,
            statistics: ss.Statistics(response: 10.0, variance: 1.0),
          ),
          ss.StatsUpstream(
            ip: '8.8.4.4',
            name: 'google2',
            port: 53,
            count: 100,
            statistics: ss.Statistics(response: 8.0, variance: 0.5),
          ),
        ],
        forwardedQueries: 400,
        totalQueries: 500,
        took: 0.001,
      );

      final result = source.toDomain();

      expect(result.length, 2);
      expect(result[0].percentage, closeTo(75.0, 0.001));
      expect(result[1].percentage, closeTo(25.0, 0.001));
    });

    test('uses name#port|ip#port format when port != -1', () {
      const source = ss.StatsUpstreams(
        upstreams: [
          ss.StatsUpstream(
            ip: '1.1.1.1',
            name: 'cf',
            port: 53,
            count: 10,
            statistics: ss.Statistics(response: 5.0, variance: 0.1),
          ),
        ],
        forwardedQueries: 10,
        totalQueries: 10,
        took: 0.001,
      );

      expect(source.toDomain()[0].destination, 'cf#53|1.1.1.1#53');
    });

    test('uses name|ip format when port == -1', () {
      const source = ss.StatsUpstreams(
        upstreams: [
          ss.StatsUpstream(
            ip: '1.1.1.1',
            name: 'cf',
            port: -1,
            count: 10,
            statistics: ss.Statistics(response: 5.0, variance: 0.1),
          ),
        ],
        forwardedQueries: 10,
        totalQueries: 10,
        took: 0.001,
      );

      expect(source.toDomain()[0].destination, 'cf|1.1.1.1');
    });

    test('returns empty list when upstreams is empty', () {
      const source = ss.StatsUpstreams(
        upstreams: [],
        forwardedQueries: 0,
        totalQueries: 0,
        took: 0.001,
      );
      expect(source.toDomain(), isEmpty);
    });
  });

  group('ClientMapper (v6)', () {
    test('uses name|ip format when name is not empty', () {
      const source = ss.StatsClient(ip: '192.168.1.1', name: 'laptop', count: 50);
      final domain = source.toDomain();
      expect(domain.source, 'laptop|192.168.1.1');
      expect(domain.count, 50);
    });

    test('uses ip only when name is empty', () {
      const source = ss.StatsClient(ip: '192.168.1.2', name: '', count: 30);
      expect(source.toDomain().source, '192.168.1.2');
    });
  });

  group('DomainMapper (v6)', () {
    test('maps domain and count correctly', () {
      const source = ss.StatsDomain(domain: 'example.com', count: 42);
      final domain = source.toDomain();
      expect(domain.domain, 'example.com');
      expect(domain.count, 42);
    });
  });

  group('HistoryClientsMapper (v6)', () {
    test('maps clients and overtime data', () {
      const source = sh.HistoryClients(
        clients: {
          '192.168.1.1': sh.Client(name: 'laptop', total: 100),
          '192.168.1.2': sh.Client(name: null, total: 50),
        },
        history: [
          sh.HistoryEntry(
            timestamp: 1700000000.0,
            data: {'192.168.1.1': 80, '192.168.1.2': 30},
          ),
        ],
        took: 0.001,
      );

      final domain = source.toDomain();

      expect(domain.clients.length, 2);
      expect(domain.clientEntries.length, 1);
      expect(
        domain.clientEntries[0].time,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(domain.clientEntries[0].values, [80, 30]);
    });
  });
}
