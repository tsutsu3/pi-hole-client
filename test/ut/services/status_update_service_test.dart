import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/domain/use_cases/status_update_service.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/viewmodel/logs_viewmodel.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/ftl/metrics.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart';
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:result_dart/result_dart.dart';

import '../../../testing/models/v6/dns.dart' as dns_fixture;
import '../../../testing/models/v6/ftl.dart' as ftl_fixture;
import '../../../testing/models/v6/metrics.dart' as metrics_fixture;
import './status_update_service_test.mocks.dart' as ut;

@GenerateMocks([
  AppConfigViewModel,
  ServersViewModel,
  StatusViewModel,
  LogsViewModel,
  MetricsRepository,
  DnsRepository,
  FtlRepository,
])
void main() async {
  // For loading the .env file
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  // Provide dummy values for Result types that Mockito can't auto-generate
  provideDummy<Result<Summary>>(
    Success(metrics_fixture.kRepoFetchStatsSummary),
  );
  provideDummy<Result<List<DestinationStat>>>(
    const Success(metrics_fixture.kRepoFetchStatsUpstreams),
  );
  provideDummy<Result<List<QueryStat>>>(
    const Success(metrics_fixture.kRepoFetchStatsTopDomainsAllowed),
  );
  provideDummy<Result<List<SourceStat>>>(
    const Success(metrics_fixture.kRepoFetchStatsTopClientsAllowed),
  );
  provideDummy<Result<OverTime>>(
    Success(metrics_fixture.kRepoFetchOverTime),
  );
  provideDummy<Result<Blocking>>(
    Success(dns_fixture.kRepoFetchDnsBlocking),
  );
  provideDummy<Result<FtlDnsMetrics>>(
    Success(ftl_fixture.kRepoFetchFtlMetrics),
  );

  group('StatusUpdateService', () {
    late StatusUpdateService statusUpdateService;

    late ut.MockAppConfigViewModel mockAppConfigViewModel;
    late ut.MockServersViewModel mockServersViewModel;
    late ut.MockStatusViewModel mockStatusViewModel;
    late ut.MockLogsViewModel mockLogsViewModel;

    late ut.MockMetricsRepository mockMetricsRepository;
    late ut.MockDnsRepository mockDnsRepository;
    late ut.MockFtlRepository mockFtlRepository;

    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
      ignoreCertificateErrors: false,
    );

    void stubRepositoriesSuccess() {
      // MetricsRepository stubs for RealtimeStatusUseCaseV6
      when(mockMetricsRepository.fetchStatsSummary()).thenAnswer(
        (_) async => Success(metrics_fixture.kRepoFetchStatsSummary),
      );
      when(mockMetricsRepository.fetchStatsUpstreams()).thenAnswer(
        (_) async => const Success(metrics_fixture.kRepoFetchStatsUpstreams),
      );
      when(
        mockMetricsRepository.fetchStatsTopDomainsAllowed(
          count: anyNamed('count'),
        ),
      ).thenAnswer(
        (_) async =>
            const Success(metrics_fixture.kRepoFetchStatsTopDomainsAllowed),
      );
      when(
        mockMetricsRepository.fetchStatsTopDomainsBlocked(
          count: anyNamed('count'),
        ),
      ).thenAnswer(
        (_) async =>
            const Success(metrics_fixture.kRepoFetchStatsTopDomainsBlocked),
      );
      when(
        mockMetricsRepository.fetchStatsTopClientsAllowed(
          count: anyNamed('count'),
        ),
      ).thenAnswer(
        (_) async =>
            const Success(metrics_fixture.kRepoFetchStatsTopClientsAllowed),
      );
      when(
        mockMetricsRepository.fetchStatsTopClientsBlocked(
          count: anyNamed('count'),
        ),
      ).thenAnswer(
        (_) async =>
            const Success(metrics_fixture.kRepoFetchStatsTopClientsBlocked),
      );

      // MetricsRepository stub for fetchOverTime
      when(
        mockMetricsRepository.fetchOverTime(count: anyNamed('count')),
      ).thenAnswer(
        (_) async => Success(metrics_fixture.kRepoFetchOverTime),
      );

      // DnsRepository stub for fetchBlockingStatus
      when(mockDnsRepository.fetchBlockingStatus()).thenAnswer(
        (_) async => Success(dns_fixture.kRepoFetchDnsBlocking),
      );

      // FtlRepository stub for fetchInfoMetrics
      when(mockFtlRepository.fetchInfoMetrics()).thenAnswer(
        (_) async => Success(ftl_fixture.kRepoFetchFtlMetrics),
      );
    }

    void stubRepositoriesFailure() {
      final error = Exception('Network error');

      when(mockMetricsRepository.fetchStatsSummary()).thenAnswer(
        (_) async => Failure(error),
      );
      when(mockMetricsRepository.fetchStatsUpstreams()).thenAnswer(
        (_) async => Failure(error),
      );
      when(
        mockMetricsRepository.fetchStatsTopDomainsAllowed(
          count: anyNamed('count'),
        ),
      ).thenAnswer((_) async => Failure(error));
      when(
        mockMetricsRepository.fetchStatsTopDomainsBlocked(
          count: anyNamed('count'),
        ),
      ).thenAnswer((_) async => Failure(error));
      when(
        mockMetricsRepository.fetchStatsTopClientsAllowed(
          count: anyNamed('count'),
        ),
      ).thenAnswer((_) async => Failure(error));
      when(
        mockMetricsRepository.fetchStatsTopClientsBlocked(
          count: anyNamed('count'),
        ),
      ).thenAnswer((_) async => Failure(error));
      when(
        mockMetricsRepository.fetchOverTime(count: anyNamed('count')),
      ).thenAnswer((_) async => Failure(error));
      when(mockDnsRepository.fetchBlockingStatus()).thenAnswer(
        (_) async => Failure(error),
      );
      when(mockFtlRepository.fetchInfoMetrics()).thenAnswer(
        (_) async => Failure(error),
      );
    }

    setUp(() {
      mockAppConfigViewModel = ut.MockAppConfigViewModel();
      mockServersViewModel = ut.MockServersViewModel();
      mockStatusViewModel = ut.MockStatusViewModel();
      mockLogsViewModel = ut.MockLogsViewModel();
      mockMetricsRepository = ut.MockMetricsRepository();
      mockDnsRepository = ut.MockDnsRepository();
      mockFtlRepository = ut.MockFtlRepository();

      when(mockAppConfigViewModel.getAutoRefreshTime).thenReturn(5);

      when(mockServersViewModel.selectedServer).thenReturn(server);
      when(
        mockServersViewModel.updateselectedServerStatus(any),
      ).thenReturn(null);
      when(mockServersViewModel.connectingServer).thenReturn(null);

      when(mockStatusViewModel.setServerStatus(any)).thenReturn(null);
      when(mockStatusViewModel.setRealtimeStatus(any)).thenReturn(null);
      when(mockStatusViewModel.setStatusLoading(any)).thenReturn(null);
      when(mockStatusViewModel.setOvertimeData(any)).thenReturn(null);
      when(mockStatusViewModel.setFtlDnsMetrics(any)).thenReturn(null);
      when(
        mockStatusViewModel.setOvertimeDataLoadingStatus(any),
      ).thenReturn(null);
      when(mockStatusViewModel.isServerLoading).thenReturn(true);
      when(mockStatusViewModel.getServerStatus).thenReturn(LoadStatus.loading);

      when(mockLogsViewModel.setClients(any)).thenReturn(null);

      stubRepositoriesSuccess();

      statusUpdateService = StatusUpdateService(
        serversViewModel: mockServersViewModel,
        statusViewModel: mockStatusViewModel,
        appConfigViewModel: mockAppConfigViewModel,
        logsViewModel: mockLogsViewModel,
      );

      statusUpdateService.update(
        metricsRepository: mockMetricsRepository,
        dnsRepository: mockDnsRepository,
        ftlRepository: mockFtlRepository,
        apiVersion: 'v6',
      );
    });

    test(
      'startAutoRefresh starts refreshing automatically on first run',
      () async {
        when(mockAppConfigViewModel.getAutoRefreshTime).thenReturn(5);

        statusUpdateService.startAutoRefresh();

        // sleep for 1 second to allow the timer to run
        await Future.delayed(const Duration(seconds: 1));
        verify(mockAppConfigViewModel.getAutoRefreshTime).called(4);
        verify(mockStatusViewModel.setRealtimeStatus(any)).called(1);
        verify(mockStatusViewModel.setOvertimeData(any)).called(1);
        verify(mockStatusViewModel.setFtlDnsMetrics(any)).called(1);
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
        verify(mockStatusViewModel.setFtlDnsMetrics(any)).called(1);
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
      verifyNever(mockStatusViewModel.setFtlDnsMetrics(any));
      expect(statusUpdateService.isAutoRefreshRunning, true);

      statusUpdateService.stopAutoRefresh();
    });

    test(
      'startAutoRefresh should fail when fetching data from the server fails',
      () async {
        stubRepositoriesFailure();

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
        verifyNever(mockStatusViewModel.setRealtimeStatus(any));
        verifyNever(mockStatusViewModel.setOvertimeData(any));
        verifyNever(mockStatusViewModel.setFtlDnsMetrics(any));
        expect(statusUpdateService.isAutoRefreshRunning, true);

        statusUpdateService.stopAutoRefresh();
      },
    );

    test(
      'startAutoRefresh should not raise a type error when selectedServer becomes null during asynchronous processing in _setupStatusDataTimer',
      () async {
        when(mockMetricsRepository.fetchStatsSummary()).thenAnswer((_) async {
          when(mockServersViewModel.selectedServer).thenReturn(null);
          return Failure(Exception('Network error'));
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
        when(
          mockMetricsRepository.fetchOverTime(count: anyNamed('count')),
        ).thenAnswer((_) async {
          when(mockServersViewModel.selectedServer).thenReturn(null);
          return Failure(Exception('Network error'));
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
      verify(mockStatusViewModel.setRealtimeStatus(any)).called(1);
      verify(mockStatusViewModel.setOvertimeData(any)).called(1);
      verify(mockStatusViewModel.setFtlDnsMetrics(any)).called(1);
      verify(mockServersViewModel.updateselectedServerStatus(any)).called(1);
      verify(mockStatusViewModel.setServerStatus(LoadStatus.loaded)).called(1);
    });

    test(
      'refreshOnce should fail when fetching data from the server fails',
      () async {
        stubRepositoriesFailure();

        await statusUpdateService.refreshOnce();
        verifyNever(mockStatusViewModel.setRealtimeStatus(any));
        verifyNever(mockStatusViewModel.setOvertimeData(any));
        verifyNever(mockStatusViewModel.setFtlDnsMetrics(any));
        verify(mockStatusViewModel.setServerStatus(LoadStatus.error)).called(1);
      },
    );

    test('dispose should succeed', () {
      statusUpdateService.stopAutoRefresh();
      expect(statusUpdateService.isAutoRefreshRunning, false);
    });
  });
}
