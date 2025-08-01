import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/models/gateways.dart';
import 'package:pi_hole_client/domain/models/metrics.dart';
import 'package:pi_hole_client/domain/models/server.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';

import '../../widgets/helpers.dart' show metrics, overtimeData, realtimeStatus;
import './status_update_service_test.mocks.dart' as ut;

@GenerateMocks([
  AppConfigProvider,
  ServersProvider,
  StatusProvider,
  FiltersProvider,
  ApiGatewayV6,
])
void main() async {
  // For loading the .env file
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('ServersProvider', () {
    late StatusUpdateService statusUpdateService;

    late ut.MockAppConfigProvider mockAppConfigProvider;
    late ut.MockServersProvider mockServersProvider;
    late ut.MockStatusProvider mockStatusProvider;
    late ut.MockFiltersProvider mockFiltersProvider;

    late ut.MockApiGatewayV6 mockApiGatewayV6;

    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
    );

    setUp(() {
      mockAppConfigProvider = ut.MockAppConfigProvider();
      mockServersProvider = ut.MockServersProvider();
      mockStatusProvider = ut.MockStatusProvider();
      mockFiltersProvider = ut.MockFiltersProvider();
      mockApiGatewayV6 = ut.MockApiGatewayV6();

      when(mockAppConfigProvider.getAutoRefreshTime).thenReturn(5);

      when(mockServersProvider.selectedServer).thenReturn(server);
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      when(mockServersProvider.updateselectedServerStatus(any))
          .thenReturn(null);
      when(mockServersProvider.connectingServer).thenReturn(null);

      when(mockStatusProvider.setServerStatus(any)).thenReturn(null);
      when(mockStatusProvider.setRealtimeStatus(any)).thenReturn(null);
      when(mockStatusProvider.setStatusLoading(any)).thenReturn(null);
      when(mockStatusProvider.setOvertimeData(any)).thenReturn(null);
      when(mockStatusProvider.setMetricsInfo(any)).thenReturn(null);
      when(mockStatusProvider.setOvertimeDataLoadingStatus(any))
          .thenReturn(null);
      when(mockStatusProvider.isServerLoading).thenReturn(true);
      when(mockStatusProvider.getServerStatus).thenReturn(LoadStatus.loading);

      when(mockFiltersProvider.setClients(any)).thenReturn(null);

      when(
        mockApiGatewayV6.realtimeStatus(
          clientCount: anyNamed('clientCount'),
        ),
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
        serversProvider: mockServersProvider,
        statusProvider: mockStatusProvider,
        appConfigProvider: mockAppConfigProvider,
        filtersProvider: mockFiltersProvider,
      );
    });

    test('startAutoRefresh starts refreshing automatically on first run',
        () async {
      when(mockAppConfigProvider.getAutoRefreshTime).thenReturn(5);

      statusUpdateService.startAutoRefresh();

      // sleep for 2 seconds to allow the timer to run
      await Future.delayed(const Duration(seconds: 1));
      verify(mockAppConfigProvider.getAutoRefreshTime).called(4);
      verify(mockStatusProvider.setRealtimeStatus(any)).called(1);
      verify(mockStatusProvider.setOvertimeData(any)).called(1);
      verify(mockStatusProvider.setMetricsInfo(any)).called(1);
      expect(statusUpdateService.isAutoRefreshRunning, true);

      statusUpdateService.stopAutoRefresh();
    });

    test(
        'startAutoRefresh does not start refreshing automatically on second run',
        () async {
      when(mockAppConfigProvider.getAutoRefreshTime).thenReturn(5);

      statusUpdateService.startAutoRefresh();
      statusUpdateService.startAutoRefresh();
      await Future.delayed(const Duration(seconds: 1));
      verify(mockAppConfigProvider.getAutoRefreshTime).called(4);
      verify(mockStatusProvider.setRealtimeStatus(any)).called(1);
      verify(mockStatusProvider.setOvertimeData(any)).called(1);
      verify(mockStatusProvider.setMetricsInfo(any)).called(1);
      expect(statusUpdateService.isAutoRefreshRunning, true);

      statusUpdateService.stopAutoRefresh();
    });

    test('startAutoRefresh while switching servers', () async {
      when(mockServersProvider.connectingServer).thenReturn(server);

      statusUpdateService.startAutoRefresh();

      await Future.delayed(const Duration(seconds: 1));
      verify(mockAppConfigProvider.getAutoRefreshTime).called(4);
      verifyNever(mockStatusProvider.setRealtimeStatus(any));
      verifyNever(mockStatusProvider.setOvertimeData(any));
      verifyNever(mockStatusProvider.setMetricsInfo(any));
      expect(statusUpdateService.isAutoRefreshRunning, true);

      statusUpdateService.stopAutoRefresh();
    });

    test(
        'startAutoRefresh should fail when fetching data from the server fails',
        () async {
      when(
        mockApiGatewayV6.realtimeStatus(
          clientCount: anyNamed('clientCount'),
        ),
      ).thenAnswer(
        (_) async => RealtimeStatusResponse(
          result: APiResponseType.socket,
        ),
      );

      when(mockApiGatewayV6.fetchOverTimeData()).thenAnswer(
        (_) async => FetchOverTimeDataResponse(
          result: APiResponseType.socket,
        ),
      );

      when(mockApiGatewayV6.getMetrics()).thenAnswer(
        (_) async => MetricsResponse(
          result: APiResponseType.socket,
        ),
      );

      when(mockStatusProvider.getServerStatus).thenReturn(LoadStatus.loaded);
      when(mockStatusProvider.isServerLoading).thenReturn(false);
      when(mockStatusProvider.getStatusLoading).thenReturn(LoadStatus.loading);
      when(mockStatusProvider.getOvertimeDataLoadStatus)
          .thenReturn(LoadStatus.loading);

      statusUpdateService.startAutoRefresh();
      await Future.delayed(const Duration(seconds: 1));
      verify(mockAppConfigProvider.getAutoRefreshTime).called(4);
      verifyNever(mockStatusProvider.setRealtimeStatus(any)).called(0);
      verifyNever(mockStatusProvider.setOvertimeData(any)).called(0);
      verifyNever(mockStatusProvider.setMetricsInfo(any)).called(0);
      expect(statusUpdateService.isAutoRefreshRunning, true);

      statusUpdateService.stopAutoRefresh();
    });

    test(
        'startAutoRefresh should not raise a type error when selectedServer becomes null during asynchronous processing in _setupStatusDataTimer',
        () async {
      when(
        mockApiGatewayV6.realtimeStatus(
          clientCount: anyNamed('clientCount'),
        ),
      ).thenAnswer((_) async {
        when(mockServersProvider.selectedServer).thenReturn(null);
        return RealtimeStatusResponse(
          result: APiResponseType.socket,
        );
      });

      when(mockStatusProvider.getServerStatus).thenReturn(LoadStatus.loaded);
      when(mockStatusProvider.isServerLoading).thenReturn(false);
      when(mockStatusProvider.getStatusLoading).thenReturn(LoadStatus.loading);
      when(mockStatusProvider.getOvertimeDataLoadStatus)
          .thenReturn(LoadStatus.loading);

      Object? caughtError;

      await runZonedGuarded(() async {
        statusUpdateService.startAutoRefresh();
        await Future.delayed(const Duration(seconds: 1));
      }, (error, stackTrace) {
        caughtError = error;
      });

      // No raised error
      expect(caughtError, isNull);

      statusUpdateService.stopAutoRefresh();
    });

    test(
        'startAutoRefresh should not raise a type error when selectedServer becomes null during asynchronous processing in _setupOverTimeDataTimer',
        () async {
      when(mockApiGatewayV6.fetchOverTimeData()).thenAnswer((_) async {
        when(mockServersProvider.selectedServer).thenReturn(null);
        return FetchOverTimeDataResponse(
          result: APiResponseType.socket,
        );
      });

      when(mockStatusProvider.getServerStatus).thenReturn(LoadStatus.loaded);
      when(mockStatusProvider.isServerLoading).thenReturn(false);
      when(mockStatusProvider.getStatusLoading).thenReturn(LoadStatus.loading);
      when(mockStatusProvider.getOvertimeDataLoadStatus)
          .thenReturn(LoadStatus.loading);

      Object? caughtError;

      await runZonedGuarded(() async {
        statusUpdateService.startAutoRefresh();
        await Future.delayed(const Duration(seconds: 1));
      }, (error, stackTrace) {
        caughtError = error;
      });

      // No raised error
      expect(caughtError, isNull);

      statusUpdateService.stopAutoRefresh();
    });

    test('refreshOnce should succeed', () async {
      await statusUpdateService.refreshOnce();
      verify(
        mockApiGatewayV6.realtimeStatus(
          clientCount: anyNamed('clientCount'),
        ),
      ).called(1);
      verify(mockApiGatewayV6.fetchOverTimeData()).called(1);
      verify(mockServersProvider.updateselectedServerStatus(any)).called(1);
      verify(mockStatusProvider.setRealtimeStatus(any)).called(1);
      verify(mockStatusProvider.setOvertimeData(any)).called(1);
    });

    test('refreshOnce should fail when fetching data from the server fails',
        () async {
      when(
        mockApiGatewayV6.realtimeStatus(
          clientCount: anyNamed('clientCount'),
        ),
      ).thenAnswer(
        (_) async => RealtimeStatusResponse(
          result: APiResponseType.socket,
        ),
      );

      when(mockApiGatewayV6.fetchOverTimeData()).thenAnswer(
        (_) async => FetchOverTimeDataResponse(
          result: APiResponseType.socket,
        ),
      );

      await statusUpdateService.refreshOnce();
      verify(
        mockApiGatewayV6.realtimeStatus(
          clientCount: anyNamed('clientCount'),
        ),
      ).called(1);
      verify(mockApiGatewayV6.fetchOverTimeData()).called(1);
      verifyNever(mockServersProvider.updateselectedServerStatus(any))
          .called(0);
      verifyNever(mockStatusProvider.setRealtimeStatus(any)).called(0);
      verifyNever(mockStatusProvider.setOvertimeData(any)).called(0);
    });

    test('dispose should succeed', () {
      statusUpdateService.stopAutoRefresh();
      expect(statusUpdateService.isAutoRefreshRunning, false);
    });
  });
}
