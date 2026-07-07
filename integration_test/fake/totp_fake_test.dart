import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../support/app_harness.dart';
import '../support/fake_pihole_server.dart';

/// Fake-server TOTP (2FA) flow coverage — required/invalid/reused/rate-limit
/// on connect, and cancelling the prompt. Exercises the exact JSON error
/// shapes `PiholeV6ApiClient._parseTotpError` expects (see
/// `fake_pihole_server.dart`).
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  /// Opens the add-server form and fills alias/host/port/password, leaving
  /// the "Connect" tap to the caller (unlike `addV6ServerViaUi`, which
  /// assumes no TOTP prompt follows).
  Future<void> fillAddV6Form(
    WidgetTester tester,
    AppHarness app, {
    required String host,
    required String port,
    required String password,
    required String alias,
  }) async {
    await app.openAddServer();
    final fields = find.byType(EditableText);
    await tester.enterText(fields.at(0), alias);
    await tester.enterText(fields.at(1), host);
    await tester.enterText(fields.at(2), port);
    await tester.enterText(fields.at(3), password);
    await app.settle(frames: 3);
    await tester.tap(find.byIcon(Icons.login_rounded));
    await app.waitForTotpPrompt();
    await app.settle(frames: 3);
  }

  group('totp fake - connect', () {
    testWidgets('(C5) the correct code connects a 2FA-enabled server', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer(password: 'pw')
        ..totpRequired = true
        ..totpCode = 111111;
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await fillAddV6Form(
        tester,
        app,
        host: uri.host,
        port: '${uri.port}',
        password: 'pw',
        alias: 'totp-required',
      );

      await app.completeTotpPrompt('111111');

      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      expect(app.servers.getServersList, isNotEmpty);
    });

    testWidgets('(C6) a wrong code re-prompts with an error, then the correct '
        'code succeeds', (tester) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer(password: 'pw')
        ..totpRequired = true
        ..totpCode = 222222;
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await fillAddV6Form(
        tester,
        app,
        host: uri.host,
        port: '${uri.port}',
        password: 'pw',
        alias: 'totp-invalid',
      );

      await app.submitTotpCode('000000');
      await app.waitForTotpPrompt(); // re-prompt with error
      await app.settle(frames: 3);
      expect(find.text(app.l10n.mfaInvalidCode), findsOneWidget);

      await app.completeTotpPrompt('222222');
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
    });

    testWidgets('(C7) a reused code is rejected', (tester) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer(password: 'pw')
        ..totpRequired = true
        ..totpCode = 333333;
      // Simulate the code having already been consumed (e.g. a concurrent
      // login) before the app ever submits it.
      fakeServer.markTotpCodeUsed(333333);
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await fillAddV6Form(
        tester,
        app,
        host: uri.host,
        port: '${uri.port}',
        password: 'pw',
        alias: 'totp-reused',
      );

      await app.submitTotpCode('333333');
      await app.waitForTotpPrompt(); // re-prompt with error
      await app.settle(frames: 3);
      expect(find.text(app.l10n.mfaReusedCode), findsOneWidget);
      expect(app.servers.getServersList, isEmpty);
    });

    testWidgets('(C8) rate-limiting shows the rate-limit message and does not '
        'save the server', (tester) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer(password: 'pw')
        ..totpRequired = true
        ..totpCode = 444444
        ..rateLimitNextAuth = true;
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await fillAddV6Form(
        tester,
        app,
        host: uri.host,
        port: '${uri.port}',
        password: 'pw',
        alias: 'totp-rate-limit',
      );

      // The rate-limit response comes from the *first* code submission (the
      // fake server rejects it before checking the code).
      await app.submitTotpCode('444444');
      await app.waitFor(find.text(app.l10n.mfaRateLimited));

      expect(find.text(app.l10n.mfaRateLimited), findsOneWidget);
      expect(app.servers.getServersList, isEmpty);
    });

    testWidgets('(C9) cancelling the prompt does not save the server', (
      tester,
    ) async {
      final app = AppHarness(tester);
      await app.boot();

      final fakeServer = FakePiholeServer(password: 'pw')
        ..totpRequired = true
        ..totpCode = 555555;
      addTearDown(fakeServer.close);
      final uri = Uri.parse(await fakeServer.start());

      await fillAddV6Form(
        tester,
        app,
        host: uri.host,
        port: '${uri.port}',
        password: 'pw',
        alias: 'totp-cancel',
      );

      await app.cancelTotpPrompt();

      expect(app.servers.getServersList, isEmpty);
    });
  });

  group('totp fake - edit', () {
    testWidgets(
      '(E6) the correct code completes an edit that requires reauth',
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
          alias: 'edit-totp-success',
        );
        expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
        final address = app.servers.getServersList.single.address;

        fakeServer.totpRequired = true;
        fakeServer.totpCode = 777777;
        fakeServer.invalidateSession();

        await app.openEditServer();
        final fields = find.byType(EditableText);
        await tester.enterText(fields.at(0), 'edit-totp-success-renamed');
        await app.settle(frames: 3);
        await tester.tap(find.byIcon(Icons.save_rounded));
        await app.waitForTotpPrompt();
        await app.settle(frames: 3);
        await app.completeTotpPrompt('777777');

        expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);
        expect(
          app.servers.getServersList.single.alias,
          'edit-totp-success-renamed',
        );
        expect(app.servers.isTotpReauthDeclined(address), isFalse);
      },
    );

    testWidgets('(E7) a wrong code re-prompts during an edit, then the correct '
        'code succeeds', (tester) async {
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
        alias: 'edit-totp-retry',
      );
      expect(find.text(app.l10n.connectedSuccessfully), findsOneWidget);
      final address = app.servers.getServersList.single.address;

      fakeServer.totpRequired = true;
      fakeServer.totpCode = 888888;
      fakeServer.invalidateSession();

      await app.openEditServer();
      final fields = find.byType(EditableText);
      await tester.enterText(fields.at(0), 'edit-totp-retry-renamed');
      await app.settle(frames: 3);
      await tester.tap(find.byIcon(Icons.save_rounded));
      await app.waitForTotpPrompt();
      await app.settle(frames: 3);

      await app.submitTotpCode('000000');
      await app.waitForTotpPrompt();
      await app.settle(frames: 3);
      expect(find.text(app.l10n.mfaInvalidCode), findsOneWidget);

      await app.completeTotpPrompt('888888');
      expect(find.text(app.l10n.editServerSuccessfully), findsOneWidget);
      expect(
        app.servers.getServersList.single.alias,
        'edit-totp-retry-renamed',
      );
      expect(app.servers.isTotpReauthDeclined(address), isFalse);
    });
  });
}
