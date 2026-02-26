import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/app_logs/app_logs_screen.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_options_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/app_unlock_setup_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/chart_visualization_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/reset_screen.dart';

import '../../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../../testing/fakes/repositories/local/fake_server_repository.dart';
import '../../../../../testing/test_app.dart';

GoRouter _createTestRouter() {
  return GoRouter(
    initialLocation: '/settings/app/advanced',
    routes: [
      GoRoute(
        path: '/settings/app/advanced',
        name: Routes.settingsAppAdvanced,
        builder: (_, _) => const AdvancedOptionsScreen(),
      ),
      GoRoute(
        path: '/settings/app/advanced/chart-visualization',
        name: Routes.settingsAppAdvancedChartVisualization,
        builder: (_, _) => const ChartVisualizationScreen(),
      ),
      GoRoute(
        path: '/settings/app/advanced/app-logs',
        name: Routes.settingsAppAdvancedAppLogs,
        builder: (_, _) => const AppLogsScreen(),
      ),
    ],
  );
}

void main() async {
  await initTestApp();

  group('Advanced Options Screen Widget Tests', () {
    late AppConfigViewModel appConfigViewModel;
    late ServersViewModel serversViewModel;

    setUp(() async {
      final serverRepo = FakeServerRepository();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      serversViewModel = ServersViewModel(serverRepo);
      final servers = await serverRepo.fetchServers();
      await serversViewModel.saveFromDb(servers.getOrThrow());
    });

    testWidgets('should show advanced options screen', (
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
          const AdvancedOptionsScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptionsScreen), findsOneWidget);
      expect(find.text('Advanced settings'), findsOneWidget);
      expect(find.text('App unlock'), findsOneWidget);

      expect(find.text('Charts'), findsOneWidget);
      expect(find.text('Use reduced data'), findsOneWidget);
      expect(find.text('Hide zero values'), findsOneWidget);
      expect(find.text('Show loading animation'), findsOneWidget);
      expect(find.text('Chart display mode'), findsOneWidget);

      await tester.scrollUntilVisible(find.text('Reset application'), 100);

      expect(find.text('Others'), findsOneWidget);
      expect(find.text('App logs'), findsOneWidget);
      expect(find.text('Reset application'), findsOneWidget);
    });

    testWidgets('should show App Unlock screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const AdvancedOptionsScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptionsScreen), findsOneWidget);
      expect(find.text('App unlock'), findsOneWidget);
      await tester.tap(find.text('App unlock'));
      await tester.pumpAndSettle();
      expect(find.byType(AppUnlockSetupModal), findsOneWidget);
      expect(find.text('Status: disabled'), findsOneWidget);
    });

    testWidgets('should change reduse data setting', (
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
          const AdvancedOptionsScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptionsScreen), findsOneWidget);
      expect(find.text('Use reduced data'), findsOneWidget);
      await tester.tap(find.text('Use reduced data'));
      await tester.pumpAndSettle();
      expect(find.text('Settings updated successfully.'), findsOneWidget);
    });

    testWidgets('should change hide zero values setting', (
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
          const AdvancedOptionsScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptionsScreen), findsOneWidget);
      expect(find.text('Hide zero values'), findsOneWidget);
      await tester.tap(find.text('Hide zero values'));
      await tester.pumpAndSettle();
      expect(find.text('Settings updated successfully.'), findsOneWidget);
    });

    testWidgets('should show loading animation setting', (
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
          const AdvancedOptionsScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptionsScreen), findsOneWidget);
      expect(find.text('Show loading animation'), findsOneWidget);
      await tester.tap(find.text('Show loading animation'));
      await tester.pumpAndSettle();
      expect(find.text('Settings updated successfully.'), findsOneWidget);
    });

    testWidgets('should show Statistics display mode screen', (
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
          const SizedBox(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          router: _createTestRouter(),
        ),
      );

      expect(find.byType(AdvancedOptionsScreen), findsOneWidget);
      expect(find.text('Chart display mode'), findsOneWidget);
      await tester.tap(find.text('Chart display mode'));
      await tester.pumpAndSettle();
      expect(find.byType(ChartVisualizationScreen), findsOneWidget);
      expect(find.text('Chart display mode'), findsOneWidget);
      expect(find.text('Home Screen'), findsOneWidget);
      expect(find.text('Statistics Screen'), findsOneWidget);
    });

    testWidgets('should show App Logs screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const SizedBox(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          router: _createTestRouter(),
        ),
      );

      await tester.scrollUntilVisible(find.text('App logs'), 100);

      expect(find.byType(AdvancedOptionsScreen), findsOneWidget);
      expect(find.text('App logs'), findsOneWidget);
      await tester.tap(find.text('App logs'));
      await tester.pumpAndSettle();
      expect(find.byType(AppLogsScreen), findsOneWidget);
      expect(find.text('Logs'), findsOneWidget);
    });

    testWidgets('should show Reset Application screen', (
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
          const AdvancedOptionsScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptionsScreen), findsOneWidget);
      await tester.scrollUntilVisible(find.text('Reset application'), 100);

      expect(find.text('Reset application'), findsOneWidget);
      await tester.tap(find.text('Reset application'));
      await tester.pumpAndSettle();
      expect(find.byType(ResetScreen), findsOneWidget);
      expect(find.text('Erase app data'), findsNWidgets(2));
    });
  });
}
