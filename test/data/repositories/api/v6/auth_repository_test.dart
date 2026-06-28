import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/auth.dart';

void main() {
  late AuthRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  setUp(() {
    client = FakePiholeV6ApiClient();
    creds = FakeSessionCredentialService();
    repository = AuthRepositoryV6(
      client: client,
      sessionCache: V6SessionCache(creds: creds, client: client),
    );
  });

  group('createSession', () {
    test('should create a session successfully', () async {
      final result = await repository.createSession('password123');
      expect(result.getOrNull(), kRepoCreateSession);
    });

    test('returns error when API fails', () async {
      client.shouldFail = true;

      final result = await repository.createSession('password123');
      expectError(result, messageContains: 'Forced postAuth failure');
    });

    test(
      'succeeds without persisting a sid when no app password is set',
      () async {
        client.shouldReturnNoPasswordSession = true;

        final result = await repository.createSession('');

        expect(result.isSuccess(), isTrue);
        expect(result.getOrNull()!.valid, isTrue);
        expect(result.getOrNull()!.sid, '');
        expect(creds.saveSidCallCount, 0);
      },
    );

    test('forwards the totp code to the API client as an int', () async {
      await repository.createSession('password123', totp: '123456');

      expect(client.lastTotp, 123456);
    });

    test('propagates TotpRequiredException from a 2FA server', () async {
      client.shouldRequireTotp = true;

      final result = await repository.createSession('password123');

      expect(result.isError(), isTrue);
      expect(result.exceptionOrNull(), isA<TotpRequiredException>());
    });

    test('propagates TotpInvalidException from a 2FA server', () async {
      client.shouldRequireTotp = true;
      client.validTotp = 123456;

      final result = await repository.createSession(
        'password123',
        totp: '654321',
      );

      expect(result.isError(), isTrue);
      expect(result.exceptionOrNull(), isA<TotpInvalidException>());
    });
  });

  group('getAuth', () {
    test('reports the server 2FA status (disabled)', () async {
      final result = await repository.getAuth(useSid: false);

      expect(result.getOrNull()?.totp, isFalse);
      expect(client.getAuthCallCount, 1);
    });

    test('reports when the server has 2FA enabled', () async {
      client.serverTotpEnabled = true;

      final result = await repository.getAuth(useSid: false);

      expect(result.getOrNull()?.totp, isTrue);
    });

    test('returns error when the API fails', () async {
      client.shouldFail = true;

      final result = await repository.getAuth(useSid: false);

      expectError(result, messageContains: 'Forced getAuth failure');
    });
  });

  group('deleteCurrentSession', () {
    test('should delete the current session successfully', () async {
      final result = await repository.deleteCurrentSession();
      expectSuccess(result);
    });

    test('returns error when API fails', () async {
      client.shouldFail = true;

      final result = await repository.deleteCurrentSession();
      expectError(result, messageContains: 'Forced deleteAuth failure');
    });
  });

  group('getAllSessions', () {
    test('should return all sessions successfully', () async {
      final result = await repository.getAllSessions();
      expect(result.getOrNull(), kRepoGetAllSessions);
    });

    test('returns error when API fails', () async {
      client.shouldFail = true;

      final result = await repository.getAllSessions();
      expectError(result, messageContains: 'Forced getAuthSessions failure');
    });
  });

  group('deleteSessionById', () {
    test('should delete a session by ID successfully', () async {
      final result = await repository.deleteSessionById(1);
      expectSuccess(result);
    });

    test('returns error when API fails', () async {
      client.shouldFail = true;

      final result = await repository.deleteSessionById(1);
      expectError(result, messageContains: 'Forced deleteAuthSession failure');
    });
  });
}
