import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';

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

      // Server address changed → state should reset to loading.
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

      // Same server → state should be preserved.
      expect(statusViewModel.getServerStatus, LoadStatus.loaded);
      expect(listenerCalled, false);
    });

    test('topClientNames returns empty when no realtime status', () {
      expect(statusViewModel.topClientNames, isEmpty);
    });
  });
}
