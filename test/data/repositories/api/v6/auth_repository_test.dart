import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/auth_repository.dart';

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
    repository = AuthRepositoryV6(client: client, creds: creds);
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
