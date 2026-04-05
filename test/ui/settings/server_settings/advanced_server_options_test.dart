import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/advanced_server_options_screen.dart';

import '../../../../testing/fakes/repositories/api/fake_actions_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_config_repository.dart';
import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Advanced Server Settings Screen tests', () {
    late FakeServersViewModel serversViewModel;
    late FakeActionsRepository fakeActionsRepository;
    late FakeConfigRepository fakeConfigRepository;
    late AppConfigViewModel appConfigViewModel;

    setUp(() {
      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = const Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
          allowUntrustedCert: true,
          ignoreCertificateErrors: false,
        )
        ..selectedServerEnabled = true;

      fakeActionsRepository = FakeActionsRepository();
      fakeConfigRepository = FakeConfigRepository();
    });

    Widget buildWidget() {
      final bundle = createFakeRepositoryBundle(
        actions: fakeActionsRepository,
        config: fakeConfigRepository,
      );
      return buildTestApp(
        const AdvancedServerOptionsScreen(),
        appConfigViewModel: appConfigViewModel,
        serversViewModel: serversViewModel,
        repositoryBundle: bundle,
      );
    }

    testWidgets('should show sessions tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Sessions'), findsOneWidget);
    });

    testWidgets('should show dhcp tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('DHCP'), findsOneWidget);
    });

    testWidgets('should show local dns tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Local DNS'), findsOneWidget);
    });

    testWidgets('should show interface tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Interface'), findsOneWidget);
    });

    testWidgets('should show network tile', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Network'), findsOneWidget);
    });

    testWidgets('should success Disable query logging', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Disable query logging'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Disable'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Query logging has been disabled'), findsOneWidget);
    });

    testWidgets('should success Enable query logging', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeConfigRepository.queryLoggingValue = false;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Enable query logging'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Enable'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Query logging has been enabled'), findsOneWidget);
    });

    testWidgets('should show failback information', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeConfigRepository.shouldFailFetch = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Please try again later.'), findsOneWidget);
    });

    testWidgets('should failed to Disable query logging', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeConfigRepository.shouldFailSet = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Disable query logging'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Disable'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Failed to disable query logging'), findsOneWidget);
    });

    testWidgets('should failed to Enable query logging', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeConfigRepository.queryLoggingValue = false;
      fakeConfigRepository.shouldFailSet = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Enable query logging'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Enable'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Failed to enable query logging'), findsOneWidget);
    });

    testWidgets('should success Restart DNS resolver', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Restart DNS resolver'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Restart'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('DNS server restarted.'), findsOneWidget);
    });

    testWidgets('should failed to Restart DNS resolver', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeActionsRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Restart DNS resolver'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Restart'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Failed to restart DNS server.'), findsOneWidget);
    });

    testWidgets('should success Flush network table', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Flush network table'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Flush'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Network table cleared.'), findsOneWidget);
    });

    testWidgets('should failed Flush network table', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeActionsRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Flush network table'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Flush'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Failed to clear network table.'), findsOneWidget);
    });

    testWidgets('should success Flush logs', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Flush logs (last 24 hours)'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Flush'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Logs flushed successfully.'), findsOneWidget);
    });

    testWidgets('should failed to Flush logs', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeActionsRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildWidget());

      expect(find.byType(AdvancedServerOptionsScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Flush logs (last 24 hours)'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Flush'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Failed to flush logs.'), findsOneWidget);
    });
  });
}
