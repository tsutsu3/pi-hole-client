import 'package:pi_hole_client/config/api_versions.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/realtime_status_repository.dart';
import 'package:pi_hole_client/domain/mapper/realtime_status_mapper.dart';
import 'package:pi_hole_client/domain/models/dns/dns.dart';
import 'package:pi_hole_client/domain/models/ftl/ftl.dart';
import 'package:pi_hole_client/domain/models/metrics/summary.dart';
import 'package:pi_hole_client/domain/models/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/models/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/models/metrics/upstreams.dart';
import 'package:pi_hole_client/domain/models/realtime_status/realtime_status.dart';
import 'package:result_dart/result_dart.dart';

class PollStatusUseCase {
  PollStatusUseCase({
    required String piholeVersion,
    required RealtimeStatusRepository realtimeStatusRepository,
    required MetricsRepository metricsRepository,
    required FtlRepository ftlRepository,
    required DnsRepository dnsRepository,
  }) : _piholeVersion = piholeVersion,
       _realtimeStatusRepository = realtimeStatusRepository,
       _metricsRepository = metricsRepository,
       _ftlRepository = ftlRepository,
       _dnsRepository = dnsRepository;

  final String _piholeVersion;
  final RealtimeStatusRepository _realtimeStatusRepository;
  final MetricsRepository _metricsRepository;
  final FtlRepository _ftlRepository;
  final DnsRepository _dnsRepository;

  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    if (_piholeVersion == SupportedApiVersions.v5) {
      return _fetchV5();
    } else if (_piholeVersion == SupportedApiVersions.v6) {
      return _fetchV6();
    } else {
      return Failure(Exception('Unsupported Pi-hole version: $_piholeVersion'));
    }
  }

  Future<Result<RealtimeStatus>> _fetchV5() async {
    return _realtimeStatusRepository.fetchRealtimeStatus();
  }

  Future<Result<RealtimeStatus>> _fetchV6() async {
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
        (
          statsSummary.getOrThrow(),
          ftlInfo.getOrThrow(),
          blockingStatus.getOrThrow(),
          upstreams.getOrThrow(),
          topDomainsAllowed.getOrThrow(),
          topDomainsBlocked.getOrThrow(),
          topClientsAllowed.getOrThrow(),
          topClientsBlocked.getOrThrow(),
        ).toDomain(),
      );
    } catch (e, st) {
      return Failure(Exception('Failed to fetch realtime status: $e\n$st'));
    }
  }
}
