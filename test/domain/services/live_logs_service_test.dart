import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/clients.dart';
import 'package:pi_hole_client/domain/model/metrics/history.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart';
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/domain/services/live_logs_service.dart';
import 'package:pi_hole_client/domain/services/logs_pagination_service.dart';
import 'package:result_dart/result_dart.dart';

// ---------------------------------------------------------------------------
// Stub repository – required by LogsPaginationService base constructor only.
// ---------------------------------------------------------------------------
class _UnusedMetricsRepository implements MetricsRepository {
  @override
  Future<Result<History>> fetchHistory() => throw UnimplementedError();
  @override
  Future<Result<Clients>> fetchHistoryClient({int? count = 10}) =>
      throw UnimplementedError();
  @override
  Future<Result<Logs>> fetchQueries({
    required DateTime from,
    required DateTime until,
    int? length = 100,
    int? cursor,
    int? start,
  }) => throw UnimplementedError();
  @override
  Future<Result<Summary>> fetchStatsSummary() => throw UnimplementedError();
  @override
  Future<Result<List<DestinationStat>>> fetchStatsUpstreams() =>
      throw UnimplementedError();
  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsBlocked({
    int? count = 10,
  }) => throw UnimplementedError();
  @override
  Future<Result<List<QueryStat>>> fetchStatsTopDomainsAllowed({
    int? count = 10,
  }) => throw UnimplementedError();
  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsBlocked({
    int? count = 10,
  }) => throw UnimplementedError();
  @override
  Future<Result<List<SourceStat>>> fetchStatsTopClientsAllowed({
    int? count = 10,
  }) => throw UnimplementedError();
  @override
  Future<Result<OverTime>> fetchOverTime({int? count = 10}) =>
      throw UnimplementedError();
}

// ---------------------------------------------------------------------------
// Fake pagination service – returns pre-defined pages in sequence.
// ---------------------------------------------------------------------------
class _FakePaginationService extends LogsPaginationService {
  _FakePaginationService({required this.pages})
      : super(repository: _UnusedMetricsRepository());

  final List<List<Log>> pages;
  int _index = 0;

  @override
  LoadStatus get finished =>
      _index >= pages.length ? LoadStatus.loaded : LoadStatus.loading;

  @override
  void reset(DateTime start, DateTime until) {
    _index = 0;
  }

  @override
  Future<List<Log>> loadNextPage() async {
    if (_index >= pages.length) return const [];
    return pages[_index++];
  }
}

// ---------------------------------------------------------------------------
// Fake that always throws to simulate an unexpected error.
// ---------------------------------------------------------------------------
class _ThrowingPaginationService extends LogsPaginationService {
  _ThrowingPaginationService()
      : super(repository: _UnusedMetricsRepository());

  @override
  LoadStatus get finished => LoadStatus.loading;

  @override
  void reset(DateTime start, DateTime until) {}

  @override
  Future<List<Log>> loadNextPage() async =>
      throw Exception('simulated network failure');
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------
Log _log(int id) => Log(
      dateTime: DateTime(2024),
      type: DnsRecordType.a,
      url: 'example.com',
      device: '192.168.1.1',
      replyTime: 0.001,
      id: id,
    );

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------
void main() {
  final baseEnd = DateTime(2024, 1, 1);

  group('LiveLogsService – normal tick', () {
    test('collects logs across multiple pages and advances lastEnd', () async {
      final page1 = [_log(1), _log(2)];
      final page2 = [_log(3)];
      final svc = LiveLogsService(
        paginationService: _FakePaginationService(pages: [page1, page2]),
        endTime: baseEnd,
      );

      final result = await svc.tickOnce();

      expect(result.length, 3);
      expect(result.map((l) => l.id), containsAllInOrder([1, 2, 3]));
      // lastEnd must advance beyond the initial baseEnd value.
      expect(svc.lastEnd!.isAfter(baseEnd), isTrue);
    });

    test('returns empty list when no new logs are available', () async {
      final svc = LiveLogsService(
        paginationService: _FakePaginationService(pages: []),
        endTime: baseEnd,
      );

      final result = await svc.tickOnce();
      expect(result, isEmpty);
    });
  });

  group('LiveLogsService – concurrent call prevention', () {
    test('second call while first is loading returns empty immediately', () async {
      final svc = LiveLogsService(
        paginationService: _FakePaginationService(pages: [[_log(1)]]),
        endTime: baseEnd,
      );

      // Start first tick without awaiting.
      final first = svc.tickOnce();
      expect(svc.isLoading, isTrue);

      // Second call must return empty immediately.
      final second = await svc.tickOnce();
      expect(second, isEmpty);

      // First tick still completes with the log.
      final firstResult = await first;
      expect(firstResult.length, 1);
    });
  });

  group('LiveLogsService – error handling', () {
    test('exception inside pagination is caught and returns empty list', () async {
      final svc = LiveLogsService(
        paginationService: _ThrowingPaginationService(),
        endTime: baseEnd,
      );

      final result = await svc.tickOnce();
      expect(result, isEmpty);
      // isLoading must be reset to false (finally block).
      expect(svc.isLoading, isFalse);
    });
  });

  group('LiveLogsService – max page limit', () {
    test('stops after 10 pages even when more are available', () async {
      // 11 pages — the loop should stop at 10 (indices 0-9).
      final pages = List.generate(11, (i) => [_log(i)]);
      final svc = LiveLogsService(
        paginationService: _FakePaginationService(pages: pages),
        endTime: baseEnd,
      );

      final result = await svc.tickOnce();
      expect(result.length, 10);
    });
  });
}
