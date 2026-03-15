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

    testWidgets('should open add server as dialog on large screen', (
      WidgetTester tester,
    ) async {
      // 2560x1600 DPR 2.0 -> logical 1280x800 (>700 medium -> dialog)
      tester.view.physicalSize = const Size(2560, 1600);
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

      await tester.tap(find.byType(FloatingActionButton));
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

        expect(find.byType(UnverifiedCertificatesBanner), findsOneWidget);

        // Dismiss the banner
        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();

        // Verify that setUnverifiedBannerDismissed was called with true
        expect(serversViewModel.setUnverifiedBannerDismissedCallCount, 1);
        expect(serversViewModel.lastUnverifiedBannerDismissedValue, true);
      },
    );

    testWidgets('renders multiple servers in xLarge layout', (tester) async {
      // Logical width 1100px > xLarge (1000) -> 2-column tile layout
      tester.view.physicalSize = const Size(2200, 2400);
      tester.view.devicePixelRatio = 2.0;

      const server2 = Server(
        address: 'http://localhost:8082',
        alias: 'test v5',
        defaultServer: true,
        apiVersion: 'v5',
        allowSelfSignedCert: false,
        ignoreCertificateErrors: false,
      );
      const server3 = Server(
        address: 'http://localhost:8083',
        alias: 'test v5b',
        defaultServer: false,
        apiVersion: 'v5',
        allowSelfSignedCert: false,
        ignoreCertificateErrors: false,
      );

      serversViewModel.serversList = [testServer, server2, server3];

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
      await tester.pump();

      expect(find.text('test v6'), findsOneWidget);
      expect(find.text('test v5'), findsOneWidget);
      expect(find.text('test v5b'), findsOneWidget);
    });

    testWidgets(
      'tapping server in banner calls _openEditServer (small screen)',
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

        serversViewModel.serversWithUnverifiedCertificates = [unverifiedServer];
        serversViewModel.serversList = [testServer, unverifiedServer];

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

        // Expand the banner to reveal server list
        await tester.tap(find.byIcon(Icons.keyboard_arrow_down));
        await tester.pump();

        // Tap the server icon to open edit screen
        await tester.tap(find.byIcon(Icons.dns_outlined));
        await tester.pump(const Duration(milliseconds: 1000));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(find.byType(AddServerFullscreen), findsOneWidget);
      },
    );

    testWidgets('should show error snackbar on delete failure', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      serversViewModel.shouldFailRemoveServer = true;

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

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete').last);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Connection cannot be removed.'), findsOneWidget);
    });

    testWidgets('should show error snackbar on set default failure', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      serversViewModel.shouldFailSetDefaultServer = true;

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

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Set as default connection'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
      'renders 5 servers in xLarge layout covers all margin branches',
      (tester) async {
        tester.view.physicalSize = const Size(2200, 2400);
        tester.view.devicePixelRatio = 2.0;

        const server2 = Server(
          address: 'http://localhost:8082',
          alias: 'test v5',
          defaultServer: true,
          apiVersion: 'v5',
          allowSelfSignedCert: false,
          ignoreCertificateErrors: false,
        );
        const server3 = Server(
          address: 'http://localhost:8083',
          alias: 'test v5b',
          defaultServer: false,
          apiVersion: 'v5',
          allowSelfSignedCert: false,
          ignoreCertificateErrors: false,
        );
        const server4 = Server(
          address: 'http://localhost:8084',
          alias: 'test v5c',
          defaultServer: false,
          apiVersion: 'v5',
          allowSelfSignedCert: false,
          ignoreCertificateErrors: false,
        );
        const server5 = Server(
          address: 'http://localhost:8085',
          alias: 'test v5d',
          defaultServer: false,
          apiVersion: 'v5',
          allowSelfSignedCert: false,
          ignoreCertificateErrors: false,
        );

        serversViewModel.serversList = [
          testServer,
          server2,
          server3,
          server4,
          server5,
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
        await tester.pump();

        expect(find.text('test v6'), findsOneWidget);
        expect(find.text('test v5'), findsOneWidget);
        expect(find.text('test v5b'), findsOneWidget);
        expect(find.text('test v5c'), findsOneWidget);
        expect(find.text('test v5d'), findsOneWidget);
      },
    );

    testWidgets('large screen: edit server via popup opens dialog', (
      WidgetTester tester,
    ) async {
      // Logical 1280x800 > 700 medium -> showEditModalOrPage dialog branch
      tester.view.physicalSize = const Size(2560, 1600);
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

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Edit'));
      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(find.byType(AddServerFullscreen), findsOneWidget);
    });

    testWidgets(
      'large screen: tapping server in banner opens edit dialog via _openEditServer',
      (WidgetTester tester) async {
        // Suppress RenderFlex overflow errors — AddServerFullscreen(window:true)
        // overflows in constrained test viewport, but the dialog is still shown.
        final origOnError = FlutterError.onError;
        FlutterError.onError = (details) {
          if (details.exceptionAsString().contains('A RenderFlex overflowed')) {
            return;
          }
          origOnError?.call(details);
        };

        // 1280x800 logical (> 700 medium) -> _openEditServer uses showDialog path
        tester.view.physicalSize = const Size(2560, 1600);
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
        serversViewModel.serversList = [testServer, unverifiedServer];

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
          FlutterError.onError = origOnError;
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

        // Expand the banner to reveal server list
        await tester.tap(find.byIcon(Icons.keyboard_arrow_down));
        await tester.pump();

        // Tap the server icon to open edit screen
        await tester.tap(find.byIcon(Icons.dns_outlined));
        await tester.pump(const Duration(milliseconds: 1000));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(find.byType(AddServerFullscreen), findsOneWidget);
      },
    );

    testWidgets(
      'tapping View certificate shows error snackbar when TLS fetch fails',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        // HTTPS server with allowSelfSignedCert=true and ignoreCertificateErrors=false
        // so "View certificate" and "Update" popup items are enabled.
        const httpsServer = Server(
          address: 'https://127.0.0.1:19998',
          alias: 'https test',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );

        serversViewModel.serversList = [httpsServer];
        serversViewModel.selectedServer = httpsServer;
        serversViewModel.selectedServerEnabled = true;

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

        // Open popup menu
        await tester.tap(find.byIcon(Icons.more_vert));
        await tester.pumpAndSettle();

        // Tap "View certificate" — triggers _showCertificateDialog
        await tester.tap(find.text('View certificate'));

        // Allow the async TLS fetch to complete (connection refused → fast fail)
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(seconds: 3)),
        );
        await tester.pumpAndSettle();

        // fetchTlsCertificateInfo throws → error snackbar shown
        expect(find.text('Could not fetch certificate information.'), findsOneWidget);
      },
    );

    testWidgets(
      'popup menu for HTTPS server evaluates allowSelfSignedCert conditions',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        // HTTPS server with allowSelfSignedCert=true, ignoreCertificateErrors=false
        // → the "Update" pin item evaluates both conditions on lines 96-97
        const httpsServer = Server(
          address: 'https://127.0.0.1:19997',
          alias: 'https pin test',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );

        serversViewModel.serversList = [httpsServer];
        serversViewModel.selectedServer = httpsServer;
        serversViewModel.selectedServerEnabled = true;

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

        // Open popup menu — triggers itemBuilder which evaluates lines 96-97 and 100-102
        await tester.tap(find.byIcon(Icons.more_vert));
        await tester.pumpAndSettle();

        // Both certificate items are present and enabled
        expect(find.text('View certificate'), findsOneWidget);
        expect(find.text('Update'), findsOneWidget);

        // Let background TLS check timers finish before test ends
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(seconds: 3)),
        );
        await tester.pumpAndSettle();
      },
    );
  });
}
