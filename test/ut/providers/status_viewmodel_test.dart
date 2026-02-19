import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/mapper/v5/metrics_mapper.dart';
import 'package:pi_hole_client/data/model/v5/over_time_data.dart' as v5_model;
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';

import '../../../testing/models/v5/realtime_status.dart' as rt_fixture;
import '../../../testing/models/v6/ftl.dart' as ftl_fixture;

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
    });

    test('setServerStatus updates value and notifies listeners', () {
      statusViewModel.setServerStatus(LoadStatus.loaded);
      expect(statusViewModel.getServerStatus, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('setStatusLoading updates value and notifies listeners', () {
      statusViewModel.setStatusLoading(LoadStatus.loaded);
      expect(statusViewModel.getStatusLoading, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('setRealtimeStatus updates value and notifies listeners', () {
      statusViewModel.setRealtimeStatus(rt_fixture.kRepoFetchRealTimeStatus);
      expect(statusViewModel.getRealtimeStatus,
          rt_fixture.kRepoFetchRealTimeStatus);
      expect(statusViewModel.getStatusLoading, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test(
      'setOvertimeDataLoadingStatus updates value and notifies listeners',
      () {
        statusViewModel.setOvertimeDataLoadingStatus(LoadStatus.loaded);
        expect(statusViewModel.getOvertimeDataLoadStatus, LoadStatus.loaded);
        expect(listenerCalled, true);
      },
    );

    test('setOvertimeData updates value and notifies listeners', () {
      final data = v5_model.OverTimeData.fromJson({
        'domains_over_time': {
          '1733391300': 0,
          '1733396700': 3,
          '1733400300': 2,
        },
        'ads_over_time': {
          '1733391300': 0,
          '1733396700': 0,
          '1733400300': 0,
        },
        'clients': [
          {'name': '', 'ip': '172.26.0.1'},
          {'name': 'localhost', 'ip': '127.0.0.1'},
        ],
        'over_time': {
          '1733391300': [0, 0],
          '1733396700': [3, 0],
          '1733400300': [0, 2],
        },
      });
      final overtimeData = data.toDomain();
      statusViewModel.setOvertimeData(overtimeData);
      expect(statusViewModel.getOvertimeData, overtimeData);
      expect(listenerCalled, true);
    });

    test('setFtlDnsMetrics updates value and notifies listeners', () {
      statusViewModel.setFtlDnsMetrics(ftl_fixture.kRepoFetchFtlMetrics);
      expect(
          statusViewModel.getFtlDnsMetrics, ftl_fixture.kRepoFetchFtlMetrics);
      expect(
          statusViewModel.getDnsCache, ftl_fixture.kRepoFetchFtlMetrics.cache);
      expect(statusViewModel.getDnsReplies,
          ftl_fixture.kRepoFetchFtlMetrics.replies);
      expect(listenerCalled, true);
    });
  });
}
