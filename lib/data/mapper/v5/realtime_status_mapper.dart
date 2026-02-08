import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v5/realtime_status.dart' as s;
import 'package:pi_hole_client/domain/model/metrics/summary.dart' as d;
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart' as d;
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart' as d;
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart' as d;
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart'
    as d;

extension RealTimeStatusMapper on s.RealTimeStatus {
  d.RealtimeStatus toDomain() {
    final mappedQueryTypes = _mapQueryTypes(queryTypes);

    return d.RealtimeStatus(
      summary: d.Summary(
        domainsBeingBlocked: domainsBeingBlocked,
        dnsQueriesToday: dnsQueriesToday,
        adsBlockedToday: adsBlockedToday,
        adsPercentageToday: adsPercentageToday,
        uniqueDomains: uniqueDomains,
        queriesForwarded: queriesForwarded,
        queriesCached: queriesCached,
        clientsEverSeen: clientsEverSeen,
        uniqueClients: uniqueClients,
        dnsQueriesAllTypes: dnsQueriesAllTypes,
        replyUnknown: replyUnknown,
        replyNodata: replyNodata,
        replyNxDomain: replyNxDomain,
        replyCname: replyCname,
        replyIp: replyIp,
        replyDomain: replyDomain,
        replyRrname: replyRrname,
        replyServfail: replyServfail,
        replyRefused: replyRefused,
        replyNotimp: replyNotimp,
        replyOther: replyOther,
        replyDnssec: replyDnssec,
        replyNone: replyNone,
        replyBlob: replyBlob,
        dnsQueriesAllReplies: dnsQueriesAllReplies,
        queryTypes: mappedQueryTypes,
      ),
      status: status.toDnsBlockingStatus(),
      privacyLevel: privacyLevel,
      topDomains: d.TopDomains(
        topQueries: topQueries.entries
            .map((e) => QueryStatMapper(e).toDomain())
            .toList(),
        topAds:
            topAds.entries.map((e) => QueryStatMapper(e).toDomain()).toList(),
      ),
      topClients: d.TopClients(
        topSources: topSources.entries
            .map((e) => SourceStatMapper(e).toDomain())
            .toList(),
        topSourcesBlocked: topSourcesBlocked.entries
            .map((e) => SourceStatMapper(e).toDomain())
            .toList(),
      ),
      forwardDestinations: forwardDestinations.entries
          .map((e) => DestinationStatMapper(e).toDomain())
          .toList(),
      queryTypes: mappedQueryTypes,
    );
  }
}

extension QueryStatMapper on MapEntry<String, int> {
  d.QueryStat toDomain() {
    return d.QueryStat(domain: key, count: value);
  }
}

extension SourceStatMapper on MapEntry<String, int> {
  d.SourceStat toDomain() {
    return d.SourceStat(source: key, count: value);
  }
}

extension DestinationStatMapper on MapEntry<String, double> {
  d.DestinationStat toDomain() {
    return d.DestinationStat(destination: key, percentage: value);
  }
}

List<d.QueryTypeStat> _mapQueryTypes(s.QueryTypes qt) {
  return [
    d.QueryTypeStat(type: DnsRecordType.a, percentage: qt.a),
    d.QueryTypeStat(type: DnsRecordType.aaaa, percentage: qt.aaaa),
    d.QueryTypeStat(type: DnsRecordType.any, percentage: qt.any),
    d.QueryTypeStat(type: DnsRecordType.srv, percentage: qt.srv),
    d.QueryTypeStat(type: DnsRecordType.soa, percentage: qt.soa),
    d.QueryTypeStat(type: DnsRecordType.ptr, percentage: qt.ptr),
    d.QueryTypeStat(type: DnsRecordType.txt, percentage: qt.txt),
    d.QueryTypeStat(type: DnsRecordType.naptr, percentage: qt.naptr),
    d.QueryTypeStat(type: DnsRecordType.mx, percentage: qt.mx),
    d.QueryTypeStat(type: DnsRecordType.ds, percentage: qt.ds),
    d.QueryTypeStat(type: DnsRecordType.rrsig, percentage: qt.rrsig),
    d.QueryTypeStat(type: DnsRecordType.dnskey, percentage: qt.dnskey),
    d.QueryTypeStat(type: DnsRecordType.ns, percentage: qt.ns),
    d.QueryTypeStat(type: DnsRecordType.other, percentage: qt.other),
    d.QueryTypeStat(type: DnsRecordType.svcb, percentage: qt.svcb),
    d.QueryTypeStat(type: DnsRecordType.https, percentage: qt.https),
  ];
}
