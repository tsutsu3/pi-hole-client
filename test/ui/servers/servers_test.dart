import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/widgets/delete_server_modal.dart';
import 'package:pi_hole_client/ui/servers/widgets/servers_screen.dart';
import 'package:pi_hole_client/ui/servers/widgets/unverified_certificates_banner.dart';

import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('Servers Widget Tests', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late AppConfigViewModel appConfigViewModel;

    const testServer = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
      ignoreCertificateErrors: false,
    );

    setUp(() {
      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = testServer
        ..selectedServerEnabled = true
        ..serversList = [testServer];

      statusViewModel = FakeStatusViewModel();
    });

    testWidgets('should show servers page', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const ServersScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      // show default server
      expect(find.text('test v6'), findsOneWidget);
      expect(find.text('Connected'), findsOneWidget);
    });

    testWidgets('should show blank page', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      serversViewModel.serversList = [];

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const ServersScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      expect(find.text('test v6'), findsNothing);
    });

    testWidgets('should set default server', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const ServersScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      expect(find.text('Set as default connection'), findsOneWidget);
      await tester.tap(find.text('Set as default connection'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Connection set as default successfully.'),
        findsOneWidget,
      );
      expect(serversViewModel.setDefaultServerCallCount, 1);
    });

    testWidgets('should show edit server', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const ServersScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

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

      await tester.pumpWidget(
        buildTestApp(
          const ServersScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

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
      expect(serversViewModel.removeServerCallCount, 1);
      expect(serversViewModel.lastRemovedServerAddress, testServer.address);
    });

    testWidgets('should show add server window', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const ServersScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pump(const Duration(milliseconds: 1000));
      expect(find.byType(AddServerFullscreen), findsOneWidget);
    });

    testWidgets('should show unverified certificates banner', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      const unverifiedServer = Server(
        address: 'https://localhost:8443',
        alias: 'unverified',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
      );

      serversViewModel.serversWithUnverifiedCertificates = [unverifiedServer];

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const ServersScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
          repositoryBundle: createFakeRepositoryBundle(),
        ),
      );

      expect(find.byType(ServersScreen), findsOneWidget);
      expect(find.byType(UnverifiedCertificatesBanner), findsOneWidget);
      expect(find.text('Servers'), findsOneWidget);
    });

    testWidgets(
      'should hide banner when dismissed (call dismiss when close button tapped)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        const unverifiedServer = Server(
          address: 'https://localhost:8443',
          alias: 'unverified',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );

        serversViewModel.serversWithUnverifiedCertificates = [
          unverifiedServer,
        ];

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildTestApp(
            const ServersScreen(),
            appConfigViewModel: appConfigViewModel,
            serversViewModel: serversViewModel,
            statusViewModel: statusViewModel,
            repositoryBundle: createFakeRepositoryBundle(),
          ),
        );

        expect(find.byType(UnverifiedCertificatesBanner), findsOneWidget);

        // Dismiss the banner
        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();

        // Verify that setUnverifiedBannerDismissed was called with true
        expect(serversViewModel.setUnverifiedBannerDismissedCallCount, 1);
        expect(serversViewModel.lastUnverifiedBannerDismissedValue, true);
      },
    );
  });
}
