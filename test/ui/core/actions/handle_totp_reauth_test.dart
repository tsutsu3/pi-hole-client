import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/actions/handle_totp_reauth.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../testing/fakes/repositories/api/fake_auth_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_dns_repository.dart';
import '../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../../testing/test_app.dart';

const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'v6',
  apiVersion: SupportedApiVersions.v6,
  defaultServer: false,
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

void main() async {
  await initTestApp();

  group('handleTotpReauth', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late AppConfigViewModel appConfigViewModel;
    late FakeAuthRepository authRepository;
    late FakeDnsRepository dnsRepository;

    setUp(() {
      serversViewModel = FakeServersViewModel();
      statusViewModel = FakeStatusViewModel();
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      authRepository = FakeAuthRepository();
      dnsRepository = FakeDnsRepository();
    });

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
          createRepositoryBundle: ({required server}) =>
              createFakeRepositoryBundle(
                auth: authRepository,
                dns: dnsRepository,
                serverAddress: server.address,
                apiVersion: server.apiVersion,
              ),
        ),
      );
      await tester.pump();
      return ctx;
    }

    testWidgets('returns false and does not connect when no server selected', (
      tester,
    ) async {
      final ctx = await pumpContext(tester); // selectedServer stays null

      final result = await handleTotpReauth(ctx);

      expect(result, isFalse);
      expect(authRepository.createSessionCallCount, 0);
    });

    testWidgets('reconnects and returns true for a selected server', (
      tester,
    ) async {
      serversViewModel.selectedServer = _serverV6;
      final ctx = await pumpContext(tester);

      final result = await handleTotpReauth(ctx);
      await tester.pumpAndSettle();

      expect(result, isTrue);
      // Valid existing session -> no re-login, no TOTP modal.
      expect(authRepository.createSessionCallCount, 0);
      expect(serversViewModel.selectedServer, _serverV6);
    });

    testWidgets('returns false when the reconnect does not succeed', (
      tester,
    ) async {
      // A reconnect that does not reach a loaded state must report false so the
      // caller (base) does not trigger a follow-up refresh.
      serversViewModel.selectedServer = _serverV6;
      dnsRepository
        ..shouldFail = true
        ..failureException = HttpStatusCodeException(503, 'unavailable');
      final ctx = await pumpContext(tester);

      final result = await handleTotpReauth(ctx);
      await tester.pumpAndSettle();

      expect(result, isFalse);
      expect(statusViewModel.getServerStatus, isNot(LoadStatus.loaded));
    });

    testWidgets(
      'returns false without connecting when 2FA was cancelled for the server',
      (tester) async {
        serversViewModel.selectedServer = _serverV6;
        serversViewModel.markTotpReauthDeclined(_serverV6.address);
        final ctx = await pumpContext(tester);

        final result = await handleTotpReauth(ctx);
        await tester.pumpAndSettle();

        expect(result, isFalse);
        expect(authRepository.createSessionCallCount, 0);
      },
    );
  });
}
