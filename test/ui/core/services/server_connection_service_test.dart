import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/services/server_connection_service.dart';
import 'package:pi_hole_client/ui/core/types/resolve_totp.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../testing/fakes/repositories/api/fake_auth_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_dns_repository.dart';
import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../../testing/test_app.dart';

/// A [FakeDnsRepository] whose [fetchBlockingStatus] fails for the first calls
/// according to [_failExceptions] (one entry per call; `null` = success), then
/// succeeds. Lets a test drive the "preCheck fails -> re-auth -> retry"
/// sequence with a single repository instance.
class _SeqDns extends FakeDnsRepository {
  _SeqDns(this._failExceptions);

  final List<Exception?> _failExceptions;
  int _call = 0;

  @override
  Future<Result<Blocking>> fetchBlockingStatus({bool skipRenewal = false}) {
    final index = _call++;
    final ex = index < _failExceptions.length ? _failExceptions[index] : null;
    if (ex != null) return Future.value(Failure(ex));
    return super.fetchBlockingStatus(skipRenewal: skipRenewal);
  }
}

const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'v6',
  apiVersion: SupportedApiVersions.v6,
  defaultServer: false,
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

const _otherV6 = Server(
  address: 'http://localhost:9091',
  alias: 'other',
  apiVersion: SupportedApiVersions.v6,
  defaultServer: false,
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

const _serverV5 = Server(
  address: 'http://localhost:8082',
  alias: 'v5',
  apiVersion: SupportedApiVersions.v5,
  defaultServer: false,
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

void main() async {
  await initTestApp();

  group('ServerConnectionService.connect', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late AppConfigViewModel appConfigViewModel;
    late FakeAuthRepository authRepository;

    setUp(() {
      serversViewModel = FakeServersViewModel();
      statusViewModel = FakeStatusViewModel();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      authRepository = FakeAuthRepository();
    });

    /// Pumps a minimal app and returns a [BuildContext] living under a
    /// [MaterialApp] (so AppLocalizations / ScaffoldMessenger are available).
    Future<BuildContext> pumpContext(WidgetTester tester) async {
      late BuildContext ctx;
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) {
              ctx = context;
              return const SizedBox();
            },
          ),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          statusViewModel: statusViewModel,
        ),
      );
      await tester.pump();
      return ctx;
    }

    ServerConnectionService buildService(
      BuildContext context, {
      required Server server,
      required FakeDnsRepository dns,
      ResolveTotp? resolveTotp,
    }) {
      return ServerConnectionService(
        context: context,
        appConfigViewModel: appConfigViewModel,
        statusViewModel: statusViewModel,
        serversViewModel: serversViewModel,
        server: server,
        createBundle: ({required server}) => createFakeRepositoryBundle(
          auth: authRepository,
          dns: dns,
          serverAddress: server.address,
          apiVersion: server.apiVersion,
        ),
        resolveTotp: resolveTotp ?? ({error}) async => null,
      );
    }

    testWidgets('v6 valid session connects without a TOTP prompt', (
      tester,
    ) async {
      serversViewModel.selectedServer = _serverV6;
      final ctx = await pumpContext(tester);

      await buildService(
        ctx,
        server: _serverV6,
        dns: FakeDnsRepository(),
      ).connect();
      await tester.pump();

      expect(authRepository.createSessionCallCount, 0);
      expect(serversViewModel.selectedServer, _serverV6);
      expect(
        statusViewModel.startAutoRefreshCallCount,
        greaterThanOrEqualTo(1),
      );
      expect(serversViewModel.connectingServer, isNull);
    });

    testWidgets('expired session on a 2FA server prompts and connects', (
      tester,
    ) async {
      serversViewModel.selectedServer = _serverV6;
      authRepository
        ..shouldRequireTotp = true
        ..validTotp = '123456';
      final ctx = await pumpContext(tester);

      await buildService(
        ctx,
        server: _serverV6,
        // preCheck (call 0) fails 401 -> re-auth; post-login fetch (call 1) ok.
        dns: _SeqDns([HttpStatusCodeException(401, 'unauthorized')]),
        resolveTotp: ({error}) async => '123456',
      ).connect();
      await tester.pump();

      // password-only attempt + password+totp retry.
      expect(authRepository.createSessionCallCount, 2);
      expect(authRepository.lastTotp, '123456');
      expect(serversViewModel.selectedServer, _serverV6);
      expect(serversViewModel.connectingServer, isNull);
    });

    testWidgets('invalid TOTP re-prompts then connects', (tester) async {
      serversViewModel.selectedServer = _serverV6;
      authRepository
        ..shouldRequireTotp = true
        ..validTotp = '123456';
      final ctx = await pumpContext(tester);

      var prompts = 0;
      final codes = ['000000', '123456'];

      await buildService(
        ctx,
        server: _serverV6,
        dns: _SeqDns([HttpStatusCodeException(401, 'unauthorized')]),
        resolveTotp: ({error}) async => codes[prompts++],
      ).connect();
      await tester.pump();

      expect(prompts, 2);
      // pw-only (required) + pw+000000 (invalid) + pw+123456 (ok).
      expect(authRepository.createSessionCallCount, 3);
      expect(authRepository.lastTotp, '123456');
      expect(serversViewModel.selectedServer, _serverV6);
    });

    testWidgets('reused TOTP re-prompts then connects', (tester) async {
      serversViewModel.selectedServer = _serverV6;
      authRepository
        ..shouldRequireTotp = true
        ..totpFailures.add(TotpReusedException());
      final ctx = await pumpContext(tester);

      var prompts = 0;
      await buildService(
        ctx,
        server: _serverV6,
        dns: _SeqDns([HttpStatusCodeException(401, 'unauthorized')]),
        resolveTotp: ({error}) async {
          prompts++;
          return '123456';
        },
      ).connect();
      await tester.pump();

      expect(prompts, 2);
      expect(serversViewModel.selectedServer, _serverV6);
    });

    testWidgets('rate-limited TOTP aborts the connection', (tester) async {
      serversViewModel.selectedServer = _otherV6;
      authRepository
        ..shouldRequireTotp = true
        ..totpFailures.add(TotpRateLimitException());
      final ctx = await pumpContext(tester);

      await buildService(
        ctx,
        server: _serverV6,
        dns: _SeqDns([HttpStatusCodeException(401, 'unauthorized')]),
        resolveTotp: ({error}) async => '123456',
      ).connect();
      await tester.pump();

      // pw-only (required) + pw+totp (rate limited, terminal).
      expect(authRepository.createSessionCallCount, 2);
      // Falls back to the previously selected server.
      expect(serversViewModel.selectedServer, _otherV6);
      expect(serversViewModel.connectingServer, isNull);
    });

    testWidgets('cancelling the TOTP prompt keeps the previous server', (
      tester,
    ) async {
      serversViewModel.selectedServer = _otherV6;
      authRepository.shouldRequireTotp = true;
      final ctx = await pumpContext(tester);

      await buildService(
        ctx,
        server: _serverV6,
        dns: _SeqDns([HttpStatusCodeException(401, 'unauthorized')]),
        resolveTotp: ({error}) async => null, // user cancels
      ).connect();
      await tester.pump();

      // Only the password-only attempt ran; no code was submitted.
      expect(authRepository.createSessionCallCount, 1);
      expect(serversViewModel.selectedServer, _otherV6);
      expect(serversViewModel.connectingServer, isNull);
    });

    testWidgets('transient 503 does not create a session', (tester) async {
      serversViewModel.selectedServer = _otherV6;
      final dns = FakeDnsRepository()
        ..shouldFail = true
        ..failureException = HttpStatusCodeException(503, 'unavailable');
      final ctx = await pumpContext(tester);

      await buildService(ctx, server: _serverV6, dns: dns).connect();
      await tester.pump();

      // 503 is not a reauth error: no createSession, fall back to previous.
      expect(authRepository.createSessionCallCount, 0);
      expect(serversViewModel.selectedServer, _otherV6);
      expect(serversViewModel.connectingServer, isNull);
    });

    testWidgets('a concurrent connect to the same server is ignored', (
      tester,
    ) async {
      serversViewModel
        ..selectedServer = _serverV6
        ..setConnectingServer(_serverV6);
      final ctx = await pumpContext(tester);

      await buildService(
        ctx,
        server: _serverV6,
        dns: FakeDnsRepository(),
      ).connect();
      await tester.pump();

      expect(authRepository.createSessionCallCount, 0);
      expect(serversViewModel.setselectedServerCallCount, 0);
      expect(statusViewModel.stopAutoRefreshCallCount, 0);
    });

    testWidgets('a v5 server connects without any TOTP flow', (tester) async {
      serversViewModel.selectedServer = _serverV5;
      final ctx = await pumpContext(tester);

      await buildService(
        ctx,
        server: _serverV5,
        dns: FakeDnsRepository(),
      ).connect();
      await tester.pump();

      expect(authRepository.createSessionCallCount, 0);
      expect(serversViewModel.selectedServer, _serverV5);
      expect(
        statusViewModel.startAutoRefreshCallCount,
        greaterThanOrEqualTo(1),
      );
    });
  });
}
