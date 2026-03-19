import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/ftl_mapper.dart';
import 'package:pi_hole_client/data/model/v6/ftl/ftl.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/messages.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/metrics.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/sensors.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/system.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/version.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

const _versionData = s.VersionData(
  core: s.Core(
    local: s.LocalVersion(version: 'v6.0', branch: 'main'),
    remote: s.RemoteVersion(version: 'v6.1'),
  ),
  web: s.Web(
    local: s.LocalVersion(version: 'v6.0', branch: 'main'),
    remote: s.RemoteVersion(version: 'v6.0'),
  ),
  ftl: s.FTL(
    local: s.LocalFTL(version: 'v6.0', branch: 'main'),
    remote: s.RemoteVersion(version: 'v6.2'),
  ),
  docker: s.Docker(local: '2023.05', remote: '2023.05'),
);

void main() {
  group('InfoVersionMapper (v6)', () {
    test('maps version fields and canUpdate correctly', () {
      const source = s.InfoVersion(version: _versionData, took: 0.001);
      final domain = source.toDomain();

      expect(domain.core.local.version, 'v6.0');
      expect(domain.core.local.branch, 'main');
      expect(domain.core.remote.version, 'v6.1');
      expect(domain.core.canUpdate, isTrue);

      expect(domain.web.canUpdate, isFalse);

      expect(domain.ftl.local.version, 'v6.0');
      expect(domain.ftl.remote.version, 'v6.2');
      expect(domain.ftl.canUpdate, isTrue);

      expect(domain.docker.local.version, '2023.05');
      expect(domain.docker.canUpdate, isFalse);
    });

    test('canUpdate is false when versions are null', () {
      const data = s.VersionData(
        core: s.Core(
          local: s.LocalVersion(),
          remote: s.RemoteVersion(),
        ),
        web: s.Web(
          local: s.LocalVersion(),
          remote: s.RemoteVersion(),
        ),
        ftl: s.FTL(
          local: s.LocalFTL(),
          remote: s.RemoteVersion(),
        ),
        docker: s.Docker(),
      );

      final domain = const s.InfoVersion(version: data, took: 0.001).toDomain();

      expect(domain.core.canUpdate, isFalse);
      expect(domain.core.local.version, '');
      expect(domain.docker.local.version, '');
    });
  });

  group('InfoSensorsMapper (v6)', () {
    test('maps sensor fields correctly', () {
      const source = s.InfoSensors(
        sensors: s.SensorsData(
          list: [],
          cpuTemp: 52.5,
          hotLimit: 80.0,
          unit: 'C',
        ),
        took: 0.001,
      );

      final domain = source.toDomain();

      expect(domain.cpuTemp, 52.5);
      expect(domain.hotLimit, 80.0);
      expect(domain.unit, TemperatureUnit.celsius);
    });
  });

  group('InfoMessagesMapper (v6)', () {
    test('parses valid inaccessible adlist message', () {
      const source = s.InfoMessages(
        messages: [
          s.Message(
            id: 1,
            timestamp: 1700000000,
            type: 'GRAVITY_BLOCKED_ADLIST_INACCESSIBLE',
            plain: 'List with ID 42 (https://example.com/list.txt) was inaccessible during last gravity run',
            html: '',
          ),
        ],
        took: 0.001,
      );

      final result = source.toDomain();

      expect(result.length, 1);
      expect(result[0].id, 1);
      expect(result[0].timestamp, DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000));
      expect(result[0].url, 'https://example.com/list.txt');
      expect(result[0].message, contains('List with ID 42'));
    });

    test('filters out messages that do not match regex', () {
      const source = s.InfoMessages(
        messages: [
          s.Message(
            id: 2,
            timestamp: 1700000000,
            type: 'OTHER_TYPE',
            plain: 'Some other message that does not match',
            html: '',
          ),
        ],
        took: 0.001,
      );

      expect(source.toDomain(), isEmpty);
    });

    test('returns empty list when messages is empty', () {
      const source = s.InfoMessages(messages: [], took: 0.001);
      expect(source.toDomain(), isEmpty);
    });
  });

  group('InfoFtlMapper (v6)', () {
    test('maps privacyLevel correctly', () {
      const source = s.InfoFtl(
        ftl: s.Ftl(
          database: s.Database(
            gravity: 100000,
            groups: 5,
            lists: 10,
            clients: 8,
            domains: s.Domains(
              allowed: s.IntOrPair.intValue(50),
              denied: s.IntOrPair.intValue(30),
            ),
            regex: s.Regex(
              allowed: s.IntOrPair.intValue(2),
              denied: s.IntOrPair.intValue(4),
            ),
          ),
          privacyLevel: 2,
          clients: s.Clients(total: 20, active: 8),
          pid: 1234,
          uptime: 86400,
          memPercentage: 5.0,
          cpuPercentage: 2.5,
          allowDestructive: false,
          dnsmasq: s.Dnsmasq(
            dnsCacheInserted: 0, dnsCacheLiveFreed: 0,
            dnsQueriesForwarded: 0, dnsAuthAnswered: 0,
            dnsLocalAnswered: 0, dnsStaleAnswered: 0,
            dnsUnanswered: 0, bootp: 0, pxe: 0,
            dhcpAck: 0, dhcpDecline: 0, dhcpDiscover: 0,
            dhcpInform: 0, dhcpNak: 0, dhcpOffer: 0,
            dhcpRelease: 0, dhcpRequest: 0, noAnswer: 0,
            leasesAllocated4: 0, leasesPruned4: 0,
            leasesAllocated6: 0, leasesPruned6: 0,
            tcpConnections: 0, dnssecMaxCryptoUse: 0,
            dnssecMaxSigFail: 0, dnssecMaxWork: 0,
          ),
        ),
        took: 0.001,
      );

      final domain = source.toDomain();
      expect(domain.privacyLevel, 2);
    });
  });

  group('DnsRepliesMapper (v6)', () {
    test('maps all fields correctly', () {
      const source = s.InfoMetrics(
        metrics: s.MetricsData(
          dns: s.DnsMetrics(
            cache: s.DnsCache(
              size: 1000,
              inserted: 500,
              evicted: 10,
              expired: 5,
              immortal: 20,
              content: [],
            ),
            replies: s.DnsReplies(
              forwarded: 300,
              unanswered: 5,
              local: 200,
              optimized: 10,
              auth: 1,
              sum: 516,
            ),
          ),
          dhcp: s.DhcpMetrics(
            ack: 0, nak: 0, decline: 0, offer: 0,
            discover: 0, inform: 0, request: 0, release: 0,
            noanswer: 0, bootp: 0, pxe: 0,
            leases: s.DhcpLeases(
              allocated4: 0, pruned4: 0, allocated6: 0, pruned6: 0,
            ),
          ),
        ),
        took: 0.001,
      );

      final domain = source.toDomain();
      expect(domain.replies.forwarded, 300);
      expect(domain.replies.unanswered, 5);
      expect(domain.replies.local, 200);
      expect(domain.replies.sum, 516);
    });
  });

  group('DnsCacheMapper (v6)', () {
    test('calculates records correctly', () {
      const cache = s.DnsCache(
        size: 1000,
        inserted: 100,
        evicted: 5,
        expired: 2,
        immortal: 10,
        content: [
          s.DnsCacheEntry(
            type: 1,
            name: 'A',
            count: s.DnsCacheCount(valid: 200, stale: 50),
          ),
        ],
      );

      final domain = cache.toDomain();

      expect(domain.size, 1000);
      expect(domain.records, 250); // 200 + 50
      expect(domain.inserted, 100);
    });

    test('percentages are 0.0 when size is 0', () {
      const cache = s.DnsCache(
        size: 0,
        inserted: 0,
        evicted: 0,
        expired: 0,
        immortal: 0,
        content: [
          s.DnsCacheEntry(
            type: 1,
            name: 'A',
            count: s.DnsCacheCount(valid: 10, stale: 5),
          ),
        ],
      );

      final domain = cache.toDomain();

      // When size == 0, record entries get 0.0, but the trailing "empty" slot
      // receives 100.0 (it absorbs the remaining percentage).
      final withoutLast = domain.typePercentages.take(domain.typePercentages.length - 1);
      for (final tp in withoutLast) {
        expect(tp.percentage, 0.0);
      }
      expect(domain.typePercentages.last.percentage, 100.0);
    });
  });

  group('InfoSystemMapper (v6)', () {
    test('maps uptime and RAM usage', () {
      const source = s.InfoSystem(
        system: s.SystemData(
          uptime: 86400,
          procs: 100,
          memory: s.Memory(
            ram: s.RAM(
              total: 4000000,
              free: 1000000,
              used: 3000000,
              available: 1000000,
              percentUsed: 75.0,
            ),
            swap: s.Swap(
              total: 1000000,
              used: 100000,
              free: 900000,
              percentUsed: 10.0,
            ),
          ),
          cpu: s.CPU(
            nprocs: 4,
            load: s.Load(raw: [1.0, 0.8, 0.6], percent: [25.0, 20.0, 15.0]),
            percentCpu: 30.0,
          ),
        ),
        took: 0.001,
      );

      final domain = source.toDomain();

      expect(domain.uptime, 86400);
      expect(domain.ramUsage, 75.0);
      expect(domain.cpuUsage, 30.0);
    });

    test('uses average of load.percent when percentCpu is null', () {
      const source = s.InfoSystem(
        system: s.SystemData(
          uptime: 0,
          procs: 1,
          memory: s.Memory(
            ram: s.RAM(
              total: 1000,
              free: 500,
              used: 500,
              available: 500,
              percentUsed: 50.0,
            ),
            swap: s.Swap(
              total: 0,
              used: 0,
              free: 0,
              percentUsed: 0.0,
            ),
          ),
          cpu: s.CPU(
            nprocs: 2,
            load: s.Load(raw: [0.5], percent: [20.0, 40.0]),
          ),
        ),
        took: 0.001,
      );

      final domain = source.toDomain();

      expect(domain.cpuUsage, closeTo(30.0, 0.001)); // (20 + 40) / 2
    });
  });
}
