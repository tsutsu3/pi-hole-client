import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/model/metrics/clients.dart';
import 'package:pi_hole_client/domain/model/metrics/history.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart';
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v6/metrics.dart';

class FakeMetricsRepository implements MetricsRepository {
  bool shouldFail = false;

  @override
  Future<Result<History>> fetchHistory() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchHistory failure'));
    }
    return Success(kRepoFetchHistory);
  }

  @override
  Future<Result<Clients>> fetchHistoryClient({int? count = 10}) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchHistoryClient failure'));
    }
    return Success(kRepoFetchHistoryClient);
  }

  @override
  Future<Result<Logs>> fetchQueries({
    required DateTime from,
    required DateTime until,
    int? length = 100,
    int? cursor,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchQueries failure'));
    }
    return Success(kRepoFetchQueries);
  }

  @override
  Future<Result<Summary>> fetchStatsSummary() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchStatsSummary failure'));
    }
    return Success(kRepoFetchStatsSummary);
  }

  @override
  Future<Result<List<DestinationStat>>> fetchStatsUpstreams() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchStatsUpstreams failure'));
    }
    return const Success(kRepoFetchStatsUpstreams);
  }

  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsBlocked({
    int? count = 10,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchStatsTopDomainsBlocked failure'));
    }
    return const Success(kRepoFetchStatsTopDomainsBlocked);
  }

  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsAllowed({
    int? count = 10,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchStatsTopDomainsAllowed failure'));
    }
    return const Success(kRepoFetchStatsTopDomainsAllowed);
  }

  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsBlocked({
    int? count = 10,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchStatsTopClientsBlocked failure'));
    }
    return const Success(kRepoFetchStatsTopClientsBlocked);
  }

  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsAllowed({
    int? count = 10,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchStatsTopClientsAllowed failure'));
    }
    return const Success(kRepoFetchStatsTopClientsAllowed);
  }

  @override
  Future<Result<OverTime>> fetchOverTime({int? count = 10}) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchOverTime failure'));
    }
    return Success(kRepoFetchOverTime);
  }
}
