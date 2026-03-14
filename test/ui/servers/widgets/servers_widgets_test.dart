import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
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
}
