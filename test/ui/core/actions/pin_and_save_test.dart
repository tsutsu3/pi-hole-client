import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/actions/pin_and_save.dart';

import '../../../../testing/fakes/services/fake_tls_certificate_fetcher.dart';
import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/test_app.dart';

const _server = Server(
  address: 'https://pi.hole',
  alias: 'https',
  defaultServer: false,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
  pinnedCertificateSha256: 'old:fingerprint',
);

const _handshakeFailedMessage =
    "Couldn't establish a secure connection. "
    'Check that the server uses HTTPS on this port.';

void main() async {
  await initTestApp();

  group('pinAndSave', () {
    late FakeServersViewModel serversViewModel;

    setUp(() {
      serversViewModel = FakeServersViewModel();
      serversViewModel.storedRows[_server.address] = _server;
    });

    /// Lets the dialogs open or close.
    Future<void> settle(WidgetTester tester) async {
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
    }

    /// Starts the pin update and returns its result once [answer] runs.
    Future<Server?> run(
      WidgetTester tester,
      FakeTlsCertificateFetcher fetcher, {
      String? answer,
    }) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
          serversViewModel: serversViewModel,
        ),
      );

      final result = pinAndSave(ctx, _server, tlsCertFetcher: fetcher.call);
      await settle(tester);
      if (answer != null) {
        await tester.tap(find.text(answer));
        await settle(tester);
      }

      return result;
    }

    /// Checks the state after one pin update.
    ///
    /// [message] is the snackbar text, or null when no snackbar is shown.
    void expectPinUpdateResult(
      Server? returned, {
      required String? returnedPin,
      required String storedPin,
      required String? message,
    }) {
      expect(
        returned?.pinnedCertificateSha256,
        returnedPin,
        reason: 'returned pin',
      );
      expect(
        serversViewModel.storedRows[_server.address]?.pinnedCertificateSha256,
        storedPin,
        reason: 'stored pin',
      );
      expect(
        message == null ? find.byType(SnackBar) : find.text(message),
        message == null ? findsNothing : findsOneWidget,
        reason: 'snackbar',
      );
    }

    testWidgets('confirming saves the new pin', (tester) async {
      final fetcher = FakeTlsCertificateFetcher(onAllowBad: fakeCertInfo());

      final returned = await run(tester, fetcher, answer: 'Confirm');

      expectPinUpdateResult(
        returned,
        returnedPin: 'new:fingerprint',
        storedPin: 'new:fingerprint',
        message: 'Server settings updated successfully.',
      );
    });

    testWidgets('cancelling keeps the old pin', (tester) async {
      final fetcher = FakeTlsCertificateFetcher(onAllowBad: fakeCertInfo());

      final returned = await run(tester, fetcher, answer: 'Cancel');

      expectPinUpdateResult(
        returned,
        returnedPin: null,
        storedPin: 'old:fingerprint',
        message: null,
      );
    });

    testWidgets('a failed certificate fetch keeps the old pin', (tester) async {
      final fetcher = FakeTlsCertificateFetcher(
        allowBadError: const HandshakeException(),
      );

      final returned = await run(tester, fetcher);

      expectPinUpdateResult(
        returned,
        returnedPin: null,
        storedPin: 'old:fingerprint',
        message: _handshakeFailedMessage,
      );
    });

    testWidgets('a failed save keeps the old pin', (tester) async {
      serversViewModel.shouldFailEditServer = true;
      final fetcher = FakeTlsCertificateFetcher(onAllowBad: fakeCertInfo());

      final returned = await run(tester, fetcher, answer: 'Confirm');

      expectPinUpdateResult(
        returned,
        returnedPin: null,
        storedPin: 'old:fingerprint',
        message: "Connection data couldn't be saved",
      );
    });
  });
}
