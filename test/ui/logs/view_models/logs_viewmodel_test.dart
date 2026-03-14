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
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:result_dart/result_dart.dart';

// ---------------------------------------------------------------------------
// Test fakes
// ---------------------------------------------------------------------------

/// Minimal [MetricsRepository] stub — never called by the fakes below.
class _StubMetricsRepository implements MetricsRepository {
  @override
  Future<Result<Logs>> fetchQueries({
    required DateTime from,
    required DateTime until,
    int? length = 100,
    int? cursor,
    int? start,
  }) => throw UnimplementedError();

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

/// [LogsPaginationService] that returns [_logs] on the first [loadNextPage]
/// call and [LoadStatus.loaded] thereafter.
class _ControlledPaginationService extends LogsPaginationService {
  _ControlledPaginationService(this._logs)
    : super(repository: _StubMetricsRepository());

  final List<Log> _logs;
  bool _done = false;

  @override
  LoadStatus get finished => _done ? LoadStatus.loaded : LoadStatus.loading;

  @override
  void reset(DateTime start, DateTime until) {
    super.reset(start, until);
    _done = false;
  }

  @override
  Future<List<Log>> loadNextPage() async {
    if (_done) return const [];
    _done = true;
    return List.of(_logs);
  }
}

/// [LogsPaginationService] that always returns an empty list and signals error.
class _ErrorPaginationService extends LogsPaginationService {
  _ErrorPaginationService() : super(repository: _StubMetricsRepository());

  @override
  LoadStatus get finished => LoadStatus.error;

