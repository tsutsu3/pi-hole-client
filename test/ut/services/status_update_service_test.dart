import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/metrics.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/viewmodel/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';

import '../../widgets/helpers.dart' show metrics, overtimeData, realtimeStatus;
import './status_update_service_test.mocks.dart' as ut;

@GenerateMocks([
  AppConfigViewModel,
  ServersViewModel,
  StatusViewModel,
  LogsViewModel,
  ApiGatewayV6,
])
void main() async {
  // For loading the .env file
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('ServersViewModel', () {
    late StatusUpdateService statusUpdateService;

    late ut.MockAppConfigViewModel mockAppConfigViewModel;
    late ut.MockServersViewModel mockServersViewModel;
    late ut.MockStatusViewModel mockStatusViewModel;
    late ut.MockLogsViewModel mockLogsViewModel;

    late ut.MockApiGatewayV6 mockApiGatewayV6;

    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
      ignoreCertificateErrors: false,
    );

    setUp(() {
      mockAppConfigViewModel = ut.MockAppConfigViewModel();
      mockServersViewModel = ut.MockServersViewModel();
      mockStatusViewModel = ut.MockStatusViewModel();
      mockLogsViewModel = ut.MockLogsViewModel();
      mockApiGatewayV6 = ut.MockApiGatewayV6();

      when(mockAppConfigViewModel.getAutoRefreshTime).thenReturn(5);

      when(mockServersViewModel.selectedServer).thenReturn(server);
      when(mockServersViewModel.selectedApiGateway).thenReturn(mockApiGatewayV6);
      when(
        mockServersViewModel.updateselectedServerStatus(any),
      ).thenReturn(null);
      when(mockServersViewModel.connectingServer).thenReturn(null);

      when(mockStatusViewModel.setServerStatus(any)).thenReturn(null);
      when(mockStatusViewModel.setRealtimeStatus(any)).thenReturn(null);
      when(mockStatusViewModel.setStatusLoading(any)).thenReturn(null);
      when(mockStatusViewModel.setOvertimeData(any)).thenReturn(null);
      when(mockStatusViewModel.setMetricsInfo(any)).thenReturn(null);
      when(
        mockStatusViewModel.setOvertimeDataLoadingStatus(any),
      ).thenReturn(null);
      when(mockStatusViewModel.isServerLoading).thenReturn(true);
      when(mockStatusViewModel.getServerStatus).thenReturn(LoadStatus.loading);

      when(mockLogsViewModel.setClients(any)).thenReturn(null);

      when(
        mockApiGatewayV6.realtimeStatus(clientCount: anyNamed('clientCount')),
      ).thenAnswer(
        (_) async => RealtimeStatusResponse(
          result: APiResponseType.success,
          data: realtimeStatus,
        ),
      );

      when(mockApiGatewayV6.fetchOverTimeData()).thenAnswer(
        (_) async => FetchOverTimeDataResponse(
          result: APiResponseType.success,
          data: overtimeData,
        ),
      );

      when(mockApiGatewayV6.getMetrics()).thenAnswer(
        (_) async => MetricsResponse(
          result: APiResponseType.success,
          data: MetricsInfo.fromV6(metrics),
        ),
      );

      statusUpdateService = StatusUpdateService(
        serversViewModel: mockServersViewModel,
        statusViewModel: mockStatusViewModel,
        appConfigViewModel: mockAppConfigViewModel,
        logsViewModel: mockLogsViewModel,
      );
    });

    test(
      'startAutoRefresh starts refreshing automatically on first run',
      () async {
        when(mockAppConfigViewModel.getAutoRefreshTime).thenReturn(5);

        statusUpdateService.startAutoRefresh();

        // sleep for 2 seconds to allow the timer to run
        await Future.delayed(const Duration(seconds: 1));
        verify(mockAppConfigViewModel.getAutoRefreshTime).called(4);
        verify(mockStatusViewModel.setRealtimeStatus(any)).called(1);
        verify(mockStatusViewModel.setOvertimeData(any)).called(1);
        verify(mockStatusViewModel.setMetricsInfo(any)).called(1);
        expect(statusUpdateService.isAutoRefreshRunning, true);

        statusUpdateService.stopAutoRefresh();
      },
    );

    test(
      'startAutoRefresh does not start refreshing automatically on second run',
      () async {
        when(mockAppConfigViewModel.getAutoRefreshTime).thenReturn(5);

        statusUpdateService.startAutoRefresh();
        statusUpdateService.startAutoRefresh();
        await Future.delayed(const Duration(seconds: 1));
        verify(mockAppConfigViewModel.getAutoRefreshTime).called(4);
        verify(mockStatusViewModel.setRealtimeStatus(any)).called(1);
        verify(mockStatusViewModel.setOvertimeData(any)).called(1);
        verify(mockStatusViewModel.setMetricsInfo(any)).called(1);
        expect(statusUpdateService.isAutoRefreshRunning, true);

        statusUpdateService.stopAutoRefresh();
      },
    );

    test('startAutoRefresh while switching servers', () async {
      when(mockServersViewModel.connectingServer).thenReturn(server);

      statusUpdateService.startAutoRefresh();

      await Future.delayed(const Duration(seconds: 1));
      verify(mockAppConfigViewModel.getAutoRefreshTime).called(4);
      verifyNever(mockStatusViewModel.setRealtimeStatus(any));
      verifyNever(mockStatusViewModel.setOvertimeData(any));
      verifyNever(mockStatusViewModel.setMetricsInfo(any));
      expect(statusUpdateService.isAutoRefreshRunning, true);

      statusUpdateService.stopAutoRefresh();
    });

    test(
      'startAutoRefresh should fail when fetching data from the server fails',
      () async {
        when(
          mockApiGatewayV6.realtimeStatus(clientCount: anyNamed('clientCount')),
        ).thenAnswer(
          (_) async => RealtimeStatusResponse(result: APiResponseType.socket),
        );

        when(mockApiGatewayV6.fetchOverTimeData()).thenAnswer(
          (_) async =>
              FetchOverTimeDataResponse(result: APiResponseType.socket),
        );

        when(mockApiGatewayV6.getMetrics()).thenAnswer(
          (_) async => MetricsResponse(result: APiResponseType.socket),
        );

        when(mockStatusViewModel.getServerStatus).thenReturn(LoadStatus.loaded);
        when(mockStatusViewModel.isServerLoading).thenReturn(false);
        when(
          mockStatusViewModel.getStatusLoading,
        ).thenReturn(LoadStatus.loading);
        when(
          mockStatusViewModel.getOvertimeDataLoadStatus,
        ).thenReturn(LoadStatus.loading);

        statusUpdateService.startAutoRefresh();
        await Future.delayed(const Duration(seconds: 1));
        verify(mockAppConfigViewModel.getAutoRefreshTime).called(4);
        verifyNever(mockStatusViewModel.setRealtimeStatus(any)).called(0);
        verifyNever(mockStatusViewModel.setOvertimeData(any)).called(0);
        verifyNever(mockStatusViewModel.setMetricsInfo(any)).called(0);
        expect(statusUpdateService.isAutoRefreshRunning, true);

        statusUpdateService.stopAutoRefresh();
      },
    );

    test(
      'startAutoRefresh should not raise a type error when selectedServer becomes null during asynchronous processing in _setupStatusDataTimer',
      () async {
        when(
          mockApiGatewayV6.realtimeStatus(clientCount: anyNamed('clientCount')),
        ).thenAnswer((_) async {
          when(mockServersViewModel.selectedServer).thenReturn(null);
          return RealtimeStatusResponse(result: APiResponseType.socket);
        });

        when(mockStatusViewModel.getServerStatus).thenReturn(LoadStatus.loaded);
        when(mockStatusViewModel.isServerLoading).thenReturn(false);
        when(
          mockStatusViewModel.getStatusLoading,
        ).thenReturn(LoadStatus.loading);
        when(
          mockStatusViewModel.getOvertimeDataLoadStatus,
        ).thenReturn(LoadStatus.loading);

        Object? caughtError;

        await runZonedGuarded(
          () async {
            statusUpdateService.startAutoRefresh();
            await Future.delayed(const Duration(seconds: 1));
          },
          (error, stackTrace) {
            caughtError = error;
          },
        );

        // No raised error
        expect(caughtError, isNull);

        statusUpdateService.stopAutoRefresh();
      },
    );

    test(
      'startAutoRefresh should not raise a type error when selectedServer becomes null during asynchronous processing in _setupOverTimeDataTimer',
      () async {
        when(mockApiGatewayV6.fetchOverTimeData()).thenAnswer((_) async {
          when(mockServersViewModel.selectedServer).thenReturn(null);
          return FetchOverTimeDataResponse(result: APiResponseType.socket);
        });

        when(mockStatusViewModel.getServerStatus).thenReturn(LoadStatus.loaded);
        when(mockStatusViewModel.isServerLoading).thenReturn(false);
        when(
          mockStatusViewModel.getStatusLoading,
        ).thenReturn(LoadStatus.loading);
        when(
          mockStatusViewModel.getOvertimeDataLoadStatus,
        ).thenReturn(LoadStatus.loading);

        Object? caughtError;

        await runZonedGuarded(
          () async {
            statusUpdateService.startAutoRefresh();
            await Future.delayed(const Duration(seconds: 1));
          },
          (error, stackTrace) {
            caughtError = error;
          },
        );

        // No raised error
        expect(caughtError, isNull);

        statusUpdateService.stopAutoRefresh();
      },
    );

    test('refreshOnce should succeed', () async {
      await statusUpdateService.refreshOnce();
      verify(
        mockApiGatewayV6.realtimeStatus(clientCount: anyNamed('clientCount')),
      ).called(1);
      verify(mockApiGatewayV6.fetchOverTimeData()).called(1);
      verify(mockServersViewModel.updateselectedServerStatus(any)).called(1);
      verify(mockStatusViewModel.setRealtimeStatus(any)).called(1);
      verify(mockStatusViewModel.setOvertimeData(any)).called(1);
    });

    test(
      'refreshOnce should fail when fetching data from the server fails',
      () async {
        when(
          mockApiGatewayV6.realtimeStatus(clientCount: anyNamed('clientCount')),
        ).thenAnswer(
          (_) async => RealtimeStatusResponse(result: APiResponseType.socket),
        );

        when(mockApiGatewayV6.fetchOverTimeData()).thenAnswer(
          (_) async =>
              FetchOverTimeDataResponse(result: APiResponseType.socket),
        );

        await statusUpdateService.refreshOnce();
        verify(
          mockApiGatewayV6.realtimeStatus(clientCount: anyNamed('clientCount')),
        ).called(1);
        verify(mockApiGatewayV6.fetchOverTimeData()).called(1);
        verifyNever(
          mockServersViewModel.updateselectedServerStatus(any),
        ).called(0);
        verifyNever(mockStatusViewModel.setRealtimeStatus(any)).called(0);
        verifyNever(mockStatusViewModel.setOvertimeData(any)).called(0);
      },
    );

    test('dispose should succeed', () {
      statusUpdateService.stopAutoRefresh();
      expect(statusUpdateService.isAutoRefreshRunning, false);
    });
  });
}
