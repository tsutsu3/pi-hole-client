import 'package:pi_hole_client/domain/model/metrics/clients.dart';
import 'package:pi_hole_client/domain/model/metrics/history.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart';
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class MetricsRepository {
  Future<Result<History>> fetchHistory();

  Future<Result<Clients>> fetchHistoryClient({int? count = 10});

  Future<Result<Logs>> fetchQueries({
    required DateTime from,
    required DateTime until,
    int? length = 100,
    int? cursor,
  });

  Future<Result<Summary>> fetchStatsSummary();

  Future<Result<List<DestinationStat>>> fetchStatsUpstreams();

  Future<Result<List<QueryStat>>> fetchStatsTopDomainsBlocked({
    int? count = 10,
  });

  Future<Result<List<QueryStat>>> fetchStatsTopDomainsAllowed({
    int? count = 10,
  });

  Future<Result<List<SourceStat>>> fetchStatsTopClientsBlocked({
    int? count = 10,
  });

  Future<Result<List<SourceStat>>> fetchStatsTopClientsAllowed({
    int? count = 10,
  });

  Future<Result<OverTime>> fetchOverTime({int? count = 10});
}
