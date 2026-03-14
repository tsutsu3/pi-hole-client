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
import 'package:pi_hole_client/domain/services/logs_pagination_service.dart';
import 'package:result_dart/result_dart.dart';

/// A controllable fake that returns pre-defined responses in sequence.
class _FakeMetricsRepository implements MetricsRepository {
  _FakeMetricsRepository(this._responses);

  final List<Result<Logs>> _responses;
  int _callCount = 0;

  /// The `start` argument from the most recent [fetchQueries] call.
  int? lastStart;

  /// The `cursor` argument from the most recent [fetchQueries] call.
  int? lastCursor;

  @override
  Future<Result<Logs>> fetchQueries({
    required DateTime from,
    required DateTime until,
    int? length = 100,
    int? cursor,
    int? start,
  }) async {
    lastStart = start;
    lastCursor = cursor;
    if (_callCount < _responses.length) {
      return _responses[_callCount++];
    }
    // Fallback: empty finished response.
    return const Success(
      Logs(logs: [], cursor: null, recordsTotal: 0, recordsFiltered: 0),
    );
  }

  // Unused interface members.
  @override
  Future<Result<History>> fetchHistory() => throw UnimplementedError();
  @override
  Future<Result<Clients>> fetchHistoryClient({int? count = 10}) =>
      throw UnimplementedError();
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

/// Builds a minimal [Log] with the given id.
Log _log(int id) => Log(
  dateTime: DateTime(2024),
  type: DnsRecordType.a,
  url: 'example.com',
  device: '192.168.1.1',
  replyTime: 0.001,
  id: id,
);

/// Builds a [Logs] response that simulates a V5-style single-page result
/// (no cursor, so all logs are returned at once).
Logs _v5Logs(List<Log> logs) => Logs(
  logs: logs,
  cursor: null,
  recordsTotal: logs.length,
  recordsFiltered: logs.length,
);

/// Builds a [Logs] response that simulates a V6-style paginated result.
Logs _v6Logs(List<Log> logs, {required int cursor, int? recordsFiltered}) =>
    Logs(
      logs: logs,
      cursor: cursor,
      recordsTotal: recordsFiltered ?? logs.length,
      recordsFiltered: recordsFiltered ?? logs.length,
    );

void main() {
  final start = DateTime(2024, 1, 1);
  final end = DateTime(2024, 1, 1, 1);

  group('LogsPaginationService – initial state', () {
    test('finished starts as loading', () {
      final svc = LogsPaginationService(repository: _FakeMetricsRepository([]));
      expect(svc.finished, LoadStatus.loading);
    });

    test('throws ArgumentError when time is not set before load', () async {
      final svc = LogsPaginationService(repository: _FakeMetricsRepository([]));
      await expectLater(svc.loadNextPage(), throwsArgumentError);
    });
  });

  group('LogsPaginationService – V5 (no cursor, single response)', () {
    test('returns all logs and transitions to loaded', () async {
      final logs = [_log(1), _log(2)];
      final svc = LogsPaginationService(
        repository: _FakeMetricsRepository([Success(_v5Logs(logs))]),
      );
      svc.reset(start, end);

      final result = await svc.loadNextPage();

      expect(result.length, 2);
      expect(result.first.id, 1);
      expect(svc.finished, LoadStatus.loaded);
    });

    test('subsequent call after finished returns empty list', () async {
      final svc = LogsPaginationService(
        repository: _FakeMetricsRepository([
          Success(_v5Logs([_log(1)])),
        ]),
      );
      svc.reset(start, end);
      await svc.loadNextPage();

      final second = await svc.loadNextPage();
      expect(second, isEmpty);
      expect(svc.finished, LoadStatus.loaded);
    });
  });

  group('LogsPaginationService – V6 (cursor-based pagination)', () {
    test('single page (fewer than pageSize) transitions to loaded', () async {
      final logs = [_log(1), _log(2)];
      final svc = LogsPaginationService(
        repository: _FakeMetricsRepository([
          Success(_v6Logs(logs, cursor: 42)),
        ]),
        pageSize: 500,
      );
      svc.reset(start, end);

      final result = await svc.loadNextPage();
      expect(result.length, 2);
      expect(svc.finished, LoadStatus.loaded);
    });

    test('full page stays loading; second page advances offset', () async {
      const pageSize = 3;
      final page1 = [_log(1), _log(2), _log(3)]; // full page
      final page2 = [_log(4)]; // partial last page

      final repo = _FakeMetricsRepository([
        Success(_v6Logs(page1, cursor: 99, recordsFiltered: 4)),
        Success(_v6Logs(page2, cursor: 99, recordsFiltered: 4)),
      ]);
      final svc = LogsPaginationService(repository: repo, pageSize: pageSize);
      svc.reset(start, end);

      final r1 = await svc.loadNextPage();
      expect(r1.length, 3);
      expect(svc.finished, LoadStatus.loading); // more pages expected

      final r2 = await svc.loadNextPage();
      expect(r2.length, 1);
      expect(svc.finished, LoadStatus.loaded); // last page

      // Offset advances by the count of logs returned on page 1.
      expect(repo.lastStart, 3);
      // Cursor is fixed from first response.
      expect(repo.lastCursor, 99);
    });

    test(
      'empty V6 response (recordsFiltered == 0) transitions to loaded',
      () async {
        final svc = LogsPaginationService(
          repository: _FakeMetricsRepository([
            const Success(
              Logs(logs: [], cursor: 42, recordsTotal: 0, recordsFiltered: 0),
            ),
          ]),
        );
        svc.reset(start, end);

        final result = await svc.loadNextPage();
        expect(result, isEmpty);
        expect(svc.finished, LoadStatus.loaded);
      },
    );

    test('reset clears cursor and offset for a fresh cycle', () async {
      // pageSize=2: page1 is full (2 logs) -> stays loading
      //             page2 is partial (1 log) -> transitions to loaded
      const pageSize = 2;
      final repo = _FakeMetricsRepository([
        Success(_v6Logs([_log(1), _log(2)], cursor: 10, recordsFiltered: 3)),
        Success(_v6Logs([_log(3)], cursor: 10, recordsFiltered: 3)),
        // After reset, this is treated as a fresh first call (no cursor).
        Success(_v6Logs([_log(4)], cursor: 20)),
      ]);
      final svc = LogsPaginationService(repository: repo, pageSize: pageSize);

      svc.reset(start, end);
      await svc.loadNextPage(); // page1: full
      await svc.loadNextPage(); // page2: partial -> loaded
      expect(svc.finished, LoadStatus.loaded);

      // Reset for a new window.
      svc.reset(start, end);
      expect(svc.finished, LoadStatus.loading);

      final r = await svc.loadNextPage();
      expect(r.first.id, 4);
      // cursor is null on first call after reset.
      expect(repo.lastCursor, null);
    });
  });

  group('LogsPaginationService – error handling', () {
    test('API failure followed by success (retry) returns logs', () async {
      final logs = [_log(1)];
      final svc = LogsPaginationService(
        repository: _FakeMetricsRepository([
          Failure(Exception('network error')),
          Success(_v5Logs(logs)),
        ]),
      );
      svc.reset(start, end);

      final result = await svc.loadNextPage();
      expect(result.length, 1);
      expect(svc.finished, LoadStatus.loaded);
    });

    test(
      'all retries exhausted transitions to error and returns empty',
      () async {
        final svc = LogsPaginationService(
          repository: _FakeMetricsRepository([
            Failure(Exception('error')),
            Failure(Exception('error again')),
          ]),
        );
        svc.reset(start, end);

        final result = await svc.loadNextPage();
        expect(result, isEmpty);
        expect(svc.finished, LoadStatus.error);
      },
    );
  });
}