  @override
  Future<List<Log>> loadNextPage() async => const [];
}

// ---------------------------------------------------------------------------
// Log builders
// ---------------------------------------------------------------------------

Log _allowedLog({
  required String url,
  required String device,
  DateTime? dateTime,
  int? id,
}) => Log(
  dateTime: dateTime ?? DateTime(2024, 1, 1, 12, 0),
  type: DnsRecordType.a,
  url: url,
  device: device,
  replyTime: 0.001,
  status: QueryStatusType.forwarded, // V5 index=2, allowed
  id: id,
);

Log _blockedLog({
  required String url,
  required String device,
  DateTime? dateTime,
  int? id,
}) => Log(
  dateTime: dateTime ?? DateTime(2024, 1, 1, 12, 0),
  type: DnsRecordType.a,
  url: url,
  device: device,
  replyTime: 0.001,
  status: QueryStatusType.gravity, // V5 index=1, blocked
  id: id,
);

// ---------------------------------------------------------------------------
// Helper: configure the VM with a fake repository and an injected factory.
// ---------------------------------------------------------------------------

LogsViewModel _buildVm({
  List<Log>? logs,
  bool failLoad = false,
  String apiVersion = 'v5',
  PaginationServiceFactory? overrideFactory,
}) {
  final factory =
      overrideFactory ??
      (failLoad
          ? ({required MetricsRepository repository}) =>
                _ErrorPaginationService()
          : ({required MetricsRepository repository}) =>
                _ControlledPaginationService(logs ?? const []));

  final vm = LogsViewModel(paginationServiceFactory: factory);
  vm.update(
    metricsRepository: _StubMetricsRepository(),
    apiVersion: apiVersion,
  );
  return vm;
}

/// Calls initScreen to create pagination services, then directly awaits
/// initializeLoad() to bypass SchedulerBinding's post-frame scheduling.
///
/// Requires [TestWidgetsFlutterBinding.ensureInitialized()] to be called
/// before the first use (done via setUpAll in the load/filter groups).
Future<void> _initAndLoad(LogsViewModel vm) async {
  vm.initScreen(logsPerQuery: 2.0); // creates services, schedules (unfired)
  await vm.initializeLoad(); // direct call — no pump needed
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  // Initialize the Flutter binding once so SchedulerBinding.instance is
  // available when initScreen() schedules its post-frame callback.
  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

  // -------------------------------------------------------------------------
  // Filter state (pure — no SchedulerBinding required)
  // -------------------------------------------------------------------------

  group('LogsViewModel – hasActiveChips', () {
    late LogsViewModel vm;

    setUp(() => vm = _buildVm());
    tearDown(() => vm.dispose());

    test('is false by default', () {
      expect(vm.hasActiveChips, isFalse);
    });

    test('becomes true when domain filter is set', () {
      vm.setSelectedDomain('example.com');
      expect(vm.hasActiveChips, isTrue);
    });

    test('becomes true when start time filter is set', () {
      vm.setStartTime(DateTime(2024));
      expect(vm.hasActiveChips, isTrue);
    });

    test('becomes true when end time filter is set', () {
      vm.setEndTime(DateTime(2024));
      expect(vm.hasActiveChips, isTrue);
    });

    test('becomes true when status filter is narrowed', () {
      vm.setRequestStatus(RequestStatus.blocked);
      expect(vm.hasActiveChips, isTrue);
    });

    test('is false again after resetFilters()', () {
      vm.setSelectedDomain('example.com');
      vm.setStartTime(DateTime(2024));
      vm.setRequestStatus(RequestStatus.blocked);
      vm.resetFilters();
      expect(vm.hasActiveChips, isFalse);
    });
  });

  // -------------------------------------------------------------------------
  // setRequestStatus / statusSelected
  // -------------------------------------------------------------------------

  group('LogsViewModel – setRequestStatus', () {
    late LogsViewModel vm;

    setUp(() => vm = _buildVm());
    tearDown(() => vm.dispose());

    test('default requestStatus is all', () {
      expect(vm.requestStatus, RequestStatus.all);
    });

    test(
      'setRequestStatus(blocked) sets requestStatus and narrows statusSelected',
      () {
        final allCount = vm.statusSelected.length;
        vm.setRequestStatus(RequestStatus.blocked);
        expect(vm.requestStatus, RequestStatus.blocked);
        expect(vm.statusSelected.length, lessThan(allCount));
      },
    );

    test(
      'setRequestStatus(allowed) sets requestStatus and narrows statusSelected',
      () {
        final allCount = vm.statusSelected.length;
        vm.setRequestStatus(RequestStatus.allowed);
        expect(vm.requestStatus, RequestStatus.allowed);
        expect(vm.statusSelected.length, lessThan(allCount));
      },
    );

    test('setRequestStatus(all) restores all statuses', () {
      vm.setRequestStatus(RequestStatus.blocked);
      final defaultCount = vm.defaultSelected.length;
      vm.setRequestStatus(RequestStatus.all);
      expect(vm.requestStatus, RequestStatus.all);
      expect(vm.statusSelected.length, equals(defaultCount));
    });

    test('resetStatus() restores all statuses', () {
      vm.setRequestStatus(RequestStatus.blocked);
      vm.resetStatus();
      expect(vm.requestStatus, RequestStatus.all);
      expect(vm.statusSelected.length, equals(vm.defaultSelected.length));
    });
  });

  // -------------------------------------------------------------------------
  // selectedStatusTypes / allStatusTypes / isAllowedOrRetried
  // -------------------------------------------------------------------------

  group('LogsViewModel – status type sets', () {
    late LogsViewModel vm;

    setUp(() => vm = _buildVm());
    tearDown(() => vm.dispose());

    test(
      'selectedStatusTypes is non-empty by default (all shown statuses)',
      () {
        expect(vm.selectedStatusTypes, isNotEmpty);
      },
    );

    test(
      'selectedStatusTypes contains forwarded when allowed filter active',
      () {
        vm.setRequestStatus(RequestStatus.allowed);
        expect(vm.selectedStatusTypes, contains(QueryStatusType.forwarded));
        expect(
          vm.selectedStatusTypes,
          isNot(contains(QueryStatusType.gravity)),
        );
      },
    );

    test('selectedStatusTypes contains gravity when blocked filter active', () {
      vm.setRequestStatus(RequestStatus.blocked);
      expect(vm.selectedStatusTypes, contains(QueryStatusType.gravity));
      expect(
        vm.selectedStatusTypes,
        isNot(contains(QueryStatusType.forwarded)),
      );
    });

    test('isAllowedOrRetried returns false for null', () {
      expect(vm.isAllowedOrRetried(null), isFalse);
    });

    test('isAllowedOrRetried returns true for forwarded (allowed)', () {
      expect(vm.isAllowedOrRetried(QueryStatusType.forwarded), isTrue);
    });

    test('isAllowedOrRetried returns false for gravity (blocked)', () {
      expect(vm.isAllowedOrRetried(QueryStatusType.gravity), isFalse);
    });

    test('allStatusTypes is non-empty and contains known statuses', () {
      expect(vm.allStatusTypes, isNotEmpty);
      expect(vm.allStatusTypes, contains(QueryStatusType.forwarded));
      expect(vm.allStatusTypes, contains(QueryStatusType.gravity));
    });
  });

  // -------------------------------------------------------------------------
  // Search, sort, selectedLog (pure state)
  // -------------------------------------------------------------------------

  group('LogsViewModel – search / sort / selectedLog', () {
    late LogsViewModel vm;

    setUp(() => vm = _buildVm());
    tearDown(() => vm.dispose());

    test('setSearchText updates searchText', () {
      vm.setSearchText('pihole');
      expect(vm.searchText, equals('pihole'));
    });

    test('updateSortStatus changes sortStatus', () {
      expect(vm.sortStatus, equals(0));
      vm.updateSortStatus(1);
      expect(vm.sortStatus, equals(1));
    });

    test('updateSortStatus with same value is a no-op', () {
      var count = 0;
      vm.addListener(() => count++);
      vm.updateSortStatus(0);
      expect(count, equals(0));
    });

    test('setSelectedLog updates selectedLog', () {
      final log = _allowedLog(url: 'test.com', device: '192.168.1.1');
      vm.setSelectedLog(log);
      expect(vm.selectedLog, same(log));
    });

    test('setSelectedLog(null) clears selectedLog', () {
      vm.setSelectedLog(_allowedLog(url: 'test.com', device: '192.168.1.1'));
      vm.setSelectedLog(null);
      expect(vm.selectedLog, isNull);
    });
  });

  // -------------------------------------------------------------------------
  // API version switch resets filter delegate
  // -------------------------------------------------------------------------

  group('LogsViewModel – update() API version switch', () {
    test('switching from v5 to v6 resets filter state', () {
      final vm = _buildVm();
      vm.setRequestStatus(RequestStatus.blocked);
      expect(vm.requestStatus, RequestStatus.blocked);

      // Switch to v6 -> filter delegate is replaced.
      vm.update(metricsRepository: _StubMetricsRepository(), apiVersion: 'v6');
      expect(vm.apiVersion, equals('v6'));
      expect(vm.requestStatus, equals(RequestStatus.all));
      vm.dispose();
    });
  });

  // -------------------------------------------------------------------------
  // Load lifecycle — direct await on initializeLoad() bypasses SchedulerBinding
  // -------------------------------------------------------------------------

  group('LogsViewModel – initScreen load lifecycle', () {
    test('loading -> loaded: logs are populated', () async {
      final log = _allowedLog(url: 'example.com', device: '10.0.0.1', id: 1);
      final vm = _buildVm(logs: [log]);

      expect(vm.loadStatus, LoadStatus.loading);
      await _initAndLoad(vm);

      expect(vm.loadStatus, LoadStatus.loaded);
      expect(vm.logsList.length, equals(1));
      vm.dispose();
    });

    test(
      'loading -> error: pagination failure sets loadStatus to error',
      () async {
        final vm = _buildVm(failLoad: true);

        expect(vm.loadStatus, LoadStatus.loading);
        await _initAndLoad(vm);

        expect(vm.loadStatus, LoadStatus.error);
        expect(vm.logsList, isEmpty);
        vm.dispose();
      },
    );

    test('loading -> loaded: deduplicates logs with the same id', () async {
      final log = _allowedLog(url: 'dup.com', device: '10.0.0.1', id: 42);
      // Same log provided twice — dedup by id should keep only one entry.
      final vm = _buildVm(logs: [log, log]);

      expect(vm.loadStatus, LoadStatus.loading);
      await _initAndLoad(vm);

      expect(vm.loadStatus, LoadStatus.loaded);
      expect(vm.logsList.length, equals(1));
      vm.dispose();
    });
  });

  // -------------------------------------------------------------------------
  // logsListDisplay – filtering and sorting
  // -------------------------------------------------------------------------

  group('LogsViewModel – logsListDisplay filtering', () {
    test('shows all logs by default', () async {
      final logs = [
        _allowedLog(url: 'a.com', device: '10.0.0.1', id: 1),
        _blockedLog(url: 'b.com', device: '10.0.0.2', id: 2),
      ];
      final vm = _buildVm(logs: logs);
      await _initAndLoad(vm);

      expect(vm.logsListDisplay.length, equals(2));
      vm.dispose();
    });

    test('hides blocked logs when allowed filter is active', () async {
      final logs = [
        _allowedLog(url: 'good.com', device: '10.0.0.1', id: 1),
        _blockedLog(url: 'bad.com', device: '10.0.0.2', id: 2),
      ];
      final vm = _buildVm(logs: logs);
      await _initAndLoad(vm);

      vm.setRequestStatus(RequestStatus.allowed);

      final display = vm.logsListDisplay;
      expect(display.length, equals(1));
      expect(display.first.url, equals('good.com'));
      vm.dispose();
    });

    test('hides allowed logs when blocked filter is active', () async {
      final logs = [
        _allowedLog(url: 'good.com', device: '10.0.0.1', id: 1),
        _blockedLog(url: 'bad.com', device: '10.0.0.2', id: 2),
      ];
      final vm = _buildVm(logs: logs);
      await _initAndLoad(vm);

      vm.setRequestStatus(RequestStatus.blocked);

      final display = vm.logsListDisplay;
      expect(display.length, equals(1));
      expect(display.first.url, equals('bad.com'));
      vm.dispose();
    });

    test('filters by search text (case-insensitive)', () async {
      final logs = [
        _allowedLog(url: 'alpha.com', device: '10.0.0.1', id: 1),
        _allowedLog(url: 'beta.org', device: '10.0.0.2', id: 2),
      ];
      final vm = _buildVm(logs: logs);
      await _initAndLoad(vm);

      vm.setSearchText('ALPHA');

      final display = vm.logsListDisplay;
      expect(display.length, equals(1));
      expect(display.first.url, equals('alpha.com'));
      vm.dispose();
    });

    test('filters by domain', () async {
      final logs = [
        _allowedLog(url: 'target.com', device: '10.0.0.1', id: 1),
        _allowedLog(url: 'other.com', device: '10.0.0.2', id: 2),
      ];
      final vm = _buildVm(logs: logs);
      await _initAndLoad(vm);

      vm.setSelectedDomain('target.com');

      final display = vm.logsListDisplay;
      expect(display.length, equals(1));
      expect(display.first.url, equals('target.com'));
      vm.dispose();
    });

    test('filters by client device', () async {
      final logs = [
        _allowedLog(url: 'a.com', device: 'client-a', id: 1),
        _allowedLog(url: 'b.com', device: 'client-b', id: 2),
      ];
      final vm = _buildVm(logs: logs);
      await _initAndLoad(vm);

      vm.setClients(['client-a', 'client-b']);
      vm.setSelectedClients(['client-a']);

      final display = vm.logsListDisplay;
      expect(display.length, equals(1));
      expect(display.first.device, equals('client-a'));
      vm.dispose();
    });
  });

  // -------------------------------------------------------------------------
  // logsListDisplay – sort order
  // -------------------------------------------------------------------------

  group('LogsViewModel – logsListDisplay sort order', () {
    test('sortStatus=0 returns newest-first order', () async {
      final older = _allowedLog(
        url: 'old.com',
        device: '10.0.0.1',
        dateTime: DateTime(2024, 1, 1, 10, 0),
        id: 1,
      );
      final newer = _allowedLog(
        url: 'new.com',
        device: '10.0.0.2',
        dateTime: DateTime(2024, 1, 1, 12, 0),
        id: 2,
      );
      final vm = _buildVm(logs: [older, newer]);
      await _initAndLoad(vm);

      vm.updateSortStatus(0); // newest first (default)

      final display = vm.logsListDisplay;
      expect(display.first.url, equals('new.com'));
      expect(display.last.url, equals('old.com'));
      vm.dispose();
    });

    test('sortStatus=1 returns oldest-first order', () async {
      final older = _allowedLog(
        url: 'old.com',
        device: '10.0.0.1',
        dateTime: DateTime(2024, 1, 1, 10, 0),
        id: 1,
      );
      final newer = _allowedLog(
        url: 'new.com',
        device: '10.0.0.2',
        dateTime: DateTime(2024, 1, 1, 12, 0),
        id: 2,
      );
      final vm = _buildVm(logs: [older, newer]);
      await _initAndLoad(vm);

      vm.updateSortStatus(1); // oldest first

      final display = vm.logsListDisplay;
      expect(display.first.url, equals('old.com'));
      expect(display.last.url, equals('new.com'));
      vm.dispose();
    });
  });
}
