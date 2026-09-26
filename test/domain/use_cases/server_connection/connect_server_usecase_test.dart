import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/server/server_auth.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/connect_server_usecase.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/resolve_totp.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../testing/fakes/repositories/api/fake_auth_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_dns_repository.dart';

class _RecordingDns extends FakeDnsRepository {
  _RecordingDns([this._failures = const []]);

  final List<Exception?> _failures;
  final List<bool> skipRenewals = [];

  @override
  Future<Result<Blocking>> fetchBlockingStatus({bool skipRenewal = false}) {
    final index = skipRenewals.length;
    skipRenewals.add(skipRenewal);
    final ex = index < _failures.length ? _failures[index] : null;
    if (ex != null) return Future.value(Failure(ex));
    return super.fetchBlockingStatus(skipRenewal: skipRenewal);
  }
}

Matcher _isSuccess({required bool sessionCreated}) => isA<ConnectSuccess>()
    .having((o) => o.sessionCreated, 'sessionCreated', sessionCreated);

Matcher _isFailed({required bool sessionCreated}) => isA<ConnectFailed>()
    .having((o) => o.sessionCreated, 'sessionCreated', sessionCreated);

void main() {
  group('ConnectServerUseCase', () {
    late FakeAuthRepository auth;
    late _RecordingDns dns;

    setUp(() {
      auth = FakeAuthRepository();
      dns = _RecordingDns();
    });

    Future<ConnectOutcome> connect(
      ServerAuth serverAuth,
      SessionPolicy policy, {
      ResolveTotp? resolveTotp,
    }) {
      return ConnectServerUseCase(auth: auth, dns: dns).connect(
        auth: serverAuth,
        policy: policy,
        resolveTotp: resolveTotp ?? ({error}) async => null,
      );
    }

    /// Checks the calls one connect() made. The number of logins, and the
    /// skipRenewal value of each status check, in order.
    void expectCalls({required int logins, required List<bool> statusChecks}) {
      expect(
        auth.createSessionCallCount,
        logins,
        reason: 'createSession calls',
      );
      expect(
        dns.skipRenewals,
        statusChecks,
        reason: 'skipRenewal of each fetchBlockingStatus call',
      );
    }

    group('token auth (v5)', () {
      for (final policy in SessionPolicy.values) {
        test('only checks the status ($policy)', () async {
          final outcome = await connect(const TokenAuth('token'), policy);

          expect(outcome, _isSuccess(sessionCreated: false));
          expectCalls(logins: 0, statusChecks: [false]);
        });
      }

      test('returns ConnectFailed when the status check fails', () async {
        dns.shouldFail = true;

        final outcome = await connect(
          const TokenAuth('token'),
          SessionPolicy.forceNew,
        );

        expect(outcome, _isFailed(sessionCreated: false));
        expectCalls(logins: 0, statusChecks: [false]);
      });
    });

    group('no auth', () {
      test('reuseIfValid only checks the status', () async {
        final outcome = await connect(
          const NoAuth(),
          SessionPolicy.reuseIfValid,
        );

        expect(outcome, _isSuccess(sessionCreated: false));
        expectCalls(logins: 0, statusChecks: [false]);
      });

      test('forceNew login with an empty password', () async {
        final outcome = await connect(const NoAuth(), SessionPolicy.forceNew);

        expect(outcome, _isSuccess(sessionCreated: true));
        expectCalls(logins: 1, statusChecks: [true]);
        expect(auth.lastPassword, '');
      });
    });

    group('password auth, reuseIfValid', () {
      test('uses the live session without login', () async {
        final outcome = await connect(
          const PasswordAuth('pass'),
          SessionPolicy.reuseIfValid,
        );

        expect(outcome, _isSuccess(sessionCreated: false));
        // The probe result is used as is - no second status check.
        expectCalls(logins: 0, statusChecks: [true]);
      });

      for (final error in [
        HttpStatusCodeException(401),
        SidNotFoundException(),
      ]) {
        test('login again on ${error.runtimeType}', () async {
          dns = _RecordingDns([error]);

          final outcome = await connect(
            const PasswordAuth('pass'),
            SessionPolicy.reuseIfValid,
          );

          expect(outcome, _isSuccess(sessionCreated: true));
          expectCalls(logins: 1, statusChecks: [true, true]);
        });
      }

      test('does not login on a transient 503', () async {
        dns = _RecordingDns([HttpStatusCodeException(503)]);

        final outcome = await connect(
          const PasswordAuth('pass'),
          SessionPolicy.reuseIfValid,
        );

        expect(outcome, _isFailed(sessionCreated: false));
        expectCalls(logins: 0, statusChecks: [true]);
        expect(
          (outcome as ConnectFailed).error,
          isA<HttpStatusCodeException>(),
        );
      });
    });

    group('password auth, forceNew', () {
      test('login, then checks the status without renewal', () async {
        final outcome = await connect(
          const PasswordAuth('pass'),
          SessionPolicy.forceNew,
        );

        expect(outcome, _isSuccess(sessionCreated: true));
        expectCalls(logins: 1, statusChecks: [true]);
        expect(auth.lastPassword, 'pass');
      });

      test(
        'returns ConnectFailed without a session when login fails',
        () async {
          auth.shouldFail = true;

          final outcome = await connect(
            const PasswordAuth('pass'),
            SessionPolicy.forceNew,
          );

          expect(outcome, _isFailed(sessionCreated: false));
          expectCalls(logins: 1, statusChecks: []);
        },
      );

      test('reports the new session when the status check fails', () async {
        dns.shouldFail = true;

        final outcome = await connect(
          const PasswordAuth('pass'),
          SessionPolicy.forceNew,
        );

        expect(outcome, _isFailed(sessionCreated: true));
        expectCalls(logins: 1, statusChecks: [true]);
      });
    });

    group('2FA', () {
      test('prompts for a code and login', () async {
        auth
          ..shouldRequireTotp = true
          ..validTotp = '123456';

        final outcome = await connect(
          const PasswordAuth('pass'),
          SessionPolicy.forceNew,
          resolveTotp: ({error}) async => '123456',
        );

        expect(outcome, _isSuccess(sessionCreated: true));
        // 2: password, valid totp
        expectCalls(logins: 2, statusChecks: [true]);
        expect(auth.lastTotp, '123456');
      });

      test('re-prompts on an invalid code, then login', () async {
        auth
          ..shouldRequireTotp = true
          ..validTotp = '123456';
        final promptErrors = <TotpPromptError?>[];

        final outcome = await connect(
          const PasswordAuth('pass'),
          SessionPolicy.forceNew,
          resolveTotp: ({error}) async {
            promptErrors.add(error);
            // First prompt: the user types a wrong code. Second: the right one.
            return promptErrors.length == 1 ? '000000' : '123456';
          },
        );

        expect(outcome, _isSuccess(sessionCreated: true));
        // 3: password, invalid totp, valid totp
        expectCalls(logins: 3, statusChecks: [true]);
        expect(promptErrors, [null, TotpPromptError.invalid]);
      });

      test('returns ConnectCancelled when the prompt is dismissed', () async {
        auth.shouldRequireTotp = true;

        final outcome = await connect(
          const PasswordAuth('pass'),
          SessionPolicy.forceNew,
        );

        expect(outcome, isA<ConnectCancelled>());
        // Only the password-only login ran.
        expectCalls(logins: 1, statusChecks: []);
      });
    });
  });
}
