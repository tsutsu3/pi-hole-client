import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/ftl/client.dart' as srv;
import 'package:pi_hole_client/data/model/v6/ftl/ftl.dart' as srv;
import 'package:pi_hole_client/data/model/v6/ftl/host.dart' as srv;
import 'package:pi_hole_client/data/model/v6/ftl/messages.dart' as srv;
import 'package:pi_hole_client/data/model/v6/ftl/metrics.dart' as srv;
import 'package:pi_hole_client/data/model/v6/ftl/sensors.dart' as srv;
import 'package:pi_hole_client/data/model/v6/ftl/system.dart' as srv;
import 'package:pi_hole_client/data/model/v6/ftl/version.dart' as srv;
import 'package:pi_hole_client/domain/model/ftl/client.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/ftl.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/host.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/message.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/metrics.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/pihole_server.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/sensor.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/system.dart' as repo;
import 'package:pi_hole_client/domain/model/ftl/version.dart' as repo;

const kSrvGetInfoClient = srv.InfoClient(
  remoteAddr: '127.0.0.1',
  httpVersion: '1.1',
  method: 'GET',
  headers: [
    srv.Header(name: 'Accept', value: 'application/json'),
    srv.Header(name: 'Connection', value: 'keep-alive'),
  ],
  took: 0.003,
);

const kSrvGetInfoFtl = srv.InfoFtl(
  ftl: srv.Ftl(
    database: srv.Database(
      gravity: 67906,
      groups: 6,
      lists: 1,
      clients: 5,
      domains: srv.Domains(allowed: 10, denied: 3),
    ),
    privacyLevel: 0,
    pid: 1234,
    uptime: 12345,
    memPercentage: 0.1,
    cpuPercentage: 1.2,
    allowDestructive: true,
    clients: srv.Clients(total: 10, active: 8),
    dnsmasq: srv.Dnsmasq(
      dnsCacheInserted: 8,
      dnsCacheLiveFreed: 0,
      dnsQueriesForwarded: 2,
      dnsAuthAnswered: 0,
      dnsLocalAnswered: 74,
      dnsStaleAnswered: 0,
      dnsUnanswered: 0,
      bootp: 0,
      pxe: 0,
      dhcpAck: 0,
      dhcpDecline: 0,
      dhcpDiscover: 0,
      dhcpInform: 0,
      dhcpNak: 0,
      dhcpOffer: 0,
      dhcpRelease: 0,
      dhcpRequest: 0,
      noAnswer: 0,
      leasesAllocated4: 0,
      leasesPruned4: 0,
      leasesAllocated6: 0,
      leasesPruned6: 0,
      tcpConnections: 0,
      dnssecMaxCryptoUse: 0,
      dnssecMaxSigFail: 0,
      dnssecMaxWork: 0,
    ),
  ),
  took: 0.003,
);

const kSrvGetInfoHost = srv.InfoHost(
  host: srv.HostData(
    uname: srv.HostUname(
      domainname: '(none)',
      machine: 'x86_64',
      nodename: 'raspberrypi',
      release: '5.15.0-52-generic',
      sysname: 'Linux',
      version: '#58-Ubuntu SMP Thu Oct 13 08:03:55 UTC 2022',
    ),
    model: 'Raspberry Pi Model 4B',
    dmi: srv.HostDmi(
      bios: srv.BiosInfo(vendor: 'American Megatrends Inc.'),
      board: srv.BoardInfo(
        name: 'Raspberry Pi 4 Model B Rev 1.4',
        vendor: 'Raspberry Pi Foundation',
        version: '0x14',
      ),
      product: srv.ProductInfo(
        name: 'Raspberry Pi 4 Model B Rev 1.4',
        version: '0x14',
        family: 'Raspberry Pi 4 Model B Rev 1.4',
      ),
      sys: srv.SystemInfo(vendor: 'Raspberry Pi Foundation'),
    ),
  ),
  took: 0.003,
);

