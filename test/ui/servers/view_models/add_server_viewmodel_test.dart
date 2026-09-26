import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/resolve_totp.dart';
import 'package:pi_hole_client/ui/servers/view_models/add_server_viewmodel.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../testing/fakes/repositories/api/fake_auth_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_dns_repository.dart';
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

const _oldServer = Server(
  address: 'http://localhost:8081',
  alias: 'old',
  apiVersion: SupportedApiVersions.v6,
  defaultServer: false,
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

const _oldServerV5 = Server(
  address: 'http://localhost:8081',
  alias: 'old-v5',
  apiVersion: SupportedApiVersions.v5,
  defaultServer: false,
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

void main() {
  group('AddServerViewModel', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late FakeAuthRepository authRepository;
    late FakeDnsRepository dnsRepository;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      serversViewModel = FakeServersViewModel()..selectedServer = _oldServer;
      statusViewModel = FakeStatusViewModel();
      authRepository = FakeAuthRepository();
      dnsRepository = FakeDnsRepository();
    });

    tearDown(() {
      Command.globalExceptionHandler = null;
    });

    AddServerViewModel buildViewModel() {
      final vm = AddServerViewModel(
        serversViewModel: serversViewModel,
        statusViewModel: statusViewModel,
        createBundle: ({required server}) => createFakeRepositoryBundle(
          auth: authRepository,
          dns: dnsRepository,
          serverAddress: server.address,
          apiVersion: server.apiVersion,
        ),
      );
      addTearDown(vm.dispose);
      return vm;
    }

    CreateServerRequest createReq({
      String url = 'http://localhost:8081',
      String apiVersion = SupportedApiVersions.v6,
      String password = 'pass',
      bool defaultServer = false,
      ResolveCertificate? resolveCertificate,
      ResolveTotp? resolveTotp,
    }) {
      return CreateServerRequest(
        url: url,
        alias: 'alias',
        apiVersion: apiVersion,
        allowUntrustedCert: true,
        ignoreCertificateErrors: false,
        pinnedCertificateSha256: null,
        password: password,
        token: 'token',
        defaultServer: defaultServer,
        resolveCertificate: resolveCertificate ?? (server) async => server,
        resolveTotp: resolveTotp ?? ({error}) async => null,
      );
    }

    UpdateServerRequest updateReq({
      String? url,
      String apiVersion = SupportedApiVersions.v6,
      String password = 'pass',
      String? initPassword,
      bool secretsLoadSucceeded = true,
      Server oldServer = _oldServer,
      ResolveCertificate? resolveCertificate,
      ResolveTotp? resolveTotp,
    }) {
      return UpdateServerRequest(
        url: url ?? oldServer.address,
        alias: 'alias',
        apiVersion: apiVersion,
        allowUntrustedCert: true,
        ignoreCertificateErrors: false,
        pinnedCertificateSha256: null,
        password: password,
        token: 'token',
        defaultServer: false,
        oldServer: oldServer,
        initPassword: initPassword ?? password,
        initToken: 'token',
        secretsLoadSucceeded: secretsLoadSucceeded,
        resolveCertificate: resolveCertificate ?? (server) async => server,
        resolveTotp: resolveTotp ?? ({error}) async => null,
      );
    }

    group('createServer', () {
      test(
        'v6 success returns CreateSuccess with the server to persist',
        () async {
          final vm = buildViewModel();

          final outcome = await vm.createServer.runAsync(
            createReq(defaultServer: true),
          );

          expect(outcome, isA<CreateSuccess>());
          final server = (outcome as CreateSuccess).server;
          expect(server.address, 'http://localhost:8081');
          expect(server.defaultServer, isTrue);
          expect(authRepository.createSessionCallCount, 1);
          expect(serversViewModel.savePasswordCallCount, 1);
          expect(serversViewModel.saveTokenCallCount, 1);
        },
      );

      test('v5 success does not create a session', () async {
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(
          createReq(apiVersion: SupportedApiVersions.v5),
        );

        expect(outcome, isA<CreateSuccess>());
        expect(authRepository.createSessionCallCount, 0);
      });

      test('v6 passwordless success verifies with an empty password', () async {
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq(password: ''));

        expect(outcome, isA<CreateSuccess>());
        expect(authRepository.createSessionCallCount, 1);
        expect(authRepository.lastPassword, '');
      });

      test('returns CreateDuplicateUrl when the URL already exists', () async {
        serversViewModel.urlExistsResult = true;
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq());

        expect(outcome, isA<CreateDuplicateUrl>());
        expect(serversViewModel.savePasswordCallCount, 0);
      });

      test(
        'returns CreateUrlCheckFailed when the check is inconclusive',
        () async {
          serversViewModel.checkUrlExistsFails = true;
          final vm = buildViewModel();

          final outcome = await vm.createServer.runAsync(createReq());

          expect(outcome, isA<CreateUrlCheckFailed>());
        },
      );

      test('returns CreateApiError when session creation fails', () async {
        authRepository.shouldFail = true;
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq());

        expect(outcome, isA<CreateApiError>());
        expect((outcome as CreateApiError).version, SupportedApiVersions.v6);
      });

      test(
        'returns CreateApiError when the blocking-status probe fails',
        () async {
          dnsRepository
            ..shouldFail = true
            ..failureException = HttpStatusCodeException(503);
          final vm = buildViewModel();

          final outcome = await vm.createServer.runAsync(createReq());

          expect(outcome, isA<CreateApiError>());
        },
      );

      test('returns CreateDbError and cleans up creds/session when the DB '
          'write fails', () async {
        serversViewModel.shouldFailAddServer = true;
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq());

        expect(outcome, isA<CreateDbError>());
        expect(serversViewModel.addServerCallCount, 1);
        expect(authRepository.deleteCurrentSessionCallCount, 1);
        expect(serversViewModel.deleteSidCallCount, 1);
      });

      test('a cancelled certificate aborts with CreateCancelled', () async {
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(
          createReq(resolveCertificate: (_) async => null),
        );

        expect(outcome, isA<CreateCancelled>());
        expect(authRepository.createSessionCallCount, 0);
      });

      test(
        '2FA server: prompts for a code then returns CreateSuccess',
        () async {
          authRepository
            ..shouldRequireTotp = true
            ..validTotp = '123456'
            ..serverUsesTotp = true;
          final vm = buildViewModel();

          final outcome = await vm.createServer.runAsync(
            createReq(resolveTotp: ({error}) async => '123456'),
          );

          expect(outcome, isA<CreateSuccess>());
          // First password-only attempt + the password+totp retry.
          expect(authRepository.createSessionCallCount, 2);
          expect(authRepository.lastTotp, '123456');
        },
      );

      test('2FA cancel aborts with CreateCancelled and cleans up', () async {
        authRepository.shouldRequireTotp = true;
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(
          createReq(resolveTotp: ({error}) async => null),
        );

        expect(outcome, isA<CreateCancelled>());
        // Only the password-only attempt ran; no retry after the user cancelled.
        expect(authRepository.createSessionCallCount, 1);
      });

      test('2FA re-prompts on an invalid code then succeeds', () async {
        authRepository
          ..shouldRequireTotp = true
          ..validTotp = '999999';
        final vm = buildViewModel();

        final codes = ['000000', '999999'];
        final errors = <TotpPromptError?>[];
        var attempt = 0;

        final outcome = await vm.createServer.runAsync(
          createReq(
            resolveTotp: ({error}) async {
              errors.add(error);
              return codes[attempt++];
            },
          ),
        );

        expect(outcome, isA<CreateSuccess>());
        // password-only + invalid code + valid code.
        expect(authRepository.createSessionCallCount, 3);
        expect(attempt, 2);
        // First prompt has no error; the re-prompt flags the invalid code.
        expect(errors, [null, TotpPromptError.invalid]);
      });

      test('2FA re-prompts on a reused code then succeeds', () async {
        authRepository
          ..shouldRequireTotp = true
          ..totpFailures.add(TotpReusedException());
        final vm = buildViewModel();

        final errors = <TotpPromptError?>[];

        final outcome = await vm.createServer.runAsync(
          createReq(
            resolveTotp: ({error}) async {
              errors.add(error);
              return '123456';
            },
          ),
        );

        expect(outcome, isA<CreateSuccess>());
        // password-only + reused code + accepted code.
        expect(authRepository.createSessionCallCount, 3);
        expect(errors, [null, TotpPromptError.reused]);
      });

      test(
        '2FA rate limit is terminal (CreateApiError, no re-prompt)',
        () async {
          authRepository
            ..shouldRequireTotp = true
            ..totpFailures.add(TotpRateLimitException());
          final vm = buildViewModel();

          var promptCount = 0;

          final outcome = await vm.createServer.runAsync(
            createReq(
              resolveTotp: ({error}) async {
                promptCount++;
                return '123456';
              },
            ),
          );

          expect(outcome, isA<CreateApiError>());
          expect(
            (outcome as CreateApiError).error,
            isA<TotpRateLimitException>(),
          );
          // Prompted once; the rate-limit response stops the loop.
          expect(promptCount, 1);
        },
      );
    });

    group('updateServer', () {
      test('same-address edit reuses the session and edits in place', () async {
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(updateReq());

        expect(outcome, isA<UpdateSuccess>());
        expect(serversViewModel.editServerCallCount, 1);
        expect(serversViewModel.replaceServerCallCount, 0);
        // Unchanged password -> existing session reused, no new login.
        expect(authRepository.createSessionCallCount, 0);
        expect(statusViewModel.stopAutoRefreshCallCount, 1);
        expect(statusViewModel.startAutoRefreshCallCount, 1);
      });

      test(
        'address change replaces the server and cleans up the old one',
        () async {
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(url: 'http://other.host:9999'),
          );

          expect(outcome, isA<UpdateSuccess>());
          expect(serversViewModel.replaceServerCallCount, 1);
          expect(serversViewModel.editServerCallCount, 0);
          // New address always creates a session; old v6 session is logged out.
          expect(authRepository.createSessionCallCount, 1);
          expect(authRepository.deleteCurrentSessionCallCount, 1);
          // Old address SID is dropped after the commit.
          expect(serversViewModel.deleteSidCallCount, 1);
        },
      );

      test('a cancelled certificate aborts with UpdateCancelled', () async {
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(resolveCertificate: (_) async => null),
        );

        expect(outcome, isA<UpdateCancelled>());
        // No commit, no new credentials written for the attempt.
        expect(serversViewModel.editServerCallCount, 0);
        expect(serversViewModel.savePasswordCallCount, 0);
        // Auto refresh was stopped then restarted.
        expect(statusViewModel.stopAutoRefreshCallCount, 1);
        expect(statusViewModel.startAutoRefreshCallCount, 1);
      });

      test(
        'returns UpdateDuplicateUrl when the new address already exists',
        () async {
          serversViewModel.urlExistsResult = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(url: 'http://other.host:9999'),
          );

          expect(outcome, isA<UpdateDuplicateUrl>());
          expect(serversViewModel.replaceServerCallCount, 0);
        },
      );

      test(
        'returns UpdateUrlCheckFailed when the new-address check fails',
        () async {
          serversViewModel.checkUrlExistsFails = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(url: 'http://other.host:9999'),
          );

          expect(outcome, isA<UpdateUrlCheckFailed>());
        },
      );

      test(
        'address-change auth failure rolls back and restarts auto refresh',
        () async {
          authRepository.shouldFail = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(url: 'http://other.host:9999'),
          );

          expect(outcome, isA<UpdateApiError>());
          expect(serversViewModel.replaceServerCallCount, 0);
          // Rollback drops the SID written under the new address.
          expect(serversViewModel.deleteSidCallCount, 1);
          expect(statusViewModel.startAutoRefreshCallCount, 1);
        },
      );

      test('same-address password change validates the new password', () async {
        authRepository.shouldFail = true;
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(password: 'new-pass', initPassword: 'old-pass'),
        );

        expect(outcome, isA<UpdateApiError>());
        expect(authRepository.createSessionCallCount, 1);
        expect(serversViewModel.editServerCallCount, 0);
      });

      test(
        'same-address unchanged password re-authenticates on a 401',
        () async {
          // preCheck (call 1) returns 401 -> re-auth -> retry (call 2) succeeds.
          dnsRepository = _SeqDns([HttpStatusCodeException(401), null]);
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(updateReq());

          expect(outcome, isA<UpdateSuccess>());
          expect(authRepository.createSessionCallCount, 1);
          expect(serversViewModel.editServerCallCount, 1);
        },
      );

      test(
        'same-address unchanged password does not re-auth on a 503',
        () async {
          dnsRepository
            ..shouldFail = true
            ..failureException = HttpStatusCodeException(503);
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(updateReq());

          expect(outcome, isA<UpdateApiError>());
          // 503 is transient -> no re-auth to avoid duplicate sessions.
          expect(authRepository.createSessionCallCount, 0);
        },
      );

      test(
        'returns UpdateDbError and rolls back when the DB write fails',
        () async {
          serversViewModel.shouldFailEditServer = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(updateReq());

          expect(outcome, isA<UpdateDbError>());
          expect(statusViewModel.startAutoRefreshCallCount, 1);
        },
      );

      test('(E15) same-address v6->v5 version switch deletes the old SID, '
          'no login', () async {
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(apiVersion: SupportedApiVersions.v5),
        );

        expect(outcome, isA<UpdateSuccess>());
        expect(serversViewModel.editServerCallCount, 1);
        expect(serversViewModel.replaceServerCallCount, 0);
        // v5 has no session concept -- no login attempt at all.
        expect(authRepository.createSessionCallCount, 0);
        // The now-unused v6 session is logged out and its SID dropped.
        expect(authRepository.deleteCurrentSessionCallCount, 1);
        expect(serversViewModel.deleteSidCallCount, 1);
      });

      test('(E16) same-address v5->v6 version switch logs in with the new '
          'password (2FA required)', () async {
        authRepository
          ..shouldRequireTotp = true
          ..validTotp = '123456'
          ..serverUsesTotp = true;
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(
            oldServer: _oldServerV5,
            apiVersion: SupportedApiVersions.v6,
            password: 'new-v6-pass',
            initPassword: '',
            resolveTotp: ({error}) async => '123456',
          ),
        );

        expect(outcome, isA<UpdateSuccess>());
        expect(serversViewModel.editServerCallCount, 1);
        expect(serversViewModel.replaceServerCallCount, 0);
        // First password-only attempt + the password+totp retry.
        expect(authRepository.createSessionCallCount, 2);
        expect(authRepository.lastTotp, '123456');
      });

      // Rollback changes if updateServer fails or the user cancels.
      //
      // updateServer runs the following steps:
      //   1. Save the new password and token.
      //   2. Login and create a new session if needed.
      //   3. Check the blocking status.
      //   4. Update the server (edit, or replace).
      //
      // If step2 fails or the user cancels 2FA:
      //   - Same address: restore the old password.
      //   - Address changed: remove the password and SID saved for the new
      //     address, and restore the old password.
      //
      // If step 3 or 4 fails:
      //   - Same address: logout the new session, restore the old password,
      //     and remove the SID.
      //   - Address changed: remove the password and SID saved for the new
      //     address, and logout the new session.
      //
      // "Logout the new session" only happens when step 2 created one.
      // The old password is restored only if it was loaded (secretsLoadSucceeded).
      group('rollback', () {
        const oldAddress = 'http://localhost:8081';
        const newAddress = 'http://other.host:9999';

        /// Checks every side effect of one updateServer run, in a fixed order.
        void expectUpdateEffects({
          required List<({String address, String password})> savedPasswords,
          required List<String> deletedPasswords,
          required List<String> deletedSids,
          required int loginAttempts,
          required int sessionsLoggedOut,
          required String? totpDeclinedAddress,
          required int editAttempts,
          required int replaceAttempts,
          required int autoRefreshRestarts,
        }) {
          expect(
            serversViewModel.savedPasswords,
            savedPasswords,
            reason: 'savePassword calls (address, password), in order',
          );
          expect(
            serversViewModel.deletedPasswordAddresses,
            deletedPasswords,
            reason: 'deletePassword calls',
          );
          expect(
            serversViewModel.deletedSidAddresses,
            deletedSids,
            reason: 'deleteSid calls',
          );
          expect(
            authRepository.createSessionCallCount,
            loginAttempts,
            reason: 'createSession calls',
          );
          expect(
            authRepository.deleteCurrentSessionCallCount,
            sessionsLoggedOut,
            reason: 'deleteCurrentSession calls',
          );
          expect(
            serversViewModel.lastMarkedTotpReauthDeclinedAddress,
            totpDeclinedAddress,
            reason: 'address marked as 2FA declined',
          );
          expect(
            serversViewModel.editServerCallCount,
            editAttempts,
            reason: 'editServer calls',
          );
          expect(
            serversViewModel.replaceServerCallCount,
            replaceAttempts,
            reason: 'replaceServer calls',
          );
          expect(
            statusViewModel.startAutoRefreshCallCount,
            autoRefreshRestarts,
            reason: 'startAutoRefresh calls',
          );
        }

        test('same address: 2FA cancel writes the old password back', () async {
          authRepository.shouldRequireTotp = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(password: 'new-pass', initPassword: 'old-pass'),
          );

          expect(outcome, isA<UpdateCancelled>());
          expectUpdateEffects(
            savedPasswords: [
              (address: oldAddress, password: 'new-pass'), // step 1
              (address: oldAddress, password: 'old-pass'), // rollback
            ],
            deletedPasswords: [],
            deletedSids: [],
            // The password-only login asks for 2FA, then the user cancels.
            loginAttempts: 1,
            sessionsLoggedOut: 0,
            totpDeclinedAddress: oldAddress,
            editAttempts: 0,
            replaceAttempts: 0,
            autoRefreshRestarts: 1,
          );
        });

        test(
          'address changed: 2FA cancel deletes the new-address credentials',
          () async {
            authRepository.shouldRequireTotp = true;
            final vm = buildViewModel();

            final outcome = await vm.updateServer.runAsync(
              updateReq(url: newAddress),
            );

            expect(outcome, isA<UpdateCancelled>());
            expectUpdateEffects(
              savedPasswords: [
                (address: newAddress, password: 'pass'), // step 1
                (address: oldAddress, password: 'pass'), // rollback
              ],
              deletedPasswords: [newAddress],
              deletedSids: [newAddress],
              loginAttempts: 1,
              // No session was created, so there is nothing to log out.
              sessionsLoggedOut: 0,
              totpDeclinedAddress: newAddress,
              editAttempts: 0,
              replaceAttempts: 0,
              autoRefreshRestarts: 1,
            );
          },
        );

        test(
          'same address: login failure after a failed secret load leaves the new password (known issue)',
          () async {
            authRepository.shouldFail = true;
            final vm = buildViewModel();

            final outcome = await vm.updateServer.runAsync(
              updateReq(
                password: 'new-pass',
                initPassword: '',
                secretsLoadSucceeded: false,
              ),
            );

            expect(outcome, isA<UpdateApiError>());
            expectUpdateEffects(
              savedPasswords: [
                (address: oldAddress, password: 'new-pass'), // step 1
              ],
              deletedPasswords: [],
              deletedSids: [],
              loginAttempts: 1,
              sessionsLoggedOut: 0,
              totpDeclinedAddress: null,
              editAttempts: 0,
              replaceAttempts: 0,
              autoRefreshRestarts: 1,
            );
          },
        );

        test(
          'same address: status check failure logs out the new session',
          () async {
            dnsRepository.shouldFail = true;
            final vm = buildViewModel();

            final outcome = await vm.updateServer.runAsync(
              updateReq(password: 'new-pass', initPassword: 'old-pass'),
            );

            expect(outcome, isA<UpdateApiError>());
            expectUpdateEffects(
              savedPasswords: [
                (address: oldAddress, password: 'new-pass'), // step 1
                (address: oldAddress, password: 'old-pass'), // rollback
              ],
              deletedPasswords: [],
              deletedSids: [oldAddress],
              loginAttempts: 1,
              sessionsLoggedOut: 1,
              totpDeclinedAddress: null,
              editAttempts: 0,
              replaceAttempts: 0,
              autoRefreshRestarts: 1,
            );
          },
        );

        test(
          'address changed: DB failure deletes the new-address credentials only',
          () async {
            serversViewModel.shouldFailReplaceServer = true;
            final vm = buildViewModel();

            final outcome = await vm.updateServer.runAsync(
              updateReq(url: newAddress),
            );

            expect(outcome, isA<UpdateDbError>());
            expectUpdateEffects(
              savedPasswords: [
                (address: newAddress, password: 'pass'), // step 1
                // No rollback write: the old address was never changed.
              ],
              // Only the new address; the old server's data is kept.
              deletedPasswords: [newAddress],
              deletedSids: [newAddress],
              loginAttempts: 1,
              sessionsLoggedOut: 1,
              totpDeclinedAddress: null,
              editAttempts: 0,
              replaceAttempts: 1,
              autoRefreshRestarts: 1,
            );
          },
        );
      });
    });
  });
}
