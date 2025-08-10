import 'package:pi_hole_client/data/services/api/model/v5/realtime_status.dart'
    as s;
import 'package:pi_hole_client/domain/models/metrics/summary.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/top_clients.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/top_domains.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/upstreams.dart' as d;
import 'package:pi_hole_client/domain/models/realtime_status/realtime_status.dart'
    as d;

extension RealTimeStatusMapper on s.RealTimeStatus {
  d.RealtimeStatus toDomain() {
    return d.RealtimeStatus(
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
      privacyLevel: privacyLevel,
      status: status,
      topQueries: topQueries.entries
          .map((e) => QueryStatMapper(e).toDomain())
          .toList(),
      topAds: topAds.entries.map((e) => QueryStatMapper(e).toDomain()).toList(),
      topSources: topSources.entries
          .map((e) => SourceStatMapper(e).toDomain())
          .toList(),
      topSourcesBlocked: topSourcesBlocked.entries
          .map((e) => SourceStatMapper(e).toDomain())
          .toList(),
      forwardDestinations: forwardDestinations.entries
          .map((e) => DestinationStatMapper(e).toDomain())
          .toList(),
      queryTypes: queryTypes
          .toJson()
          .entries
          .map(
            (e) =>
                QueryTypeStatMapper(e as MapEntry<String, double>).toDomain(),
          )
          .toList(),
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

extension QueryTypeStatMapper on MapEntry<String, double> {
  d.QueryTypeStat toDomain() {
    return d.QueryTypeStat(type: key, percentage: value);
  }
}