const kSrvGetInfoMessages = srv.InfoMessages(
  messages: [
    srv.Message(
      id: 5,
      timestamp: 1743936482,
      type: 'LIST',
      plain:
          'List with ID 10 (http://localhost:8989/test.txt) was inaccessible during last gravity run',
      html:
          '<a href="groups/lists?listid=10">List with ID <strong>10</strong> (<code>http://localhost:8989/test.txt</code>)</a> was inaccessible during last gravity run',
    ),
    srv.Message(
      id: 3,
      timestamp: 123456789,
      type: 'SUBNET',
      plain: 'Rate-limiting 192.168.2.42 for at least 5 seconds',
      html:
          'Client <code>192.168.2.42</code> has been rate-limited for at least 5 seconds (current limit: 1000 queries per 60 seconds)',
    ),
  ],
  took: 0.003,
);

const kSrvGetInfoMetrics = srv.InfoMetrics(
  metrics: srv.MetricsData(
    dns: srv.DnsMetrics(
      cache: srv.DnsCache(
        size: 10000,
        inserted: 4060,
        evicted: 0,
        expired: 0,
        immortal: 0,
        content: [
          srv.DnsCacheEntry(
            type: 0,
            name: 'OTHER',
            count: srv.DnsCacheCount(valid: 0, stale: 0),
          ),
          srv.DnsCacheEntry(
            type: 1,
            name: 'A',
            count: srv.DnsCacheCount(valid: 14, stale: 3),
          ),
          srv.DnsCacheEntry(
            type: 28,
            name: 'AAAA',
            count: srv.DnsCacheCount(valid: 12, stale: 1),
          ),
          srv.DnsCacheEntry(
            type: 5,
            name: 'CNAME',
            count: srv.DnsCacheCount(valid: 5, stale: 3),
          ),
          srv.DnsCacheEntry(
            type: 43,
            name: 'DS',
            count: srv.DnsCacheCount(valid: 34, stale: 21),
          ),
          srv.DnsCacheEntry(
            type: 48,
            name: 'DNSKEY',
            count: srv.DnsCacheCount(valid: 1, stale: 0),
          ),
        ],
      ),
      replies: srv.DnsReplies(
        optimized: 1,
        local: 84,
        auth: 0,
        forwarded: 46,
        unanswered: 0,
        sum: 131,
      ),
    ),
    dhcp: srv.DhcpMetrics(
      ack: 0,
      nak: 0,
      decline: 0,
      offer: 0,
      discover: 0,
      inform: 0,
      request: 0,
      release: 0,
      noanswer: 0,
      bootp: 0,
      pxe: 0,
      leases: srv.DhcpLeases(
        allocated4: 0,
        pruned4: 0,
        allocated6: 0,
        pruned6: 0,
      ),
    ),
  ),
  took: 0.003,
);

const kSrvGetInfoSensors = srv.InfoSensors(
  sensors: srv.SensorsData(
    list: [
      srv.SensorData(
        name: 'amdgpu',
        path: 'hwmon1',
        source: 'devices/pci0000:00/0000:00:08.1/0000:05:00.0',
        temps: [
          srv.TempData(
            name: 'edge',
            value: 40,
            max: null,
            crit: null,
            sensor: 'temp1',
          ),
        ],
      ),
    ],
    cpuTemp: 48,
    hotLimit: 60,
    unit: 'C',
  ),
  took: 0.003,
);

const kSrvGetInfoSystemOld = srv.InfoSystem(
  system: srv.SystemData(
    uptime: 67906,
    memory: srv.Memory(
      ram: srv.RAM(
        total: 10317877,
        free: 308736,
        used: 8920416,
        available: 972304,
        percentUsed: 26.854,
      ),
      swap: srv.Swap(
        total: 10317877,
        used: 8920416,
        free: 308736,
        percentUsed: 1.67,
      ),
    ),
    procs: 1452,
    cpu: srv.CPU(
      nprocs: 8,
      load: srv.Load(
        raw: [0.58837890625, 0.64990234375, 0.66748046875],
        percent: [4.903157711029053, 5.415853023529053, 5.562337398529053],
      ),
    ),
  ),
  took: 0.003,
);

