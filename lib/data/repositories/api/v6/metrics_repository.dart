import 'package:pi_hole_client/data/mapper/v6/metrics_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/metrics/clients.dart';
import 'package:pi_hole_client/domain/models/metrics/history.dart';
import 'package:pi_hole_client/domain/models/metrics/queries.dart';
import 'package:pi_hole_client/domain/models/metrics/summary.dart';
import 'package:pi_hole_client/domain/models/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/models/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/models/metrics/upstreams.dart';
import 'package:result_dart/result_dart.dart';

class MetricsRepositoryV6 implements MetricsRepository {
  MetricsRepositoryV6({required String sid, required PiholeV6ApiClient client})
    : _sid = sid,
      _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<History>> fetchHistory() async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getHistory(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Clients>> fetchHistoryClient({int? count = 10}) async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getHistoryClient(_sid, count: count);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Logs>> fetchQueries({
    required DateTime from,
    required DateTime until,
    int? length = 100,
    int? cursor,
  }) async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getQueries(
          _sid,
          from: from,
          until: until,
          length: length,
          cursor: cursor,
        );

        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Summary>> fetchStatsSummary() async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getStatsSummary(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<List<DestinationStat>>> fetchStatsUpstreams() async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getStatsUpstreams(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsBlocked({
    int? count = 10,
  }) async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getStatsTopDomains(
          _sid,
          count: count,
          blocked: true,
        );
        return Success(
          result.getOrThrow().domains.map((e) => e.toDomain()).toList(),
        );
      },
    );
  }

  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsAllowed({
    int? count = 10,
  }) async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getStatsTopDomains(_sid, count: count);
        return Success(
          result.getOrThrow().domains.map((e) => e.toDomain()).toList(),
        );
      },
    );
  }

  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsBlocked({
    int? count = 10,
  }) async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getStatsTopClients(
          _sid,
          count: count,
          blocked: true,
        );
        return Success(
          result.getOrThrow().clients.map((e) => e.toDomain()).toList(),
        );
      },
    );
  }

  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsAllowed({
    int? count = 10,
  }) async {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getStatsTopClients(_sid, count: count);
        return Success(
          result.getOrThrow().clients.map((e) => e.toDomain()).toList(),
        );
      },
    );
  }
}
