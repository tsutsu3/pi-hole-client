import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';

import '../../../../testing/fakes/repositories/api/fake_dns_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_metrics_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_realtime_status_repository.dart';

/// Configures [vm] with fake repositories and an optional server address.
void _setup(
  StatusViewModel vm, {
  String serverAddress = 'http://pi.hole',
  String apiVersion = 'v5',
  FakeRealTimeStatusRepository? realtimeStatusRepository,
  FakeMetricsRepository? metricsRepository,
  FakeFtlRepository? ftlRepository,
  FakeDnsRepository? dnsRepository,
  int autoRefreshTime = 5,
}) {
  vm.update(
    realtimeStatusRepository:
        realtimeStatusRepository ?? FakeRealTimeStatusRepository(),
    metricsRepository: metricsRepository ?? FakeMetricsRepository(),
    ftlRepository: ftlRepository ?? FakeFtlRepository(),
    dnsRepository: dnsRepository ?? FakeDnsRepository(),
    apiVersion: apiVersion,
    selectedServerAddress: serverAddress,
    selectedServerAlias: 'Test Server',
    autoRefreshTime: autoRefreshTime,
  );
}

void main() {
  group('StatusViewModel Tests', () {
    late StatusViewModel statusViewModel;
    late bool listenerCalled;

    setUp(() {
      statusViewModel = StatusViewModel();
      listenerCalled = false;
      statusViewModel.addListener(() {
        listenerCalled = true;
      });
    });

    test('Initial values are correct', () {
      expect(statusViewModel.getServerStatus, LoadStatus.loading);
      expect(statusViewModel.getRealtimeStatus, null);
      expect(statusViewModel.getStatusLoading, LoadStatus.loading);
      expect(statusViewModel.getOvertimeData, null);
      expect(statusViewModel.getDnsCache, null);
      expect(statusViewModel.getDnsReplies, null);
      expect(statusViewModel.getFtlDnsMetrics, null);
      expect(statusViewModel.getOvertimeDataLoadStatus, LoadStatus.loading);
      expect(statusViewModel.isServerLoading, true);
      expect(statusViewModel.isAutoRefreshRunning, false);
      expect(statusViewModel.topClientNames, isEmpty);
    });

    test('setServerStatus updates value and notifies listeners', () {
      statusViewModel.setServerStatus(LoadStatus.loaded);
      expect(statusViewModel.getServerStatus, LoadStatus.loaded);
      expect(statusViewModel.isServerLoading, false);
      expect(listenerCalled, true);
    });

    test('update resets state when server address changes', () {
      // Set initial server address.
      statusViewModel.update(
        selectedServerAddress: 'http://server-a',
        selectedServerAlias: 'Server A',
      );
      // Simulate loaded state.
      statusViewModel.setServerStatus(LoadStatus.loaded);
      listenerCalled = false;

      // Switch to a different server.
      statusViewModel.update(
        selectedServerAddress: 'http://server-b',
        selectedServerAlias: 'Server B',
      );

      // Server address changed -> state should reset to loading.
      expect(statusViewModel.getServerStatus, LoadStatus.loading);
      expect(statusViewModel.getRealtimeStatus, null);
      expect(statusViewModel.getOvertimeData, null);
      expect(statusViewModel.getFtlDnsMetrics, null);
      expect(listenerCalled, true);
    });

    test('update does not reset state when same server address', () {
      statusViewModel.update(
        selectedServerAddress: 'http://server-a',
        selectedServerAlias: 'Server A',
      );
      statusViewModel.setServerStatus(LoadStatus.loaded);
      listenerCalled = false;

      statusViewModel.update(
        selectedServerAddress: 'http://server-a',
        selectedServerAlias: 'Server A',
      );

      // Same server -> state should be preserved.
      expect(statusViewModel.getServerStatus, LoadStatus.loaded);
      expect(listenerCalled, false);
    });

    test('topClientNames returns empty when no realtime status', () {
      expect(statusViewModel.topClientNames, isEmpty);
    });
  });

  // ---------------------------------------------------------------------------
  // refreshOnce() — covers _fetchStatusData / _fetchOverTimeData /
  // _fetchMetricsData paths without dealing with periodic timers.
  // ---------------------------------------------------------------------------
  group('StatusViewModel – refreshOnce() V5 success', () {
    late StatusViewModel vm;

    setUp(() {
      vm = StatusViewModel();
      _setup(vm);
    });

    tearDown(() => vm.dispose());

    test('loading -> loaded: returns true and sets serverStatus', () async {
      expect(vm.getServerStatus, LoadStatus.loading);
      final ok = await vm.refreshOnce();
      expect(ok, isTrue);
      expect(vm.getServerStatus, LoadStatus.loaded);
    });

    test('loading -> loaded: realtimeStatus is populated', () async {
      expect(vm.getServerStatus, LoadStatus.loading);
      await vm.refreshOnce();
      expect(vm.getRealtimeStatus, isNotNull);
    });

    test('loading -> loaded: overtimeData is populated', () async {
      expect(vm.getServerStatus, LoadStatus.loading);
      await vm.refreshOnce();
      expect(vm.getOvertimeData, isNotNull);
    });

    test('loading -> loaded: ftlDnsMetrics is populated', () async {
      expect(vm.getServerStatus, LoadStatus.loading);
      await vm.refreshOnce();
      expect(vm.getFtlDnsMetrics, isNotNull);
    });

    test('loading -> loaded: statusLoading transitions to loaded', () async {
      expect(vm.getStatusLoading, LoadStatus.loading);
      await vm.refreshOnce();
      expect(vm.getStatusLoading, LoadStatus.loaded);
    });

    test(
      'loading -> loaded: topClientNames reflects fetched realtime status',
      () async {
        expect(vm.getServerStatus, LoadStatus.loading);
        await vm.refreshOnce();
        // kRepoFetchRealTimeStatus has sources: '172.26.0.1' and
        // 'localhost|127.0.0.1'; split('|').first gives hostname or IP.
        expect(vm.topClientNames, containsAll(['172.26.0.1', 'localhost']));
      },
    );
  });

  group('StatusViewModel – refreshOnce() V5 failure', () {
    late StatusViewModel vm;

    tearDown(() => vm.dispose());

    test(
      'loading -> error: status fetch failure sets serverStatus to error',
      () async {
        vm = StatusViewModel();
        final failingRepo = FakeRealTimeStatusRepository()..shouldFail = true;
        _setup(vm, realtimeStatusRepository: failingRepo);

        expect(vm.getServerStatus, LoadStatus.loading);
        final ok = await vm.refreshOnce();
        expect(ok, isFalse);
        expect(vm.getServerStatus, LoadStatus.error);
      },
    );

    test(
      'loading -> error: overtime fetch failure sets serverStatus to error',
      () async {
        vm = StatusViewModel();
        final failingMetrics = FakeMetricsRepository()..shouldFail = true;
        _setup(vm, metricsRepository: failingMetrics);

        expect(vm.getServerStatus, LoadStatus.loading);
        final ok = await vm.refreshOnce();
        expect(ok, isFalse);
        expect(vm.getServerStatus, LoadStatus.error);
      },
    );

    test('returns false when no server address is set', () async {
      vm = StatusViewModel();
      // Do not call _setup — no server address.
      expect(vm.getServerStatus, LoadStatus.loading);
      final ok = await vm.refreshOnce();
      expect(ok, isFalse);
    });
  });

  group('StatusViewModel – refreshOnce() V6', () {
    late StatusViewModel vm;

    setUp(() {
      vm = StatusViewModel();
      _setup(vm, apiVersion: 'v6');
    });

    tearDown(() => vm.dispose());

    test('loading -> loaded: V6 success populates realtimeStatus', () async {
      expect(vm.getServerStatus, LoadStatus.loading);
      final ok = await vm.refreshOnce();
      expect(ok, isTrue);
      expect(vm.getServerStatus, LoadStatus.loaded);
      expect(vm.getRealtimeStatus, isNotNull);
    });

    test(
      'loading -> error: V6 metrics failure sets serverStatus to error',
      () async {
        vm = StatusViewModel();
        final failingMetrics = FakeMetricsRepository()..shouldFail = true;
        _setup(vm, apiVersion: 'v6', metricsRepository: failingMetrics);

        expect(vm.getServerStatus, LoadStatus.loading);
        final ok = await vm.refreshOnce();
        expect(ok, isFalse);
        expect(vm.getServerStatus, LoadStatus.error);
      },
    );
  });

  // ---------------------------------------------------------------------------
  // startAutoRefresh / stopAutoRefresh lifecycle
  // ---------------------------------------------------------------------------
  group('StatusViewModel – auto-refresh lifecycle', () {
    late StatusViewModel vm;

    setUp(() {
      vm = StatusViewModel();
      _setup(vm);
    });

    tearDown(() => vm.dispose());

    test('startAutoRefresh sets isAutoRefreshRunning to true', () {
      vm.startAutoRefresh(runImmediately: false);
      expect(vm.isAutoRefreshRunning, isTrue);
    });

    test('calling startAutoRefresh twice has no effect (idempotent)', () {
      vm.startAutoRefresh(runImmediately: false);
      vm.startAutoRefresh(runImmediately: false);
      expect(vm.isAutoRefreshRunning, isTrue);
    });

    test('stopAutoRefresh sets isAutoRefreshRunning to false', () {
      vm.startAutoRefresh(runImmediately: false);
      vm.stopAutoRefresh();
      expect(vm.isAutoRefreshRunning, isFalse);
    });

    test('calling stopAutoRefresh when not running has no effect', () {
      expect(vm.isAutoRefreshRunning, isFalse);
      vm.stopAutoRefresh(); // should not throw
      expect(vm.isAutoRefreshRunning, isFalse);
    });

    test('startAutoRefresh triggers data fetch and updates state', () async {
      vm.startAutoRefresh();
      // Pump the event queue to let the immediate timerFn() complete.
      await Future<void>.delayed(Duration.zero);
      await pumpEventQueue();

      expect(vm.getRealtimeStatus, isNotNull);
      expect(vm.getStatusLoading, LoadStatus.loaded);
    });
  });

  // ---------------------------------------------------------------------------
  // update() — auto-refresh interval change restarts timers
  // ---------------------------------------------------------------------------
  group('StatusViewModel – update() interval change', () {
    late StatusViewModel vm;

    tearDown(() => vm.dispose());

    test(
      'changing autoRefreshTime while running restarts auto-refresh',
      () async {
        vm = StatusViewModel();
        _setup(vm, autoRefreshTime: 5);
        vm.startAutoRefresh(runImmediately: false);
        expect(vm.isAutoRefreshRunning, isTrue);

        // Change the refresh interval — should stop and reschedule.
        _setup(vm, autoRefreshTime: 10);
        // After microtask the timers are restarted.
        await Future<void>.microtask(() {});

        expect(vm.isAutoRefreshRunning, isTrue);
      },
    );
  });
}
