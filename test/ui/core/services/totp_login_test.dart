import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/services/totp_login.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../testing/fakes/repositories/api/fake_auth_repository.dart';

void main() {
  group('runTotpLogin', () {
    late FakeAuthRepository auth;

    setUp(() {
      auth = FakeAuthRepository();
    });

    test('non-2FA server logs in on the first attempt', () async {
      var prompts = 0;
      final outcome = await runTotpLogin(
        auth: auth,
        password: 'pass',
        resolveTotp: ({error}) async {
          prompts++;
          return '123456';
        },
      );

      expect(outcome.cancelled, isFalse);
      expect(outcome.result.isSuccess(), isTrue);
      expect(auth.createSessionCallCount, 1);
      expect(prompts, 0);
    });

    test('a non-TOTP error is returned without prompting', () async {
      auth.shouldFail = true;
      var prompts = 0;
      final outcome = await runTotpLogin(
        auth: auth,
        password: 'pass',
        resolveTotp: ({error}) async {
          prompts++;
          return '123456';
        },
      );

      expect(outcome.cancelled, isFalse);
      expect(outcome.result.isError(), isTrue);
      expect(prompts, 0);
    });

    test('2FA server prompts and logs in with a valid code', () async {
      auth
        ..shouldRequireTotp = true
        ..validTotp = '123456';

      final outcome = await runTotpLogin(
        auth: auth,
        password: 'pass',
        resolveTotp: ({error}) async => '123456',
      );

      expect(outcome.cancelled, isFalse);
      expect(outcome.result.isSuccess(), isTrue);
      expect(auth.createSessionCallCount, 2); // pw-only + pw+totp
      expect(auth.lastTotp, '123456');
    });

    test('invalid code re-prompts then succeeds', () async {
      auth
        ..shouldRequireTotp = true
        ..validTotp = '123456';
      final codes = ['000000', '123456'];
      var prompts = 0;

      final outcome = await runTotpLogin(
        auth: auth,
        password: 'pass',
        resolveTotp: ({error}) async => codes[prompts++],
      );

      expect(outcome.cancelled, isFalse);
      expect(outcome.result.isSuccess(), isTrue);
      expect(prompts, 2);
      expect(auth.createSessionCallCount, 3);
    });

    test('reused code re-prompts then succeeds', () async {
      auth
        ..shouldRequireTotp = true
        ..totpFailures.add(TotpReusedException());
      var prompts = 0;

      final outcome = await runTotpLogin(
        auth: auth,
        password: 'pass',
        resolveTotp: ({error}) async {
          prompts++;
          return '123456';
        },
      );

      expect(outcome.cancelled, isFalse);
      expect(outcome.result.isSuccess(), isTrue);
      expect(prompts, 2);
    });

    test('a rate-limit error is terminal (no further prompts)', () async {
      auth
        ..shouldRequireTotp = true
        ..totpFailures.add(TotpRateLimitException());
      var prompts = 0;

      final outcome = await runTotpLogin(
        auth: auth,
        password: 'pass',
        resolveTotp: ({error}) async {
          prompts++;
          return '123456';
        },
      );

      expect(outcome.cancelled, isFalse);
      expect(outcome.result.isError(), isTrue);
      expect(outcome.result.exceptionOrNull(), isA<TotpRateLimitException>());
      expect(prompts, 1);
    });

    test('cancelling the prompt returns cancelled', () async {
      auth.shouldRequireTotp = true;

      final outcome = await runTotpLogin(
        auth: auth,
        password: 'pass',
        resolveTotp: ({error}) async => null,
      );

      expect(outcome.cancelled, isTrue);
      // Only the password-only attempt ran.
      expect(auth.createSessionCallCount, 1);
    });
  });
}
