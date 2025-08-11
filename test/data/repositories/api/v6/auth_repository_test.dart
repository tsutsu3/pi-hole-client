import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/auth_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/auth.dart';

void main() {
  const sid = 'sid12345';

  late AuthRepositoryV6 repository;
  late FakePiholeV6ApiClient client;

  setUp(() {
    client = FakePiholeV6ApiClient();
    repository = AuthRepositoryV6(sid: sid, client: client);
  });

  group('createSession', () {
    test('should create a session successfully', () async {
      final result = await repository.createSession('password123');
      expectSuccess(result, kRepoCreateSession.toJson());
    });

    test('retries on failure', () async {
      client.shouldFailPostAuth = true;

      final result = await repository.createSession('password123');
      expectError(result, messageContains: 'Forced postAuth failure');
    });
  });

  group('deleteCurrentSession', () {
    test('should delete the current session successfully', () async {
      final result = await repository.deleteCurrentSession();
      expectSuccess(result);
    });

    test('retries on failure', () async {
      client.shouldFailDeleteAuth = true;

      final result = await repository.deleteCurrentSession();
      expectError(result, messageContains: 'Forced deleteAuth failure');
    });
  });

  group('getAllSessions', () {
    test('should return all sessions successfully', () async {
      final result = await repository.getAllSessions();
      expectListSuccess(
        result,
        kRepoGetAllSessions.map((s) => s.toJson()).toList(),
      );
    });

    test('retries on failure', () async {
      client.shouldFailGetAuthSessions = true;

      final result = await repository.getAllSessions();
      expectError(result, messageContains: 'Forced getAuthSessions failure');
    });
  });

  group('deleteSessionById', () {
    test('should delete a session by ID successfully', () async {
      final result = await repository.deleteSessionById(1);
      expectSuccess(result);
    });

    test('retries on failure', () async {
      client.shouldFailDeleteAuthSession = true;

      final result = await repository.deleteSessionById(1);
      expectError(result, messageContains: 'Forced deleteAuthSession failure');
    });
  });
}
