import 'package:pi_hole_client/data/mapper/v6/metrics_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/metrics/clients.dart';
import 'package:pi_hole_client/domain/model/metrics/history.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart';
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:result_dart/result_dart.dart';

class MetricsRepositoryV6 extends BaseV6SidRepository
    implements MetricsRepository {
  MetricsRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<History>> fetchHistory() async {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getHistory(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Clients>> fetchHistoryClient({int? count = 10}) async {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getHistoryClient(sid, count: count);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
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
        final sid = await getSid();
        final result = await _client.getQueries(
          sid,
          from: from,
          until: until,
          length: length,
          cursor: cursor,
        );

        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Summary>> fetchStatsSummary() async {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getStatsSummary(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<List<DestinationStat>>> fetchStatsUpstreams() async {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getStatsUpstreams(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsBlocked({
    int? count = 10,
  }) async {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getStatsTopDomains(
          sid,
          count: count,
          blocked: true,
        );
        return result.map((e) => e.domains.map((d) => d.toDomain()).toList());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsAllowed({
    int? count = 10,
  }) async {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getStatsTopDomains(sid, count: count);
        return result.map((e) => e.domains.map((d) => d.toDomain()).toList());
      },
    );
  }

  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsBlocked({
    int? count = 10,
  }) async {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getStatsTopClients(
          sid,
          count: count,
          blocked: true,
        );
        return result.map((e) => e.clients.map((c) => c.toDomain()).toList());
      },
    );
  }

  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsAllowed({
    int? count = 10,
  }) async {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getStatsTopClients(sid, count: count);
        return result.map((e) => e.clients.map((c) => c.toDomain()).toList());
      },
    );
  }

  @override
  Future<Result<OverTime>> fetchOverTime({int? count = 10}) async {
    try {
      final response = await Future.wait([
        fetchHistory(),
        fetchHistoryClient(count: count),
      ]);

      final history = response[0] as Result<History>;
      final historyClients = response[1] as Result<Clients>;

      return Success(
        (history.getOrThrow(), historyClients.getOrThrow()).toDomain(),
      );
    } catch (e, st) {
      return Failure(Exception('Failed to fetch over time data: $e\n$st'));
    }
  }
}
