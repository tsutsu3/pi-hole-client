import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/pi_hole_v6_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_options.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/auto_refresh_time_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/logs_quantity_load_screen.dart';

import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/fakes/repositories/local/fake_server_repository.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Advanced Options Screen tests', () {
    late AppConfigViewModel appConfigViewModel;
    late ServersViewModel serversViewModel;

    setUp(() async {
      final serverRepo = FakeServerRepository();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      serversViewModel = ServersViewModel(serverRepo);
      final servers = await serverRepo.fetchServers();
      await serversViewModel.saveFromDb(servers.getOrThrow());
    });

    testWidgets('should close reset screen', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          Phoenix(child: const AdvancedOptions()),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);

      // Tap Reset application
      await tester.scrollUntilVisible(find.text('Reset application'), 100);
      await tester.tap(find.text('Reset application'));
      await tester.pumpAndSettle();

      // Tap Erase all button
      expect(find.text('Erase app data'), findsNWidgets(2));
      await tester.pumpAndSettle(const Duration(seconds: 6));
      await tester.tap(find.text('ERASE ALL').last);

      // Auto close dialog
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Erase app data'), findsNothing);
    });

    testWidgets('should open EnterPasscodeModal', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      await appConfigViewModel.setPassCode('1111');

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const AdvancedOptions(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);

      // Tap App unlock
      await tester.tap(find.text('App unlock'));
      await tester.pumpAndSettle();

      // Show Enter passcode screen
      expect(find.text('Enter passcode'), findsOneWidget);
    });

    testWidgets('should show Stats refresh interval screen with tap', (
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
          const AdvancedOptions(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Stats refresh interval'));
      await tester.pumpAndSettle();
      expect(find.byType(AutoRefreshTimeScreen), findsOneWidget);
    });

    testWidgets('should show Logs quantity screen with tap', (
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
          const AdvancedOptions(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Logs quantity per request'));
      await tester.pumpAndSettle();
      expect(find.byType(LogsQuantityLoadScreen), findsOneWidget);
      expect(find.byType(PiHoleV6NotSupportedScreen), findsOneWidget);
    });
  });

  group('Advanced Options Screen tests (v5)', () {
    late AppConfigViewModel appConfigViewModel;
    late ServersViewModel serversViewModel;

    setUp(() async {
      final serverRepo = FakeServerRepository();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      serversViewModel = ServersViewModel(serverRepo);
      // Load servers with v5 as default
      final servers = await serverRepo.fetchServers();
      final serverList = servers.getOrThrow();
      // Set the v5 server as selected by using saveFromDb with only v5
      await serversViewModel.saveFromDb(
        serverList.map((s) {
          if (s.apiVersion == 'v5') {
            return s.copyWith(defaultServer: true);
          }
          return s.copyWith(defaultServer: false);
        }).toList(),
      );
    });

    testWidgets('should show Logs quantity screen with tap', (
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
          const AdvancedOptions(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
        ),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Logs quantity per request'));
      await tester.pumpAndSettle();
      expect(find.byType(LogsQuantityLoadScreen), findsOneWidget);
      expect(find.byType(PiHoleV6NotSupportedScreen), findsNothing);
    });
  });
}
