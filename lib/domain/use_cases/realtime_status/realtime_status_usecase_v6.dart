import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/ftl/ftl.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart';
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase.dart';
import 'package:result_dart/result_dart.dart';

class RealtimeStatusUseCaseV6 implements RealtimeStatusUseCase {
  RealtimeStatusUseCaseV6({
    required MetricsRepository metricsRepository,
    required FtlRepository ftlRepository,
    required DnsRepository dnsRepository,
  }) : _metricsRepository = metricsRepository,
       _ftlRepository = ftlRepository,
       _dnsRepository = dnsRepository;

  final MetricsRepository _metricsRepository;
  final FtlRepository _ftlRepository;
  final DnsRepository _dnsRepository;

  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    try {
      final response = await Future.wait([
        _metricsRepository.fetchStatsSummary(),
        _ftlRepository.getInfoFtl(),
        _dnsRepository.fetchBlockingStatus(),
        _metricsRepository.fetchStatsUpstreams(),
        _metricsRepository.fetchStatsTopDomainsAllowed(),
        _metricsRepository.fetchStatsTopDomainsBlocked(),
        _metricsRepository.fetchStatsTopClientsAllowed(),
        _metricsRepository.fetchStatsTopClientsBlocked(),
      ]);

      final statsSummary = response[0] as Result<Summary>;
      final ftlInfo = response[1] as Result<InfoFtl>;
      final blockingStatus = response[2] as Result<Blocking>;
      final upstreams = response[3] as Result<List<DestinationStat>>;
      final topDomainsAllowed = response[4] as Result<List<QueryStat>>;
      final topDomainsBlocked = response[5] as Result<List<QueryStat>>;
      final topClientsAllowed = response[6] as Result<List<SourceStat>>;
      final topClientsBlocked = response[7] as Result<List<SourceStat>>;

      return Success(
        _convert(
          statsSummary.getOrThrow(),
          ftlInfo.getOrThrow(),
          blockingStatus.getOrThrow(),
          upstreams.getOrThrow(),
          topDomainsAllowed.getOrThrow(),
          topDomainsBlocked.getOrThrow(),
          topClientsAllowed.getOrThrow(),
          topClientsBlocked.getOrThrow(),
        ),
      );
    } catch (e, st) {
      return Failure(Exception('Failed to fetch realtime status: $e\n$st'));
    }
  }

  RealtimeStatus _convert(
    Summary statsSummary,
    InfoFtl ftlInfo,
    Blocking blockingStatus,
    List<DestinationStat> upstreams,
    List<QueryStat> topDomainsAllowed,
    List<QueryStat> topDomainsBlocked,
    List<SourceStat> topClientsAllowed,
    List<SourceStat> topClientsBlocked,
  ) {
    return RealtimeStatus(
      domainsBeingBlocked: statsSummary.domainsBeingBlocked,
      dnsQueriesToday: statsSummary.dnsQueriesToday,
      adsBlockedToday: statsSummary.adsBlockedToday,
      adsPercentageToday: statsSummary.adsPercentageToday,
      uniqueDomains: statsSummary.uniqueDomains,
      queriesForwarded: statsSummary.queriesForwarded,
      queriesCached: statsSummary.queriesCached,
      clientsEverSeen: statsSummary.clientsEverSeen,
      uniqueClients: statsSummary.uniqueClients,
      dnsQueriesAllTypes: statsSummary.dnsQueriesAllTypes,
      replyUnknown: statsSummary.replyUnknown,
      replyNodata: statsSummary.replyNodata,
      replyNxDomain: statsSummary.replyNxdomain,
      replyCname: statsSummary.replyCname,
      replyIp: statsSummary.replyIp,
      replyDomain: statsSummary.replyDomain,
      replyRrname: statsSummary.replyRrname,
      replyServfail: statsSummary.replyServfail,
      replyRefused: statsSummary.replyRefused,
      replyNotimp: statsSummary.replyNotimp,
      replyOther: statsSummary.replyOther,
      replyDnssec: statsSummary.replyDnssec,
      replyNone: statsSummary.replyNone,
      replyBlob: statsSummary.replyBlob,
      dnsQueriesAllReplies: statsSummary.dnsQueriesAllReplies,
      privacyLevel: ftlInfo.privacyLevel,
      status: blockingStatus.status.name.toDnsBlockingStatus(),
      topQueries: topDomainsAllowed,
      topAds: topDomainsBlocked,
      topSources: topClientsAllowed,
      topSourcesBlocked: topClientsBlocked,
      forwardDestinations: upstreams,
      queryTypes: statsSummary.queryTypes,
    );
  }
}