// FTL >= 6.1
const kSrvGetInfoSystem = srv.InfoSystem(
  system: srv.SystemData(
    uptime: 67906,
    memory: srv.Memory(
      ram: srv.RAM(
        total: 10317877,
        free: 308736,
        used: 8920416,
        available: 972304,
        percentUsed: 26.854,
      ),
      swap: srv.Swap(
        total: 10317877,
        used: 8920416,
        free: 308736,
        percentUsed: 1.67,
      ),
    ),
    procs: 1452,
    cpu: srv.CPU(
      nprocs: 8,
      percentCpu: 3.3232043958349604,
      load: srv.Load(
        raw: [0.58837890625, 0.64990234375, 0.66748046875],
        percent: [4.903157711029053, 5.415853023529053, 5.562337398529053],
      ),
    ),
  ),
  took: 0.003,
);

const kSrvGetInfoVersionWithDocker = srv.InfoVersion(
  version: srv.VersionData(
    core: srv.Core(
      local: srv.LocalVersion(
        version: 'v6.0.5',
        branch: 'master',
        hash: '9fe687bd',
      ),
      remote: srv.RemoteVersion(version: 'v6.0.5', hash: '9fe687bd'),
    ),
    web: srv.Web(
      local: srv.LocalVersion(
        version: 'v6.0.2',
        branch: 'master',
        hash: '25441178',
      ),
      remote: srv.RemoteVersion(version: 'v6.0.2', hash: '25441178'),
    ),
    ftl: srv.FTL(
      local: srv.LocalFTL(
        hash: 'b7eb53bf',
        branch: 'master',
        version: 'v6.0.4',
        date: '2025-03-04 17:22:10 +0000',
      ),
      remote: srv.RemoteVersion(version: 'v6.0.4', hash: 'b7eb53bf'),
    ),
    docker: srv.Docker(local: '2025.03.0', remote: '2025.03.0'),
  ),
  took: 0.003,
);

const kSrvGetInfoVersion = srv.InfoVersion(
  version: srv.VersionData(
    core: srv.Core(
      local: srv.LocalVersion(
        version: 'v6.0.4',
        branch: 'master',
        hash: '9fe687xxx',
      ),
      remote: srv.RemoteVersion(version: 'v6.0.5', hash: '9fe687bd'),
    ),
    web: srv.Web(
      local: srv.LocalVersion(
        version: 'v6.0.1',
        branch: 'master',
        hash: '254411xxx',
      ),
      remote: srv.RemoteVersion(version: 'v6.0.2', hash: '25441178'),
    ),
    ftl: srv.FTL(
      local: srv.LocalFTL(
        hash: 'b7eb5xxx',
        branch: 'master',
        version: 'v6.0.3',
        date: '2025-03-01 17:22:10 +0000',
      ),
      remote: srv.RemoteVersion(version: 'v6.0.4', hash: 'b7eb53bf'),
    ),
    docker: srv.Docker(),
  ),
  took: 0.003,
);

// repo models

const kRepoFetchInfoClient = repo.InfoClient(addr: '127.0.0.1');

const kRepoFetchInfoFtl = repo.InfoFtl(privacyLevel: 0);

const kRepoFetchInfoHost = repo.InfoHost(
  domainName: '(none)',
  arch: 'x86_64',
  hostName: 'raspberrypi',
  release: '5.15.0-52-generic',
  sysName: 'Linux',
  version: '#58-Ubuntu SMP Thu Oct 13 08:03:55 UTC 2022',
  model: 'Raspberry Pi Model 4B',
);

