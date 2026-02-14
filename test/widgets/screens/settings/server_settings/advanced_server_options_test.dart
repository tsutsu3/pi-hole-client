import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_server_options.dart';
import '../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Advanced Server Settings Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    // Sessions navigation now uses go_router (context.pushNamed).
    // Full navigation is tested in session_screen_test.dart.
    testWidgets('should show sessions tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
      await tester.pump();

      expect(find.text('Sessions'), findsOneWidget);
    });

    // DHCP navigation now uses go_router (context.pushNamed).
    // Full navigation is tested in dhcp_screen_test.dart.
    testWidgets('should show dhcp tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
      await tester.pump();

      expect(find.text('DHCP'), findsOneWidget);
    });

    // Local DNS navigation now uses go_router (context.pushNamed).
    // Full navigation is tested in local_dns_screen_test.dart.
    testWidgets('should show local dns tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
      await tester.pump();

      expect(find.text('Local DNS'), findsOneWidget);
    });

    // Interface navigation now uses go_router (context.pushNamed).
    // Full navigation is tested in interface_screen_test.dart.
    testWidgets('should show interface tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
      await tester.pump();

      expect(find.text('Interface'), findsOneWidget);
    });

    // Network navigation now uses go_router (context.pushNamed).
    // Full navigation is tested in network_screen_test.dart.
    testWidgets('should show network tile', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      testSetup.fakeConfigRepository.queryLoggingValue = false;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      testSetup.fakeConfigRepository.shouldFailFetch = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
      await tester.pump();

      expect(find.text('Please try again later.'), findsOneWidget);
    });

    testWidgets('should failed to Disable query logging', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      testSetup.fakeConfigRepository.shouldFailSet = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      testSetup.fakeConfigRepository.queryLoggingValue = false;
      testSetup.fakeConfigRepository.shouldFailSet = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      testSetup.fakeActionsRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      testSetup.fakeActionsRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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

      testSetup.fakeActionsRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedServerOptions()),
      );

      expect(find.byType(AdvancedServerOptions), findsOneWidget);
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
