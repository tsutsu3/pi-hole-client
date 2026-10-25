import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/secret_input.dart';
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

const _oldAddress = 'http://localhost:8081';
const _newAddress = 'http://other.host:9999';

/// What is stored for [_oldServer] before each updateServer test.
const _oldSecrets = {
  '${_oldAddress}_password': 'pass',
  '${_oldAddress}_sid': 'old-sid',
};

void main() {
  group('AddServerViewModel', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late FakeAuthRepository authRepository;
    late FakeDnsRepository dnsRepository;
    String? bundleToken;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      serversViewModel = FakeServersViewModel()..selectedServer = _oldServer;
      statusViewModel = FakeStatusViewModel();
      authRepository = FakeAuthRepository();
      dnsRepository = FakeDnsRepository();
      bundleToken = null;
    });

    tearDown(() {
      Command.globalExceptionHandler = null;
    });

    AddServerViewModel buildViewModel() {
      final vm = AddServerViewModel(
        serversViewModel: serversViewModel,
        statusViewModel: statusViewModel,
        createBundle: ({required server, token}) {
          bundleToken = token;

          return createFakeRepositoryBundle(
            auth: authRepository,
            dns: dnsRepository,
            serverAddress: server.address,
            apiVersion: server.apiVersion,
          );
        },
      );
      addTearDown(vm.dispose);
      return vm;
    }

    CreateServerRequest createReq({
      String url = _oldAddress,
      String apiVersion = SupportedApiVersions.v6,
      String secret = 'pass',
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
        secret: NewSecret(secret),
        defaultServer: defaultServer,
        resolveCertificate: resolveCertificate ?? (server) async => server,
        resolveTotp: resolveTotp ?? ({error}) async => null,
      );
    }

    UpdateServerRequest updateReq({
      String? url,
      String apiVersion = SupportedApiVersions.v6,
      SecretInput secret = const UnchangedSecret('pass'),
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
        secret: secret,
        defaultServer: false,
        oldServer: oldServer,
        resolveCertificate: resolveCertificate ?? (server) async => server,
        resolveTotp: resolveTotp ?? ({error}) async => null,
      );
    }

    group('createServer', () {
      test('v6 success stores the server and only the password', () async {
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(
          createReq(defaultServer: true),
        );

        expect(outcome, isA<CreateSuccess>());
        final server = (outcome as CreateSuccess).server;
        expect(server.address, _oldAddress);
        expect(server.defaultServer, isTrue);
        expect(serversViewModel.storedRows, {_oldAddress: server});
        expect(serversViewModel.storedSecrets, {
          '${_oldAddress}_password': 'pass',
        });
        expect(bundleToken, isNull);
        expect(authRepository.createSessionCallCount, 1);
      });

      test('v5 success checks with the given token, then stores it', () async {
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(
          createReq(apiVersion: SupportedApiVersions.v5, secret: 'token'),
        );

        expect(outcome, isA<CreateSuccess>());
        expect(serversViewModel.storedSecrets, {
          '${_oldAddress}_token': 'token',
        });
        expect(bundleToken, 'token');
        // v5 has no session.
        expect(authRepository.createSessionCallCount, 0);
      });

      test('v6 passwordless success stores an empty password', () async {
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq(secret: ''));

        expect(outcome, isA<CreateSuccess>());
        expect(serversViewModel.storedSecrets, {'${_oldAddress}_password': ''});
        expect(authRepository.lastPassword, '');
      });

      test('returns CreateDuplicateUrl and stores nothing', () async {
        serversViewModel.urlExistsResult = true;
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq());

        expect(outcome, isA<CreateDuplicateUrl>());
        expect(serversViewModel.storedRows, isEmpty);
        expect(serversViewModel.storedSecrets, isEmpty);
      });

      test(
        'returns CreateUrlCheckFailed when the check is inconclusive',
        () async {
          serversViewModel.checkUrlExistsFails = true;
          final vm = buildViewModel();

          final outcome = await vm.createServer.runAsync(createReq());

          expect(outcome, isA<CreateUrlCheckFailed>());
          expect(serversViewModel.storedRows, isEmpty);
          expect(serversViewModel.storedSecrets, isEmpty);
        },
      );

      test(
        'a failed login returns CreateApiError and stores nothing',
        () async {
          authRepository.shouldFail = true;
          final vm = buildViewModel();

          final outcome = await vm.createServer.runAsync(createReq());

          expect(outcome, isA<CreateApiError>());
          expect((outcome as CreateApiError).version, SupportedApiVersions.v6);
          expect(serversViewModel.storedRows, isEmpty);
          expect(serversViewModel.storedSecrets, isEmpty);
        },
      );

      test('a failed status check after the login returns CreateApiError, '
          'stores nothing and logs out', () async {
        dnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(503);
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq());

        expect(outcome, isA<CreateApiError>());
        expect(serversViewModel.storedRows, isEmpty);
        expect(serversViewModel.storedSecrets, isEmpty);
        expect(serversViewModel.deletedSidAddresses, [_oldAddress]);
        expect(authRepository.deleteCurrentSessionCallCount, 1);
      });

      test('a failed password save returns CreateDbError before the DB '
          'write', () async {
        serversViewModel.shouldFailSaveSecret = true;
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq());

        expect(outcome, isA<CreateDbError>());
        expect(serversViewModel.storedRows, isEmpty);
        expect(serversViewModel.storedSecrets, isEmpty);
        expect(serversViewModel.deletedSidAddresses, [_oldAddress]);
        expect(serversViewModel.addServerCallCount, 0);
        expect(authRepository.deleteCurrentSessionCallCount, 1);
      });

      test('a failed DB write returns CreateDbError and removes the stored '
          'password', () async {
        serversViewModel.shouldFailAddServer = true;
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(createReq());

        expect(outcome, isA<CreateDbError>());
        expect(serversViewModel.storedRows, isEmpty);
        expect(serversViewModel.storedSecrets, isEmpty);
        expect(serversViewModel.deletedSidAddresses, [_oldAddress]);
        expect(authRepository.deleteCurrentSessionCallCount, 1);
      });

      test('a cancelled certificate returns CreateCancelled', () async {
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(
          createReq(resolveCertificate: (_) async => null),
        );

        expect(outcome, isA<CreateCancelled>());
        expect(serversViewModel.storedSecrets, isEmpty);
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
          expect(authRepository.lastTotp, '123456');
          // First password-only attempt + the password+totp retry.
          expect(authRepository.createSessionCallCount, 2);
        },
      );

      test('2FA cancel returns CreateCancelled and stores nothing', () async {
        authRepository.shouldRequireTotp = true;
        final vm = buildViewModel();

        final outcome = await vm.createServer.runAsync(
          createReq(resolveTotp: ({error}) async => null),
        );

        expect(outcome, isA<CreateCancelled>());
        expect(serversViewModel.storedRows, isEmpty);
        expect(serversViewModel.storedSecrets, isEmpty);
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
        // First prompt has no error; the re-prompt flags the invalid code.
        expect(errors, [null, TotpPromptError.invalid]);
        // password-only + invalid code + valid code.
        expect(authRepository.createSessionCallCount, 3);
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
        expect(errors, [null, TotpPromptError.reused]);
        // password-only + reused code + accepted code.
        expect(authRepository.createSessionCallCount, 3);
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
          expect(serversViewModel.storedSecrets, isEmpty);
          // Prompted once; the rate-limit response stops the loop.
          expect(promptCount, 1);
        },
      );
    });

    group('updateServer', () {
      setUp(() {
        serversViewModel.storedRows[_oldAddress] = _oldServer;
        serversViewModel.storedSecrets.addAll(_oldSecrets);
      });

      /// Checks that the old server's row and secrets were not changed.
      void expectOldServerKept() {
        expect(serversViewModel.storedRows, {_oldAddress: _oldServer});
        expect(serversViewModel.storedSecrets, _oldSecrets);
      }

      test('same-address edit updates the row and keeps the secrets', () async {
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(updateReq());

        expect(outcome, isA<UpdateSuccess>());
        expect(serversViewModel.storedRows.keys, [_oldAddress]);
        expect(serversViewModel.storedRows[_oldAddress]!.alias, 'alias');
        // The password was not changed, so nothing is written.
        expect(serversViewModel.storedSecrets, _oldSecrets);
        // The current session is used; no new login.
        expect(authRepository.createSessionCallCount, 0);
        expect(statusViewModel.stopAutoRefreshCallCount, 1);
        expect(statusViewModel.startAutoRefreshCallCount, 1);
      });

      test('address change moves the row and the password to the new '
          'address', () async {
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(url: _newAddress),
        );

        expect(outcome, isA<UpdateSuccess>());
        expect(serversViewModel.storedRows.keys, [_newAddress]);
        // The old address's password and SID are removed.
        expect(serversViewModel.storedSecrets, {
          '${_newAddress}_password': 'pass',
        });
        // A new address always logs in; the old session is logged out.
        expect(authRepository.createSessionCallCount, 1);
        expect(authRepository.deleteCurrentSessionCallCount, 1);
      });

      test('a cancelled certificate returns UpdateCancelled', () async {
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(resolveCertificate: (_) async => null),
        );

        expect(outcome, isA<UpdateCancelled>());
        expectOldServerKept();
        expect(statusViewModel.stopAutoRefreshCallCount, 1);
        expect(statusViewModel.startAutoRefreshCallCount, 1);
      });

      test(
        'returns UpdateDuplicateUrl when the new address already exists',
        () async {
          serversViewModel.urlExistsResult = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(url: _newAddress),
          );

          expect(outcome, isA<UpdateDuplicateUrl>());
          expectOldServerKept();
        },
      );

      test(
        'returns UpdateUrlCheckFailed when the new-address check fails',
        () async {
          serversViewModel.checkUrlExistsFails = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(url: _newAddress),
          );

          expect(outcome, isA<UpdateUrlCheckFailed>());
          expectOldServerKept();
        },
      );

      test('address-change login failure keeps the old server', () async {
        authRepository.shouldFail = true;
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(url: _newAddress),
        );

        expect(outcome, isA<UpdateApiError>());
        expectOldServerKept();
        expect(serversViewModel.deletedSidAddresses, [_newAddress]);
        expect(statusViewModel.startAutoRefreshCallCount, 1);
      });

      test('same-address new password is checked with a new login', () async {
        authRepository.shouldFail = true;
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(secret: const NewSecret('new-pass')),
        );

        expect(outcome, isA<UpdateApiError>());
        expectOldServerKept();
        expect(authRepository.lastPassword, 'new-pass');
      });

      test('same-address unchanged password logs in again on a 401', () async {
        // preCheck (call 1) returns 401 -> re-auth -> retry (call 2) succeeds.
        dnsRepository = _SeqDns([HttpStatusCodeException(401), null]);
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(updateReq());

        expect(outcome, isA<UpdateSuccess>());
        expect(serversViewModel.storedRows[_oldAddress]!.alias, 'alias');
        expect(authRepository.lastPassword, 'pass');
        expect(authRepository.createSessionCallCount, 1);
      });

      test(
        'same-address unchanged password does not log in again on a 503',
        () async {
          dnsRepository
            ..shouldFail = true
            ..failureException = HttpStatusCodeException(503);
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(updateReq());

          expect(outcome, isA<UpdateApiError>());
          expectOldServerKept();
          // 503 is transient -> no new login, to avoid duplicate sessions.
          expect(authRepository.createSessionCallCount, 0);
        },
      );

      test('same-address DB failure with an unchanged password keeps the old '
          'server', () async {
        serversViewModel.shouldFailEditServer = true;
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(updateReq());

        expect(outcome, isA<UpdateDbError>());
        expectOldServerKept();
        expect(statusViewModel.startAutoRefreshCallCount, 1);
      });

      test('(E15) same-address v6->v5 stores the token and removes the '
          'password and the SID', () async {
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(
            apiVersion: SupportedApiVersions.v5,
            secret: const NewSecret('token'),
          ),
        );

        expect(outcome, isA<UpdateSuccess>());
        expect(
          serversViewModel.storedRows[_oldAddress]!.apiVersion,
          SupportedApiVersions.v5,
        );
        expect(serversViewModel.storedSecrets, {
          '${_oldAddress}_token': 'token',
        });
        // v5 has no session; the old v6 session is logged out.
        expect(authRepository.createSessionCallCount, 0);
        expect(authRepository.deleteCurrentSessionCallCount, 1);
      });

      test('(E16) same-address v5->v6 logs in with the new password (2FA '
          'required), stores it and removes the token', () async {
        serversViewModel.storedRows[_oldAddress] = _oldServerV5;
        serversViewModel.storedSecrets
          ..clear()
          ..['${_oldAddress}_token'] = 'token';
        authRepository
          ..shouldRequireTotp = true
          ..validTotp = '123456'
          ..serverUsesTotp = true;
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(
            oldServer: _oldServerV5,
            apiVersion: SupportedApiVersions.v6,
            secret: const NewSecret('new-v6-pass'),
            resolveTotp: ({error}) async => '123456',
          ),
        );

        expect(outcome, isA<UpdateSuccess>());
        expect(
          serversViewModel.storedRows[_oldAddress]!.apiVersion,
          SupportedApiVersions.v6,
        );
        expect(serversViewModel.storedSecrets, {
          '${_oldAddress}_password': 'new-v6-pass',
        });
        expect(authRepository.lastTotp, '123456');
        // First password-only attempt + the password+totp retry.
        expect(authRepository.createSessionCallCount, 2);
      });

      test('same-address v5->v6 treats an unchanged secret as new', () async {
        serversViewModel.storedRows[_oldAddress] = _oldServerV5;
        serversViewModel.storedSecrets
          ..clear()
          ..['${_oldAddress}_token'] = 'token';
        final vm = buildViewModel();

        final outcome = await vm.updateServer.runAsync(
          updateReq(
            oldServer: _oldServerV5,
            apiVersion: SupportedApiVersions.v6,
            secret: const UnchangedSecret('v6-pass'),
          ),
        );

        expect(outcome, isA<UpdateSuccess>());
        // v5 stored no password, so the value is checked with a new login
        // and stored.
        expect(authRepository.createSessionCallCount, 1);
        expect(authRepository.lastPassword, 'v6-pass');
        expect(serversViewModel.storedSecrets, {
          '${_oldAddress}_password': 'v6-pass',
        });
      });

      test('auto refresh starts again when the save throws', () async {
        final vm = buildViewModel();

        await expectLater(
          vm.updateServer.runAsync(
            updateReq(resolveCertificate: (_) async => throw Exception('boom')),
          ),
          throwsException,
        );

        expectOldServerKept();
        expect(statusViewModel.stopAutoRefreshCallCount, 1);
        expect(statusViewModel.startAutoRefreshCallCount, 1);
      });

      // What updateServer leaves behind when a step fails or the user cancels.
      //
      // updateServer runs the following steps:
      //   1. Login and create a new session if needed.
      //   2. Check the blocking status.
      //   3. Save the password, if it is new.
      //   4. Update the server (edit, or replace).
      //
      // Nothing is stored before step 3, so a failure in step 1 or 2 has no
      // password to undo.
      //
      // If a step fails:
      //   - Logout the new session, when step 1 created one.
      //   - Remove the SID, for a new address or a new session.
      //   - Address changed: remove the password saved in step 3.
      //   - Same address: keep the password saved in step 3. It passed the
      //     check.
      //
      // The DB row of the old server is never changed.
      group('failure cleanup', () {
        /// Checks the result of one failed updateServer run.
        ///
        /// [secrets] is what is stored after the run. [deletedSids] is
        /// checked too, because the fake login does not store a SID for the
        /// new address.
        void expectFailureResult({
          required Map<String, String> secrets,
          required List<String> deletedSids,
          required String? totpDeclinedAddress,
          required int sessionsLoggedOut,
        }) {
          expect(serversViewModel.storedRows, {
            _oldAddress: _oldServer,
          }, reason: 'the old DB row is kept');
          expect(
            serversViewModel.storedSecrets,
            secrets,
            reason: 'stored secrets',
          );
          expect(
            serversViewModel.deletedSidAddresses,
            deletedSids,
            reason: 'removed SIDs',
          );
          for (final address in [_oldAddress, _newAddress]) {
            expect(
              serversViewModel.isTotpReauthDeclined(address),
              address == totpDeclinedAddress,
              reason: '2FA declined mark of $address',
            );
          }
          expect(
            statusViewModel.startAutoRefreshCallCount,
            1,
            reason: 'auto refresh starts again',
          );
          expect(
            authRepository.deleteCurrentSessionCallCount,
            sessionsLoggedOut,
            reason: 'sessions logged out',
          );
        }

        test('same address: 2FA cancel keeps the old server', () async {
          authRepository.shouldRequireTotp = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(secret: const NewSecret('new-pass')),
          );

          expect(outcome, isA<UpdateCancelled>());
          expectFailureResult(
            secrets: _oldSecrets,
            deletedSids: [],
            totpDeclinedAddress: _oldAddress,
            sessionsLoggedOut: 0,
          );
        });

        test('address changed: 2FA cancel keeps the old server', () async {
          authRepository.shouldRequireTotp = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(url: _newAddress),
          );

          expect(outcome, isA<UpdateCancelled>());
          expectFailureResult(
            secrets: _oldSecrets,
            deletedSids: [_newAddress],
            totpDeclinedAddress: _newAddress,
            // No session was created, so there is nothing to log out.
            sessionsLoggedOut: 0,
          );
        });

        test('same address: login failure keeps the old server', () async {
          authRepository.shouldFail = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(secret: const NewSecret('new-pass')),
          );

          expect(outcome, isA<UpdateApiError>());
          expectFailureResult(
            secrets: _oldSecrets,
            deletedSids: [],
            totpDeclinedAddress: null,
            sessionsLoggedOut: 0,
          );
        });

        test('same address: status check failure removes the SID and logs '
            'out the new session', () async {
          dnsRepository.shouldFail = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(secret: const NewSecret('new-pass')),
          );

          expect(outcome, isA<UpdateApiError>());
          expectFailureResult(
            secrets: {'${_oldAddress}_password': 'pass'},
            deletedSids: [_oldAddress],
            totpDeclinedAddress: null,
            sessionsLoggedOut: 1,
          );
        });

        test('same address: a failed password save stops before the DB '
            'write', () async {
          serversViewModel.shouldFailSaveSecret = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(secret: const NewSecret('new-pass')),
          );

          expect(outcome, isA<UpdateDbError>());
          expectFailureResult(
            secrets: {'${_oldAddress}_password': 'pass'},
            deletedSids: [_oldAddress],
            totpDeclinedAddress: null,
            sessionsLoggedOut: 1,
          );
          expect(serversViewModel.editServerCallCount, 0);
        });

        test('same address: DB failure keeps the checked password', () async {
          serversViewModel.shouldFailEditServer = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(secret: const NewSecret('new-pass')),
          );

          expect(outcome, isA<UpdateDbError>());
          expectFailureResult(
            // The new password passed the check, so it is not removed.
            secrets: {'${_oldAddress}_password': 'new-pass'},
            deletedSids: [_oldAddress],
            totpDeclinedAddress: null,
            sessionsLoggedOut: 1,
          );
        });

        test('address changed: DB failure removes the new-address password '
            'only', () async {
          serversViewModel.shouldFailReplaceServer = true;
          final vm = buildViewModel();

          final outcome = await vm.updateServer.runAsync(
            updateReq(url: _newAddress),
          );

          expect(outcome, isA<UpdateDbError>());
          expectFailureResult(
            secrets: _oldSecrets,
            deletedSids: [_newAddress],
            totpDeclinedAddress: null,
            sessionsLoggedOut: 1,
          );
        });
      });
    });
  });
}