final kRepoFetchInfoMessages = [
  repo.InfoMessage(
    id: 5,
    timestamp: DateTime.fromMillisecondsSinceEpoch(1743936482 * 1000),
    message: 'List with ID 10 was inaccessible during last gravity run',
    url: 'http://localhost:8989/test.txt',
  ),
];

const kRepoFetchInfoMetrics = repo.InfoDnsMetrics(
  cache: repo.DnsCache(
    size: 10000,
    records: 94,
    inserted: 4060,
    evicted: 0,
    expired: 0,
    immortal: 0,
    typePercentages: [
      repo.DnsTypePercentage(
        type: DnsRecordType.other,
        isStale: false,
        percentage: 0.0,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.other,
        isStale: true,
        percentage: 0.0,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.a,
        isStale: false,
        percentage: 14 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.a,
        isStale: true,
        percentage: 3 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.aaaa,
        isStale: false,
        percentage: 12 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.aaaa,
        isStale: true,
        percentage: 1 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.cname,
        isStale: false,
        percentage: 5 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.cname,
        isStale: true,
        percentage: 3 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.ds,
        isStale: false,
        percentage: 34 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.ds,
        isStale: true,
        percentage: 21 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.dnskey,
        isStale: false,
        percentage: 1 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.dnskey,
        isStale: true,
        percentage: 0 / 10000 * 100,
      ),
      repo.DnsTypePercentage(
        type: DnsRecordType.empty,
        isStale: false,
        percentage: (10000 - 94) / 10000 * 100,
      ),
    ],
  ),
  replies: repo.DnsReplies(
    forwarded: 46,
    unanswered: 0,
    local: 84,
    optimized: 1,
    auth: 0,
    sum: 131,
    forwardedPercentage: 46 / 131 * 100,
    unansweredPercentage: 0 / 131 * 100,
    localPercentage: 84 / 131 * 100,
    optimizedPercentage: 1 / 131 * 100,
    authPercentage: 0 / 131 * 100,
  ),
);

const kRepoFetchInfoSensors = repo.InfoSensor(
  hotLimit: 60,
  unit: 'C',
  cpuTemp: 48,
);

const kRepoFetchInfoSystem = repo.InfoSystem(
  uptime: 67906,
  ramUsage: 26.854,
  cpuUsage: 3.3232043958349604,
);

const kRepoFetchInfoSystemOld = repo.InfoSystem(
  uptime: 67906,
  ramUsage: 26.854,
  cpuUsage: 5.293782711029053,
);

const kRepoFetchInfoVersion = repo.InfoVersion(
  core: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v6.0.4', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.5'),
    canUpdate: true,
  ),
  web: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v6.0.1', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.2'),
    canUpdate: true,
  ),
  ftl: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v6.0.3', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.4'),
    canUpdate: true,
  ),
  docker: repo.ComponentVersion(
    local: repo.VersionDetail(version: ''),
    remote: repo.VersionDetail(version: ''),
    canUpdate: false,
  ),
);

const kRepoFetchInfoVersionWithDocker = repo.InfoVersion(
  core: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v6.0.5', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.5'),
    canUpdate: false,
  ),
  web: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v6.0.2', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.2'),
    canUpdate: false,
  ),
  ftl: repo.ComponentVersion(
    local: repo.VersionDetail(version: 'v6.0.4', branch: 'master'),
    remote: repo.VersionDetail(version: 'v6.0.4'),
    canUpdate: false,
  ),
  docker: repo.ComponentVersion(
    local: repo.VersionDetail(version: '2025.03.0'),
    remote: repo.VersionDetail(version: '2025.03.0'),
    canUpdate: false,
  ),
);

const kRepoFetchAllServerInfo = repo.InfoPiholeServer(
  host: kRepoFetchInfoHost,
  sensor: kRepoFetchInfoSensors,
  system: kRepoFetchInfoSystem,
  version: kRepoFetchInfoVersion,
);
