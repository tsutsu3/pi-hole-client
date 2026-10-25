import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/servers/widgets/server_tile_actions.dart';

import '../../../../testing/fakes/services/fake_tls_certificate_fetcher.dart';
import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../../testing/test_app.dart';

const _httpsServer = Server(
  address: 'https://pi.hole',
  alias: 'Pi-hole',
  defaultServer: false,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
  pinnedCertificateSha256: 'old:fingerprint',
);

void main() async {
  await initTestApp();

  group('ServerTileActions pin update', () {
    late FakeServersViewModel serversViewModel;

    setUp(() {
      serversViewModel = FakeServersViewModel()..selectedServer = null;
      serversViewModel.storedRows[_httpsServer.address] = _httpsServer;
    });

    /// Lets the dialogs open or close.
    Future<void> settle(WidgetTester tester) async {
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
    }

    Future<void> openPinUpdate(
      WidgetTester tester,
      FakeTlsCertificateFetcher fetcher,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          ServerTileActions(
            server: _httpsServer,
            onConnect: () {},
            onEdit: () {},
            onDelete: () {},
            onSetDefault: () {},
            fetchTlsCertificate: fetcher.call,
          ),
          serversViewModel: serversViewModel,
          statusViewModel: FakeStatusViewModel(),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(PopupMenuButton<void>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Update'));
      await settle(tester);
    }

    /// Checks the state after one pin update.
    ///
    /// [message] is the snackbar text, or null when no snackbar is shown.
    void expectPinUpdateResult({
      required String storedPin,
      required String? message,
    }) {
      expect(
        serversViewModel
            .storedRows[_httpsServer.address]
            ?.pinnedCertificateSha256,
        storedPin,
        reason: 'stored pin',
      );
      expect(
        message == null ? find.byType(SnackBar) : find.text(message),
        message == null ? findsNothing : findsOneWidget,
        reason: 'snackbar',
      );
    }

    testWidgets('confirming the dialog stores the new pin', (tester) async {
      final fetcher = FakeTlsCertificateFetcher(onAllowBad: fakeCertInfo());

      await openPinUpdate(tester, fetcher);

      expect(find.text('Update pinned fingerprint'), findsOneWidget);
      await tester.tap(find.text('Confirm'));
      await settle(tester);

      expectPinUpdateResult(
        storedPin: 'new:fingerprint',
        message: 'Server settings updated successfully.',
      );
    });

    testWidgets('cancelling the dialog keeps the old pin', (tester) async {
      final fetcher = FakeTlsCertificateFetcher(onAllowBad: fakeCertInfo());

      await openPinUpdate(tester, fetcher);

      expect(find.text('Update pinned fingerprint'), findsOneWidget);
      await tester.tap(find.text('Cancel'));
      await settle(tester);

      expectPinUpdateResult(storedPin: 'old:fingerprint', message: null);
    });

    testWidgets('a failed certificate fetch keeps the old pin', (tester) async {
      final fetcher = FakeTlsCertificateFetcher(
        allowBadError: Exception('no tls'),
      );

      await openPinUpdate(tester, fetcher);

      expect(find.text('Update pinned fingerprint'), findsNothing);
      expectPinUpdateResult(
        storedPin: 'old:fingerprint',
        message: 'Could not fetch certificate information.',
      );
    });
  });
}
