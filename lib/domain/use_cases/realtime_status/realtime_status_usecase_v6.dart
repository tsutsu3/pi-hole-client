import 'package:pi_hole_client/config/enum_converters.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
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
    required DnsRepository dnsRepository,
  }) : _metricsRepository = metricsRepository,
       _dnsRepository = dnsRepository;

  final MetricsRepository _metricsRepository;
  final DnsRepository _dnsRepository;

  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    try {
      final (
        statsSummary,
        blockingStatus,
        upstreams,
        topDomainsAllowed,
        topDomainsBlocked,
        topClientsAllowed,
        topClientsBlocked,
      ) = await (
        _metricsRepository.fetchStatsSummary(),
        _dnsRepository.fetchBlockingStatus(),
        _metricsRepository.fetchStatsUpstreams(),
        _metricsRepository.fetchStatsTopDomainsAllowed(),
        _metricsRepository.fetchStatsTopDomainsBlocked(),
        _metricsRepository.fetchStatsTopClientsAllowed(),
        _metricsRepository.fetchStatsTopClientsBlocked(),
      ).wait;

      return Success(
        _convert(
          statsSummary.getOrThrow(),
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
    Blocking blockingStatus,
    List<DestinationStat> upstreams,
    List<QueryStat> topDomainsAllowed,
    List<QueryStat> topDomainsBlocked,
    List<SourceStat> topClientsAllowed,
    List<SourceStat> topClientsBlocked,
  ) {
    return RealtimeStatus(
      summary: statsSummary,
      status: blockingStatus.status.name.toDnsBlockingStatus(),
      topDomains: TopDomains(
        topQueries: topDomainsAllowed,
        topAds: topDomainsBlocked,
      ),
      topClients: TopClients(
        topSources: topClientsAllowed,
        topSourcesBlocked: topClientsBlocked,
      ),
      forwardDestinations: upstreams,
    );
  }
}
