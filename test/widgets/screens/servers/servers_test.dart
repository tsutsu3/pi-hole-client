import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/servers/servers_screen.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/widgets/delete_server_modal.dart';
import 'package:pi_hole_client/ui/servers/widgets/unverified_certificates_banner.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group('Servers Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should show servers page', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const ServersScreen()));

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      // show default server
      expect(find.text('test v6'), findsOneWidget);
      expect(find.text('Connected'), findsOneWidget);
    });

    testWidgets('should show blank page', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      when(testSetup.mockServersViewModel.getServersList).thenReturn([]);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const ServersScreen()));

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      expect(find.text('test v6'), findsNothing);
    });

    // TODO: Re-implement connection test using the new
    // RepositoryBundleFactory pattern. The connection flow now goes through
    // ServerConnectionService -> RepositoryBundleFactory.create() which
    // creates real repositories that require a valid SID in secure storage.
    // This needs either a mock/fake RepositoryBundleFactory or integration
    // with the fake repository bundle from the provider tree.

    testWidgets('should set default server', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const ServersScreen()));

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Set as default connection'), findsOneWidget);
      when(
        testSetup.mockServersViewModel.setDefaultServer(any),
      ).thenAnswer((_) async => true);
      await tester.tap(find.text('Set as default connection'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Connection set as default successfully.'),
        findsOneWidget,
      );
    });

    testWidgets('should show edit server', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const ServersScreen()));

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Edit'), findsOneWidget);
      await tester.tap(find.text('Edit'));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pump(const Duration(milliseconds: 1000));
      expect(find.byType(AddServerFullscreen), findsOneWidget);
    });

    testWidgets('should delete server', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const ServersScreen()));

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Delete'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      expect(find.byType(DeleteServerModal), findsOneWidget);
      expect(find.text('Delete'), findsWidgets);
      await tester.tap(find.text('Delete').last);
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Connection removed successfully'), findsOneWidget);
    });

    testWidgets('should show add server window', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const ServersScreen()));

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pump(const Duration(milliseconds: 1000));
      expect(find.byType(AddServerFullscreen), findsOneWidget);
    });

    // TODO: Re-implement connection error test using the new
    // RepositoryBundleFactory pattern instead of the removed gateway layer.
    // The previous test relied on mockApiGatewayV6.loginQuery() which no
    // longer exists after the gateway-to-repository migration.

    testWidgets('should show unverified certificates banner', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      // Mock unverified server
      const unverifiedServer = Server(
        address: 'https://localhost:8443',
        alias: 'unverified',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
      );

      when(
        testSetup.mockServersViewModel.serversWithUnverifiedCertificates,
      ).thenReturn([unverifiedServer]);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(testSetup.buildTestWidget(const ServersScreen()));

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.byType(UnverifiedCertificatesBanner), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);
    });

    testWidgets(
      'should hide banner when dismissed (call dismiss when close button tapped)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        // Mock unverified server
        const unverifiedServer = Server(
          address: 'https://localhost:8443',
          alias: 'unverified',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );

        when(
          testSetup.mockServersViewModel.serversWithUnverifiedCertificates,
        ).thenReturn([unverifiedServer]);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(const ServersScreen()),
        );

        expect(find.byType(UnverifiedCertificatesBanner), findsOneWidget);

        // Dismiss the banner
        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();

        // Verify that setUnverifiedBannerDismissed was called with true
        verify(
          testSetup.mockServersViewModel.setUnverifiedBannerDismissed(true),
        ).called(1);
      },
    );
  });
}
