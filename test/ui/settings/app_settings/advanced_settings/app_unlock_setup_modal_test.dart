import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_options_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/app_lock/create_pass_code_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/app_lock/remove_passcode_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/app_unlock_setup_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/enter_passcode_modal.dart';

import '../../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../../testing/fakes/repositories/local/fake_server_repository.dart';
import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('App unlock Widget Tests', () {
    late AppConfigViewModel appConfigViewModel;
    late ServersViewModel serversViewModel;

    setUp(() async {
      final serverRepo = FakeServerRepository();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      appConfigViewModel.setBiometricsSupport(true);
      serversViewModel = ServersViewModel(serverRepo);
      final servers = await serverRepo.fetchServers();
      await serversViewModel.saveFromDb(servers.getOrThrow());
    });

    testWidgets('should show the app unlock setup modal (passcode not set)', (
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
      expect(find.text('App unlock'), findsOneWidget);

      await tester.tap(find.text('App unlock'));
      await tester.pumpAndSettle();

      expect(find.byType(AppUnlockSetupModal), findsOneWidget);
      expect(find.text('Status: disabled'), findsOneWidget);
      expect(find.text('Setup passcode'), findsOneWidget);
      expect(find.text('Use fingerprint'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);

      await tester.tap(find.text('Close'));
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.byType(AppUnlockSetupModal), findsNothing);
    });

    testWidgets('should show the numpad (passcode set)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await appConfigViewModel.setPassCode('1234');

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

      expect(find.byType(EnterPasscodeModal), findsOneWidget);
      expect(find.text('Enter passcode'), findsOneWidget);
    });

    testWidgets('should show the app unlock setup modal (passcode set)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await appConfigViewModel.setPassCode('1234');

      await tester.pumpWidget(
        buildTestApp(
          const AppUnlockSetupModal(
            topBarHeight: 0.0,
            useBiometrics: false,
            window: false,
          ),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.byType(AppUnlockSetupModal), findsOneWidget);
      expect(find.text('App unlock'), findsOneWidget);
      expect(find.text('Status: enabled'), findsOneWidget);
      expect(find.text('Update passcode'), findsOneWidget);
      expect(find.text('Remove passcode'), findsOneWidget);
      expect(find.text('Use fingerprint'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);
    });

    testWidgets('should setup a passcode', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const AppUnlockSetupModal(
            topBarHeight: 0.0,
            useBiometrics: false,
            window: false,
          ),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.byType(AppUnlockSetupModal), findsOneWidget);
      expect(find.text('Setup passcode'), findsOneWidget);

      await tester.tap(find.text('Setup passcode'));
      await tester.pumpAndSettle();
      expect(find.byType(CreatePassCodeModal), findsOneWidget);
      expect(find.text('Enter passcode'), findsOneWidget);
      await tester.tap(find.text('1'));
      await tester.pump();
      await tester.tap(find.text('2'));
      await tester.pump();
      await tester.tap(find.text('3'));
      await tester.pump();
      await tester.tap(find.text('4'));
      await tester.pump();
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('1'));
      await tester.pump();
      await tester.tap(find.text('2'));
      await tester.pump();
      await tester.tap(find.text('3'));
      await tester.pump();
      await tester.tap(find.text('4'));
      await tester.pump();
      await tester.tap(find.text('Finish'));
      await tester.pumpAndSettle();
      expect(find.text('App unlock'), findsOneWidget);
    });

    testWidgets('should update a passcode', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await appConfigViewModel.setPassCode('1234');

      await tester.pumpWidget(
        buildTestApp(
          const AppUnlockSetupModal(
            topBarHeight: 0.0,
            useBiometrics: false,
            window: false,
          ),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.byType(AppUnlockSetupModal), findsOneWidget);
      expect(find.text('Update passcode'), findsOneWidget);

      await tester.tap(find.text('Update passcode'));
      await tester.pumpAndSettle();
      expect(find.byType(CreatePassCodeModal), findsOneWidget);
      expect(find.text('Enter passcode'), findsOneWidget);
      await tester.tap(find.text('5'));
      await tester.pump();
      await tester.tap(find.text('6'));
      await tester.pump();
      await tester.tap(find.text('7'));
      await tester.pump();
      await tester.tap(find.text('8'));
      await tester.pump();
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('5'));
      await tester.pump();
      await tester.tap(find.text('6'));
      await tester.pump();
      await tester.tap(find.text('7'));
      await tester.pump();
      await tester.tap(find.text('8'));
      await tester.pump();
      await tester.tap(find.text('Finish'));
      await tester.pumpAndSettle();
      expect(find.text('App unlock'), findsOneWidget);
    });

    testWidgets('should remove a passcode', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await appConfigViewModel.setPassCode('1234');

      await tester.pumpWidget(
        buildTestApp(
          const AppUnlockSetupModal(
            topBarHeight: 0.0,
            useBiometrics: false,
            window: false,
          ),
          appConfigViewModel: appConfigViewModel,
        ),
      );

      expect(find.byType(AppUnlockSetupModal), findsOneWidget);

      // Cancel
      expect(find.text('Remove passcode'), findsOneWidget);
      await tester.tap(find.text('Remove passcode'));
      await tester.pumpAndSettle();
      expect(find.byType(RemovePasscodeModal), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Remove
      expect(find.text('Remove passcode'), findsOneWidget);
      await tester.tap(find.text('Remove passcode'));
      await tester.pumpAndSettle();
      expect(find.byType(RemovePasscodeModal), findsOneWidget);
      expect(find.text('Remove'), findsOneWidget);
      await tester.tap(find.text('Remove'));
      await tester.pumpAndSettle();

      expect(find.byType(AppUnlockSetupModal), findsOneWidget);
    });
  });
}
