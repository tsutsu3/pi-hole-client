import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../support/app_harness.dart';
import '../support/fake_pihole_server.dart';

/// Fake-server tests for editing a server: session/credential/declined-state
/// cleanup edge cases that need deterministic control not practical against
/// a real Pi-hole (session expiry, rejecting one specific request).
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('same-address password change', () {
    testWidgets(
      '(E2) changing the password to a new value re-authenticates and '
      'issues a new sid',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final fakeServer = FakePiholeServer(password: 'pw1');
        addTearDown(fakeServer.close);
        final uri = Uri.parse(await fakeServer.start());

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uri.host,
          port: '${uri.port}',
          password: 'pw1',
          alias: 'pw-change-success',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        final address = app.servers.getServersList.single.address;
        final sidBefore = await app.sidOf(address);
        expect(sidBefore, isNotNull);

        // The server's own password also changes, so the new value the
        // form submits is the one that must now succeed.
        fakeServer.password = 'pw2';
        await app.editServer(password: 'pw2');
        expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);

        expect(await app.passwordOf(address), 'pw2');
        expect(
          await app.sidOf(address),
          isNot(equals(sidBefore)),
          reason:
              'a password change must validate the new password by '
              'creating a new session',
        );
      },
    );
  });

  group('same-address password change rollback', () {
    testWidgets('(E3) a failed password change clears the stale new sid', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer(password: 'pw1');
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: '${uri.port}',
        password: 'pw1',
        alias: 'pw-rollback',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      final address = app.servers.getServersList.single.address;
      final sid1 = await app.sidOf(address);
      expect(sid1, isNotNull);

      // Accept the new password (as if it had also changed on the real
      // Pi-hole), but fail every post-login connection check so the edit
      // rolls back. A single failure would be recovered by the repository's
      // internal retry, so this must be the permanent flag.
      fakeServer.password = 'pw2';
      fakeServer.failBlockingCheck = true;
      await app.editServer(password: 'pw2');

      expect(
        await app.sidOf(address),
        isNull,
        reason:
            'a failed password change must not leave the stale new sid; the '
            'app re-logs in with the restored old password on next use',
      );
    });
  });

  group('edit success clears a declined TOTP reauth', () {
    testWidgets(
      '(E9) a successful edit clears a previously-declined TOTP reauth',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final fakeServer = FakePiholeServer(password: 'pw');
        addTearDown(fakeServer.close);
        final uri = Uri.parse(await fakeServer.start());

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uri.host,
          port: '${uri.port}',
          password: 'pw',
          alias: 'declined-edit',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        final address = app.servers.getServersList.single.address;

        // Arrange the precondition directly rather than driving a full
        // expired-session/cancel flow.
        app.servers.markTotpReauthDeclined(address);

        await app.editServer(alias: 'declined-edit-renamed');
        expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);

        expect(
          app.servers.isTotpReauthDeclined(address),
          isFalse,
          reason: 'a successful edit must clear a declined TOTP reauth',
        );
      },
    );
  });

  group('edit-time TOTP cancel', () {
    testWidgets(
      '(E8) cancelling the TOTP prompt during an edit marks reauth declined',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final fakeServer = FakePiholeServer(password: 'pw');
        addTearDown(fakeServer.close);
        final uri = Uri.parse(await fakeServer.start());

        // Add/connect while 2FA is off, then enable it and expire the
        // session so only the edit's re-login needs a code.
        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uri.host,
          port: '${uri.port}',
          password: 'pw',
          alias: 'cancel-edit',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        final address = app.servers.getServersList.single.address;

        fakeServer.totpRequired = true;
        fakeServer.totpCode = 654321;
        fakeServer.invalidateSession();

        await app.openEditServer();
        final fields = find.byType(EditableText);
        await tester.enterText(fields.at(0), 'cancel-edit-renamed');
        await app.settle(frames: 3);
        await tester.tap(find.byIcon(Icons.save_rounded));
        await app.waitForTotpPrompt();
        await app.settle(frames: 3);
        await app.cancelTotpPrompt();

        expect(
          app.servers.isTotpReauthDeclined(address),
          isTrue,
          reason:
              'cancelling a TOTP prompt during an edit must decline reauth '
              'the same way cancelling one during connect does',
        );
      },
    );
  });

  group('replace to a new MFA-required host', () {
    testWidgets(
      '(X13) address change to an MFA-required host prompts for a code, '
      'then succeeds',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final oldServer = FakePiholeServer(password: 'pw');
        addTearDown(oldServer.close);
        final oldUri = Uri.parse(await oldServer.start());

        final newServer = FakePiholeServer(password: 'pw')
          ..totpRequired = true
          ..totpCode = 135790;
        addTearDown(newServer.close);
        final newUri = Uri.parse(await newServer.start());

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: oldUri.host,
          port: '${oldUri.port}',
          password: 'pw',
          alias: 'replace-totp-success',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);

        await app.openEditServer();
        final fields = find.byType(EditableText);
        await tester.enterText(fields.at(1), newUri.host);
        await tester.enterText(fields.at(2), '${newUri.port}');
        await app.settle(frames: 3);
        await tester.tap(find.byIcon(Icons.save_rounded));
        await app.waitForTotpPrompt();
        await app.settle(frames: 3);
        await app.completeTotpPrompt('135790');

        expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);
        expect(
          app.servers.getServersList.single.address.contains(newUri.host),
          isTrue,
        );
      },
    );

    testWidgets(
      '(X14) cancelling the TOTP prompt during a replace keeps the old '
      'server',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final oldServer = FakePiholeServer(password: 'pw');
        addTearDown(oldServer.close);
        final oldUri = Uri.parse(await oldServer.start());

        final newServer = FakePiholeServer(password: 'pw')
          ..totpRequired = true
          ..totpCode = 246810;
        addTearDown(newServer.close);
        final newUri = Uri.parse(await newServer.start());

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: oldUri.host,
          port: '${oldUri.port}',
          password: 'pw',
          alias: 'replace-totp-cancel',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        final oldAddress = app.servers.getServersList.single.address;

        await app.openEditServer();
        final fields = find.byType(EditableText);
        await tester.enterText(fields.at(1), newUri.host);
        await tester.enterText(fields.at(2), '${newUri.port}');
        await app.settle(frames: 3);
        await tester.tap(find.byIcon(Icons.save_rounded));
        await app.waitForTotpPrompt();
        await app.settle(frames: 3);
        await app.cancelTotpPrompt();

        expect(
          app.servers.getServersList,
          hasLength(1),
          reason: 'a cancelled replace must not create a second server',
        );
        expect(
          app.servers.getServersList.single.address,
          oldAddress,
          reason: 'a cancelled replace must keep the old server unchanged',
        );
      },
    );

    testWidgets(
      '(X15) a wrong code re-prompts during a replace, then the correct '
      'code succeeds',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final oldServer = FakePiholeServer(password: 'pw');
        addTearDown(oldServer.close);
        final oldUri = Uri.parse(await oldServer.start());

        final newServer = FakePiholeServer(password: 'pw')
          ..totpRequired = true
          ..totpCode = 975310;
        addTearDown(newServer.close);
        final newUri = Uri.parse(await newServer.start());

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: oldUri.host,
          port: '${oldUri.port}',
          password: 'pw',
          alias: 'replace-totp-retry',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);

        await app.openEditServer();
        final fields = find.byType(EditableText);
        await tester.enterText(fields.at(1), newUri.host);
        await tester.enterText(fields.at(2), '${newUri.port}');
        await app.settle(frames: 3);
        await tester.tap(find.byIcon(Icons.save_rounded));
        await app.waitForTotpPrompt();
        await app.settle(frames: 3);

        await app.submitTotpCode('000000');
        await app.waitForTotpPrompt();
        await app.settle(frames: 3);
        expect(find.text(app.l10n.mfaInvalidCode), findsOneWidget);

        await app.completeTotpPrompt('975310');
        expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);
        expect(
          app.servers.getServersList.single.address.contains(newUri.host),
          isTrue,
        );
      },
    );
  });

  group('same-address password change with MFA required', () {
    testWidgets(
      '(E17) changing the password on an MFA-required server prompts for a '
      'code, then succeeds',
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final fakeServer = FakePiholeServer(password: 'pw1');
        addTearDown(fakeServer.close);
        final uri = Uri.parse(await fakeServer.start());

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: uri.host,
          port: '${uri.port}',
          password: 'pw1',
          alias: 'inplace-pw-totp-success',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        final address = app.servers.getServersList.single.address;

        // The server now requires 2FA (e.g. the admin just enabled it) at
        // the same time the password changes. Every previous test used its
        // own totp code, since the fake server permanently rejects a code
        // as "reused" the second time it succeeds -- so this uses a fresh
        // one, not the (unused) one from the initial add.
        fakeServer
          ..password = 'pw2'
          ..totpRequired = true
          ..totpCode = 314159;
        await app.openEditServer();
        final fields = find.byType(EditableText);
        await tester.enterText(fields.at(3), 'pw2');
        await app.settle(frames: 3);
        await tester.tap(find.byIcon(Icons.save_rounded));
        await app.waitForTotpPrompt();
        await app.settle(frames: 3);
        await app.completeTotpPrompt('314159');

        expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);
        expect(await app.passwordOf(address), 'pw2');
      },
    );

    testWidgets('(E18) cancelling that TOTP prompt restores the old password', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer(password: 'pw1');
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: '${uri.port}',
        password: 'pw1',
        alias: 'inplace-pw-totp-cancel',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      final address = app.servers.getServersList.single.address;
      final sidBefore = await app.sidOf(address);

      fakeServer
        ..password = 'pw2'
        ..totpRequired = true
        ..totpCode = 271828;
      await app.openEditServer();
      final fields = find.byType(EditableText);
      await tester.enterText(fields.at(3), 'pw2');
      await app.settle(frames: 3);
      await tester.tap(find.byIcon(Icons.save_rounded));
      await app.waitForTotpPrompt();
      await app.settle(frames: 3);
      await app.cancelTotpPrompt();

      expect(
        await app.passwordOf(address),
        'pw1',
        reason: 'cancelling the reauth must restore the old password',
      );
      expect(
        await app.sidOf(address),
        sidBefore,
        reason: 'cancelling the reauth must not touch the existing session',
      );
    });
  });

  group('delete fake', () {
    testWidgets('(DEL1) deleting the selected server does not close its remote '
        'session', (tester) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer(password: 'pw');
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await app.openAddServer();
      await app.addV6ServerViaUi(
        host: uri.host,
        port: '${uri.port}',
        password: 'pw',
        alias: 'delete-me',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      expect(fakeServer.currentSid, isNotNull);

      await app.deleteServer();

      expect(app.servers.getServersList, isEmpty);
      expect(
        fakeServer.currentSid,
        isNotNull,
        reason:
            'this documents the current spec: deleting a server only '
            'removes local DB/secure-storage state -- it never sends a '
            'DELETE /api/auth, so the remote session stays alive until it '
            'times out server-side',
      );
    });
  });

  group('address replace and declined TOTP reauth', () {
    testWidgets(
      "(X6) replacing a server clears the old address's declined TOTP reauth",
      (tester) async {
        final app = AppHarness(tester);
        await app.boot();

        final oldServer = FakePiholeServer(password: 'pw');
        addTearDown(oldServer.close);
        final oldUri = Uri.parse(await oldServer.start());

        final newServer = FakePiholeServer(password: 'pw');
        addTearDown(newServer.close);
        final newUri = Uri.parse(await newServer.start());

        await app.openAddServer();
        await app.addV6ServerViaUi(
          host: oldUri.host,
          port: '${oldUri.port}',
          password: 'pw',
          alias: 'replace-declined',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        final oldAddress = app.servers.getServersList.single.address;

        app.servers.markTotpReauthDeclined(oldAddress);

        // Point the server at a different fake instance -- an address
        // change, which replaces rather than edits in place.
        await app.editServer(host: newUri.host, port: '${newUri.port}');
        expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);

        expect(
          app.servers.isTotpReauthDeclined(oldAddress),
          isFalse,
          reason:
              "replacing a server must clear the old address's declined "
              'TOTP reauth',
        );
      },
    );
  });
}
