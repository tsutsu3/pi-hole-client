import 'package:pi_hole_client/domain/models/dns/dns.dart' as d;
import 'package:pi_hole_client/domain/models/ftl/ftl.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/summary.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/top_clients.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/top_domains.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/upstreams.dart' as d;
import 'package:pi_hole_client/domain/models/realtime_status/realtime_status.dart'
    as d;

// $1: final statsSummary = response[0] as Result<Summary>;
// $2: final ftlInfo = response[1] as Result<InfoFtl>;
// $3: final blockingStatus = response[2] as Result<Blocking>;
// $4: final upstreams = response[3] as Result<List<DestinationStat>>;
// $5: final topDomainsAllowed = response[4] as Result<List<QueryStat>>;
// $6: final topDomainsBlocked = response[5] as Result<List<QueryStat>>;
// $7: final topClientsAllowed = response[6] as Result<List<SourceStat>>;
// $8: final topClientsBlocked = response[7] as Result<List<SourceStat>>;
extension RealTimeStatusMapper
    on
        (
          d.Summary,
          d.InfoFtl,
          d.Blocking,
          List<d.DestinationStat>,
          List<d.QueryStat>,
          List<d.QueryStat>,
          List<d.SourceStat>,
          List<d.SourceStat>,
        ) {
  d.RealtimeStatus toDomain() {
    return d.RealtimeStatus(
      domainsBeingBlocked: $1.domainsBeingBlocked,
      dnsQueriesToday: $1.dnsQueriesToday,
      adsBlockedToday: $1.adsBlockedToday,
      adsPercentageToday: $1.adsPercentageToday,
      uniqueDomains: $1.uniqueDomains,
      queriesForwarded: $1.queriesForwarded,
      queriesCached: $1.queriesCached,
      clientsEverSeen: $1.clientsEverSeen,
      uniqueClients: $1.uniqueClients,
      dnsQueriesAllTypes: $1.dnsQueriesAllTypes,
      replyUnknown: $1.replyUnknown,
      replyNodata: $1.replyNodata,
      replyNxDomain: $1.replyNxdomain,
      replyCname: $1.replyCname,
      replyIp: $1.replyIp,
      replyDomain: $1.replyDomain,
      replyRrname: $1.replyRrname,
      replyServfail: $1.replyServfail,
      replyRefused: $1.replyRefused,
      replyNotimp: $1.replyNotimp,
      replyOther: $1.replyOther,
      replyDnssec: $1.replyDnssec,
      replyNone: $1.replyNone,
      replyBlob: $1.replyBlob,
      dnsQueriesAllReplies: $1.dnsQueriesAllReplies,
      privacyLevel: $2.privacyLevel,
      status: $3.status.name,
      topQueries: $5,
      topAds: $6,
      topSources: $7,
      topSourcesBlocked: $8,
      forwardDestinations: $4,
      queryTypes: $1.queryTypes,
    );
  }
}
