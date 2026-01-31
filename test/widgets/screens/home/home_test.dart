import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/home/home.dart';
import 'package:pi_hole_client/ui/home/widgets/disable_modal.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar/switch_server_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/subscriptions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group('Home Screen Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();

      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should home screen be rendered (all graphs are rendered)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

      expect(find.byType(Home), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Home App Bar
      expect(find.byIcon(Icons.gpp_good_rounded), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      expect(find.text('test v6'), findsWidgets);
      expect(find.text('http://localhost:8081'), findsWidgets);

      // titles
      expect(find.text('Total queries'), findsOneWidget);
      expect(find.text('Queries blocked'), findsOneWidget);
      expect(find.text('Percentage blocked'), findsOneWidget);
      expect(find.text('Domains on Adlists'), findsOneWidget);

      //queries graph
      expect(find.text('Total queries last 24 hours'), findsOneWidget);

      // clients graph
      expect(find.text('Client activity last 24 hours'), findsOneWidget);
    });

    testWidgets('should home screen be rendered (loading state)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      when(
        testSetup.mockStatusProvider.getStatusLoading,
      ).thenReturn(LoadStatus.loading);

      await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

      expect(find.byType(Home), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 500));

      final shimmerText = find.descendant(
        of: find.byType(Skeletonizer),
        matching: find.byType(Text),
      );

      expect(shimmerText, findsNothing);
    });

    testWidgets('should home screen be rendered (loading error state)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      when(
        testSetup.mockStatusProvider.getStatusLoading,
      ).thenAnswer((_) => LoadStatus.error);

      await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

      expect(find.byType(Home), findsOneWidget);
      await tester.pump();

      expect(find.text('Error'), findsNWidgets(4));
    });

    testWidgets(
      'should show disable modal and snackbar when disable button is pressed',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

        expect(find.byType(Home), findsOneWidget);
        await tester.pump();
        expect(find.byType(FloatingActionButton), findsOneWidget);

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byType(DisableModal), findsOneWidget);
        await tester.tap(find.text('30 seconds').last);
        await tester.pump();
        await tester.tap(find.text('Accept').last);
        await tester.pump();
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Server disabled successfully.'), findsOneWidget);
      },
    );

    testWidgets('should show enabled snackbar when enable button is pressed', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      final serverV6 = Server(
        address: 'http://localhost:8081',
        alias: 'test v6',
        defaultServer: false,
        apiVersion: 'v6',
        enabled: false,
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
      );
      when(testSetup.mockServersProvider.selectedServer).thenReturn(serverV6);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

      expect(find.byType(Home), findsOneWidget);
      await tester.pump();
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(DisableModal), findsNothing);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Server enabled successfully.'), findsOneWidget);
    });

    testWidgets('should show switch server modal', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

      expect(find.byType(Home), findsOneWidget);
      expect(find.byType(HomeAppBar), findsOneWidget);
      await tester.pump();

      // show switch server modal
      expect(find.text('test v6'), findsWidgets);
      await tester.tap(find.text('test v6').last);
      await tester.pumpAndSettle();
      expect(find.byType(SwitchServerModal), findsOneWidget);
      await tester.pump();

      // tap and swith server
      await tester.tap(find.text('test v6').last);
    });

    testWidgets('should show popup menu', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

      expect(find.byType(Home), findsOneWidget);
      expect(find.byType(HomeAppBar), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      expect(find.text('Refresh'), findsOneWidget);
      expect(find.text('Open web panel'), findsOneWidget);
      expect(find.text('Change server'), findsOneWidget);
    });

    testWidgets(
      'should shows "Connect" and "Change server" options when server is not connected',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(
          testSetup.mockStatusProvider.getServerStatus,
        ).thenReturn(LoadStatus.loading);
        when(testSetup.mockStatusProvider.isServerLoading).thenReturn(true);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

        expect(find.byType(Home), findsOneWidget);
        expect(find.byType(HomeAppBar), findsOneWidget);
        expect(find.byIcon(Icons.more_vert), findsOneWidget);
        await tester.pump();

        await tester.tap(find.byIcon(Icons.more_vert));
        await tester.pump();
        expect(find.text('Try reconnect'), findsOneWidget);
        expect(find.text('Change server'), findsOneWidget);
      },
    );

    testWidgets('should show refresh server', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

      expect(find.byType(Home), findsOneWidget);
      expect(find.byType(HomeAppBar), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      expect(find.text('Refresh'), findsOneWidget);
      expect(find.text('Open web panel'), findsOneWidget);
      expect(find.text('Change server'), findsOneWidget);

      await tester.tap(find.text('Refresh'));
    });

    testWidgets('should show servers page', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

      expect(find.byType(Home), findsOneWidget);
      expect(find.byType(HomeAppBar), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      expect(find.text('Refresh'), findsOneWidget);
      expect(find.text('Open web panel'), findsOneWidget);
      expect(find.text('Change server'), findsOneWidget);

      await tester.tap(find.text('Change server'));
      await tester.pumpAndSettle();
      expect(find.text('Servers'), findsOneWidget);
    });

    testWidgets(
      'should show network page when tapping on "Total queries" tile',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

        expect(find.byType(Home), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Total queries'));
        await tester.pumpAndSettle();
        expect(find.byType(NetworkScreen), findsOneWidget);
      },
    );

    testWidgets(
      'should show logs page with filter when tapping on "Queries blocked" tile',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

        expect(find.byType(Home), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Queries blocked'));
        // await tester.pumpAndSettle();
        // expect(find.byType(Logs), findsOneWidget);
        // expect(find.text('9 status selected'), findsOneWidget);
        verify(
          testSetup.mockFiltersProvider.setRequestStatus(RequestStatus.blocked),
        ).called(1);
        verify(testSetup.mockConfigProvider.setSelectedTab(2)).called(1);
      },
    );

    testWidgets(
      'should show logs page when tapping on "Percentage blocked" tile',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

        expect(find.byType(Home), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Percentage blocked'));
        // await tester.pumpAndSettle();
        // expect(find.byType(Logs), findsOneWidget);
        // expect(find.text('9 status selected'), findsNothing);
        verify(
          testSetup.mockFiltersProvider.setRequestStatus(RequestStatus.all),
        ).called(1);
        verify(testSetup.mockConfigProvider.setSelectedTab(2)).called(1);
      },
    );

    testWidgets(
      'should show adlists page when tapping on "Domains on Adlists" tile',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(testSetup.buildTestWidget(const Home()));

        expect(find.byType(Home), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Domains on Adlists'));
        await tester.pumpAndSettle();
        expect(find.byType(SubscriptionLists), findsOneWidget);
      },
    );
  });
}
