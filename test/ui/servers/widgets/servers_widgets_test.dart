import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/servers/widgets/server_tile_actions.dart';
import 'package:pi_hole_client/ui/servers/widgets/server_tile_header.dart';
import 'package:pi_hole_client/ui/servers/widgets/unverified_certificates_banner.dart';

import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  // -------------------------------------------------------------------------
  // UnverifiedCertificatesBanner
  // -------------------------------------------------------------------------

  group('UnverifiedCertificatesBanner', () {
    const testServer = Server(
      address: 'https://pi.hole',
      alias: 'My Pi-hole',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
      ignoreCertificateErrors: false,
    );

    testWidgets('renders warning card with server count', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          UnverifiedCertificatesBanner(
            servers: const [testServer],
            onServerTap: (_) {},
            onDismiss: () {},
          ),
          useScaffold: true,
        ),
      );

      expect(find.byIcon(Icons.warning_amber_rounded), findsWidgets);
    });

    testWidgets('expand button reveals server list', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          UnverifiedCertificatesBanner(
            servers: const [testServer],
            onServerTap: (_) {},
            onDismiss: () {},
          ),
        ),
      );

      // Initially collapsed — server alias not visible in the list section.
      // Tap the expand toggle.
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down));
      await tester.pump();

      // After expand, the server alias appears in the list.
      expect(find.text('My Pi-hole'), findsWidgets);
      expect(find.byIcon(Icons.keyboard_arrow_up), findsOneWidget);
    });

    testWidgets('dismiss button triggers onDismiss callback', (tester) async {
      var dismissed = false;
      await tester.pumpWidget(
        buildTestApp(
          UnverifiedCertificatesBanner(
            servers: const [testServer],
            onServerTap: (_) {},
            onDismiss: () => dismissed = true,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(dismissed, isTrue);
    });

    testWidgets('tapping a server in expanded list calls onServerTap',
        (tester) async {
      Server? tapped;
      await tester.pumpWidget(
        buildTestApp(
          UnverifiedCertificatesBanner(
            servers: const [testServer],
            onServerTap: (s) => tapped = s,
            onDismiss: () {},
          ),
        ),
      );

      // Expand the list first.
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down));
      await tester.pump();

      // Tap the server row.
      await tester.tap(find.byIcon(Icons.dns_outlined));
      await tester.pump();

      expect(tapped, equals(testServer));
    });

    testWidgets('shows server address when alias is empty', (tester) async {
      const serverNoAlias = Server(
        address: 'https://192.168.1.1',
        alias: '',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
      );

      await tester.pumpWidget(
        buildTestApp(
          UnverifiedCertificatesBanner(
            servers: const [serverNoAlias],
            onServerTap: (_) {},
            onDismiss: () {},
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.keyboard_arrow_down));
      await tester.pump();

      expect(find.text('https://192.168.1.1'), findsOneWidget);
    });
  });

  // -------------------------------------------------------------------------
  // ServerTileHeader
  // -------------------------------------------------------------------------

  group('ServerTileHeader', () {
    const server = Server(
      address: 'http://localhost:8080',
      alias: 'Local Pi',
      defaultServer: false,
      apiVersion: 'v5',
      allowSelfSignedCert: false,
      ignoreCertificateErrors: false,
    );

    const defaultServer = Server(
      address: 'http://localhost:8080',
      alias: 'Default Pi',
      defaultServer: true,
      apiVersion: 'v5',
      allowSelfSignedCert: false,
      ignoreCertificateErrors: false,
    );

    testWidgets('renders server address and alias', (tester) async {
      final serversVm = FakeServersViewModel()..selectedServer = null;
      final statusVm = FakeStatusViewModel();

      await tester.pumpWidget(
        buildTestApp(
          const ServerTileHeader(server: server),
          serversViewModel: serversVm,
          statusViewModel: statusVm,
        ),
      );

      expect(find.text('http://localhost:8080'), findsOneWidget);
      expect(find.text('Local Pi'), findsOneWidget);
    });

    testWidgets('default server shows star icon overlay', (tester) async {
      final serversVm = FakeServersViewModel()
        ..selectedServer = defaultServer
        ..selectedServerEnabled = true;
      final statusVm = FakeStatusViewModel()
        ..serverStatus = LoadStatus.loaded;

      await tester.pumpWidget(
        buildTestApp(
          const ServerTileHeader(server: defaultServer),
          serversViewModel: serversVm,
          statusViewModel: statusVm,
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('non-default server does not show star icon', (tester) async {
      final serversVm = FakeServersViewModel()..selectedServer = null;
      final statusVm = FakeStatusViewModel();

      await tester.pumpWidget(
        buildTestApp(
          const ServerTileHeader(server: server),
          serversViewModel: serversVm,
          statusViewModel: statusVm,
        ),
      );

      expect(find.byIcon(Icons.star), findsNothing);
    });

    testWidgets('selected + disconnected server renders storage icon',
        (tester) async {
      final serversVm = FakeServersViewModel()
        ..selectedServer = server
        ..selectedServerEnabled = false;
      final statusVm = FakeStatusViewModel()
        ..serverStatus = LoadStatus.error;

      await tester.pumpWidget(
        buildTestApp(
          const ServerTileHeader(server: server),
          serversViewModel: serversVm,
          statusViewModel: statusVm,
        ),
      );

      expect(find.byIcon(Icons.storage_rounded), findsOneWidget);
    });
  });

  // -------------------------------------------------------------------------
  // ServerTileActions
  // -------------------------------------------------------------------------

  group('ServerTileActions', () {
    const httpServer = Server(
      address: 'http://localhost:8080',
      alias: 'Pi-hole',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: false,
      ignoreCertificateErrors: false,
    );

    const defaultServer = Server(
      address: 'http://localhost:8080',
      alias: 'Default Pi-hole',
      defaultServer: true,
      apiVersion: 'v6',
      allowSelfSignedCert: false,
      ignoreCertificateErrors: false,
    );

    Widget buildActions(
      Server server, {
      FakeServersViewModel? serversVm,
      FakeStatusViewModel? statusVm,
      VoidCallback? onConnect,
      VoidCallback? onEdit,
      VoidCallback? onDelete,
      VoidCallback? onSetDefault,
    }) {
      return buildTestApp(
        ServerTileActions(
          server: server,
          onConnect: onConnect ?? () {},
          onEdit: onEdit ?? () {},
          onDelete: onDelete ?? () {},
          onSetDefault: onSetDefault ?? () {},
        ),
        serversViewModel: serversVm ?? (FakeServersViewModel()..selectedServer = null),
        statusViewModel: statusVm ?? FakeStatusViewModel(),
      );
    }

    testWidgets('shows Connect button when server is not selected',
        (tester) async {
      await tester.pumpWidget(buildActions(httpServer));
      await tester.pump();

      expect(find.text('Connect'), findsOneWidget);
      expect(find.byIcon(Icons.login), findsOneWidget);
    });

    testWidgets('onConnect called when Connect button tapped', (tester) async {
      var called = false;
      await tester.pumpWidget(buildActions(httpServer, onConnect: () => called = true));
      await tester.pump();

      await tester.tap(find.text('Connect'));
      await tester.pump();

      expect(called, isTrue);
    });

    testWidgets('shows Connected status when server is selected and loaded',
        (tester) async {
      final serversVm = FakeServersViewModel()..selectedServer = httpServer;
      final statusVm = FakeStatusViewModel()..serverStatus = LoadStatus.loaded;

      await tester.pumpWidget(
        buildActions(httpServer, serversVm: serversVm, statusVm: statusVm),
      );
      await tester.pump();

      expect(find.text('Connected'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('shows disconnected status when server is selected but errored',
        (tester) async {
      final serversVm = FakeServersViewModel()..selectedServer = httpServer;
      final statusVm = FakeStatusViewModel()..serverStatus = LoadStatus.error;

      await tester.pumpWidget(
        buildActions(httpServer, serversVm: serversVm, statusVm: statusVm),
      );
      await tester.pump();

      expect(find.text('Selected but disconnected'), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('popup menu shows edit and delete options', (tester) async {
      await tester.pumpWidget(buildActions(httpServer));
      await tester.pump();

      await tester.tap(find.byType(PopupMenuButton<void>));
      await tester.pumpAndSettle();

      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('popup shows set-default for non-default server',
        (tester) async {
      await tester.pumpWidget(buildActions(httpServer));
      await tester.pump();

      await tester.tap(find.byType(PopupMenuButton<void>));
      await tester.pumpAndSettle();

      expect(find.text('Set as default connection'), findsOneWidget);
    });

    testWidgets('popup shows Default connection (disabled) for default server',
        (tester) async {
      await tester.pumpWidget(buildActions(defaultServer));
      await tester.pump();

      await tester.tap(find.byType(PopupMenuButton<void>));
      await tester.pumpAndSettle();

      expect(find.text('Default connection'), findsOneWidget);
    });

    testWidgets('onEdit called from popup menu', (tester) async {
      var called = false;
      await tester.pumpWidget(buildActions(httpServer, onEdit: () => called = true));
      await tester.pump();

      await tester.tap(find.byType(PopupMenuButton<void>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(called, isTrue);
    });

    testWidgets('onDelete called from popup menu', (tester) async {
      var called = false;
      await tester.pumpWidget(
          buildActions(httpServer, onDelete: () => called = true));
      await tester.pump();

      await tester.tap(find.byType(PopupMenuButton<void>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(called, isTrue);
    });

    testWidgets('onSetDefault called from popup menu for non-default server',
        (tester) async {
      var called = false;
      await tester.pumpWidget(
          buildActions(httpServer, onSetDefault: () => called = true));
      await tester.pump();

      await tester.tap(find.byType(PopupMenuButton<void>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Set as default connection'));
      await tester.pumpAndSettle();

      expect(called, isTrue);
    });

    testWidgets('certificate options disabled for http server', (tester) async {
      await tester.pumpWidget(buildActions(httpServer));
      await tester.pump();

      await tester.tap(find.byType(PopupMenuButton<void>));
      await tester.pumpAndSettle();

      expect(find.text('View certificate'), findsOneWidget);
      expect(find.text('Update'), findsOneWidget);
    });
  });
}
