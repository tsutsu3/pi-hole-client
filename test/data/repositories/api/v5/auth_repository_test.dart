import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  const password = 'pass123';

  group('NotSupportedException', () {
    late AuthRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = AuthRepositoryV5(client: client, creds: creds);
    });

    test('createSession should return NotSupportedException', () async {
      final result = await repository.createSession(password);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('deleteCurrentSession should return NotSupportedException', () async {
      final result = await repository.deleteCurrentSession();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('getAllSessions should return NotSupportedException', () async {
      final result = await repository.getAllSessions();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('deleteSessionById should return NotSupportedException', () async {
      final result = await repository.deleteSessionById(1);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
