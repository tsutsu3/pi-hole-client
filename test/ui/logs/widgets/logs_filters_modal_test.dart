import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/viewmodel/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/clients_filters_modal.dart';
import 'package:pi_hole_client/ui/logs/widgets/logs_filters_modal.dart';
import 'package:pi_hole_client/ui/logs/widgets/status_filters_modal.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/fakes/repositories/local/fake_server_repository.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Query logs filter modal tests', () {
    late AppConfigViewModel appConfigViewModel;
    late ServersViewModel serversViewModel;
    late LogsViewModel logsViewModel;

    setUp(() async {
      final serverRepo = FakeServerRepository();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      serversViewModel = ServersViewModel(serverRepo);
      final servers = await serverRepo.fetchServers();
      await serversViewModel.saveFromDb(servers.getOrThrow());
      logsViewModel = LogsViewModel();
      logsViewModel.setClients(['localhost', '192.168.100.2']);
    });

    testWidgets('should show logs filter modal', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LogsFiltersModal(
            statusBarHeight: 24.0,
            bottomNavBarHeight: 48.0,
            filterLogs: () {},
            window: true,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(LogsFiltersModal), findsOneWidget);
    });

    testWidgets('should show date and time picker', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LogsFiltersModal(
            statusBarHeight: 24.0,
            bottomNavBarHeight: 48.0,
            filterLogs: () {},
            window: true,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(LogsFiltersModal), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('From time'), findsOneWidget);
      expect(find.text('To time'), findsOneWidget);
      expect(find.text('Not selected'), findsNWidgets(2));
      await tester.tap(find.text('From time'));
      await tester.pumpAndSettle();

      expect(find.text('Select date'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(find.text('Select start time'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
      await tester.tap(find.text('OK'));
      // Real LogsViewModel updates startTime via setStartTime() called by the modal
      await tester.pumpAndSettle();

      expect(find.text('Not selected'), findsOneWidget);
    });

    testWidgets('should show advanced filter modal', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LogsFiltersModal(
            statusBarHeight: 24.0,
            bottomNavBarHeight: 48.0,
            filterLogs: () {},
            window: true,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(LogsFiltersModal), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Advanced status filtering'), findsOneWidget);
      await tester.tap(find.text('Advanced status filtering'));
      await tester.pumpAndSettle();

      expect(find.byType(StatusFiltersModal), findsOneWidget);
      await tester.tap(find.text('Apply').last);
      await tester.pumpAndSettle();

      expect(find.byType(StatusFiltersModal), findsNothing);
    });

    testWidgets('should show clients filter modal', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LogsFiltersModal(
            statusBarHeight: 24.0,
            bottomNavBarHeight: 48.0,
            filterLogs: () {},
            window: true,
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          logsViewModel: logsViewModel,
        ),
      );

      expect(find.byType(LogsFiltersModal), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Clients'), findsOneWidget);
      await tester.tap(find.text('Clients'));
      await tester.pumpAndSettle();

      expect(find.byType(ClientsFiltersModal), findsOneWidget);
      await tester.tap(find.text('Apply').last);
      await tester.pumpAndSettle();

      expect(find.byType(ClientsFiltersModal), findsNothing);
    });
  });
}
