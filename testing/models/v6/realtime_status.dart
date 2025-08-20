import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart' as repo;
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart' as repo;
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart'
    as repo;

final kRepoFetchRealTimeStatus = repo.RealtimeStatus(
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
  replyNxDomain: 533,
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
  privacyLevel: 0,
  status: DnsBlockingStatus.enabled,
  topQueries: const [repo.QueryStat(domain: 'pi-hole.net', count: 8516)],
  topAds: const [repo.QueryStat(domain: 'pi-hole.net', count: 8516)],
  topSources: const [
    repo.SourceStat(source: 'raspberrypi.lan|192.168.0.44', count: 5896),
  ],
  topSourcesBlocked: const [
    repo.SourceStat(source: 'raspberrypi.lan|192.168.0.44', count: 5896),
  ],
  forwardDestinations: const [
    repo.DestinationStat(destination: 'blocklist|blocklist', percentage: 0.0),
    repo.DestinationStat(destination: 'cache|cache', percentage: 20.0),
    repo.DestinationStat(
      destination: 'dns.google#53|8.8.8.8#53',
      percentage: 80.0,
    ),
  ],
  queryTypes: const [
    repo.QueryTypeStat(type: DnsRecordType.a, percentage: 18.527183034125006),
    repo.QueryTypeStat(
      type: DnsRecordType.aaaa,
      percentage: 0.6255403549814372,
    ),
    repo.QueryTypeStat(type: DnsRecordType.any, percentage: 17.408330366678534),
    repo.QueryTypeStat(type: DnsRecordType.srv, percentage: 1.7545644103137872),
    repo.QueryTypeStat(type: DnsRecordType.soa, percentage: 38.483446066215734),
    repo.QueryTypeStat(type: DnsRecordType.ptr, percentage: 2.3190764379799624),
    repo.QueryTypeStat(
      type: DnsRecordType.txt,
      percentage: 0.43228398514977373,
    ),
    repo.QueryTypeStat(
      type: DnsRecordType.naptr,
      percentage: 1.7596501042567259,
    ),
    repo.QueryTypeStat(type: DnsRecordType.mx, percentage: 2.324162131922901),
    repo.QueryTypeStat(type: DnsRecordType.ds, percentage: 2.3190764379799624),
    repo.QueryTypeStat(
      type: DnsRecordType.rrsig,
      percentage: 1.7545644103137872,
    ),
    repo.QueryTypeStat(
      type: DnsRecordType.dnskey,
      percentage: 0.2797131668616183,
    ),
    repo.QueryTypeStat(type: DnsRecordType.ns, percentage: 4.41438234247063),
    repo.QueryTypeStat(
      type: DnsRecordType.svcb,
      percentage: 3.2802725931953414,
    ),
    repo.QueryTypeStat(
      type: DnsRecordType.https,
      percentage: 0.020342775771754057,
    ),
    repo.QueryTypeStat(
      type: DnsRecordType.other,
      percentage: 4.297411381783045,
    ),
  ],
);
