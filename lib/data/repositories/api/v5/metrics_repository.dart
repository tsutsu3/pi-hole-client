import 'package:pi_hole_client/data/mapper/v5/metrics_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/metrics/clients.dart';
import 'package:pi_hole_client/domain/models/metrics/history.dart';
import 'package:pi_hole_client/domain/models/metrics/queries.dart';
import 'package:pi_hole_client/domain/models/metrics/summary.dart';
import 'package:pi_hole_client/domain/models/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/models/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/models/metrics/upstreams.dart';
import 'package:pi_hole_client/domain/models/overtime/overtime.dart';
import 'package:result_dart/result_dart.dart';

class MetricsRepositoryV5 implements MetricsRepository {
  MetricsRepositoryV5({
    required String token,
    required PiholeV5ApiClient client,
  }) : _token = token,
       _client = client;

  final String _token;
  final PiholeV5ApiClient _client;

  @override
  Future<Result<History>> fetchHistory() async {
    return Future.value(
      Failure(NotSupportedException(kHandledByOverTimeRepositoryInV5Message)),
    );
  }

  @override
  Future<Result<Clients>> fetchHistoryClient({int? count = 10}) async {
    return Future.value(
      Failure(NotSupportedException(kHandledByOverTimeRepositoryInV5Message)),
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
        final response = await _client.getQueries(
          _token,
          from: from,
          until: until,
        );
        return Success(response.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Summary>> fetchStatsSummary() async {
    return Future.value(
      Failure(NotSupportedException(kHandledByRealtimeRepositoryInV5Message)),
    );
  }

  @override
  Future<Result<List<DestinationStat>>> fetchStatsUpstreams() async {
    return Future.value(
      Failure(NotSupportedException(kHandledByRealtimeRepositoryInV5Message)),
    );
  }

  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsBlocked({
    int? count = 10,
  }) async {
    return Future.value(
      Failure(NotSupportedException(kHandledByRealtimeRepositoryInV5Message)),
    );
  }

  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsAllowed({
    int? count = 10,
  }) async {
    return Future.value(
      Failure(NotSupportedException(kHandledByRealtimeRepositoryInV5Message)),
    );
  }

  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsBlocked({
    int? count = 10,
  }) async {
    return Future.value(
      Failure(NotSupportedException(kHandledByRealtimeRepositoryInV5Message)),
    );
  }

  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsAllowed({
    int? count = 10,
  }) async {
    return Future.value(
      Failure(NotSupportedException(kHandledByRealtimeRepositoryInV5Message)),
    );
  }

  @override
  Future<Result<OverTime>> fetchOverTime({int? count = 10}) async {
    return runWithResultRetry(
      action: () async {
        final response = await _client.getOverTimeData(_token);
        return Success(response.getOrThrow().toDomain());
      },
    );
  }
}
