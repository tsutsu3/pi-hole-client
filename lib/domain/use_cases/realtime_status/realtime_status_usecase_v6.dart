import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/enum_converters.dart';
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

      if (statsSummary case Failure()) {
        return Failure(statsSummary.exceptionOrNull());
      }
      if (blockingStatus case Failure()) {
        return Failure(blockingStatus.exceptionOrNull());
      }
      if (upstreams case Failure()) {
        return Failure(upstreams.exceptionOrNull());
      }
      if (topDomainsAllowed case Failure()) {
        return Failure(topDomainsAllowed.exceptionOrNull());
      }
      if (topDomainsBlocked case Failure()) {
        return Failure(topDomainsBlocked.exceptionOrNull());
      }
      if (topClientsAllowed case Failure()) {
        return Failure(topClientsAllowed.exceptionOrNull());
      }
      if (topClientsBlocked case Failure()) {
        return Failure(topClientsBlocked.exceptionOrNull());
      }

      return Success(
        _convert(
          statsSummary.getOrNull()!,
          blockingStatus.getOrNull()!,
          upstreams.getOrNull()!,
          topDomainsAllowed.getOrNull()!,
          topDomainsBlocked.getOrNull()!,
          topClientsAllowed.getOrNull()!,
          topClientsBlocked.getOrNull()!,
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
