import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  const sid = 'sid12345';

  late AuthRepositoryV5 repository;
  late FakePiholeV5ApiClient client;

  setUp(() {
    client = FakePiholeV5ApiClient();
    repository = AuthRepositoryV5(
      sid: sid,
      client: client,
    );
  });

  group('createSession', () {
    test('should return NotSupportedException', () async {
      final result = await repository.createSession('password123');
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });

  group('deleteCurrentSession', () {
    test('should return NotSupportedException', () async {
      final result = await repository.deleteCurrentSession();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });

  group('getAllSessions', () {
    test('should return NotSupportedException', () async {
      final result = await repository.getAllSessions();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });

  group('deleteSessionById', () {
    test('should return NotSupportedException', () async {
      final result = await repository.deleteSessionById(1);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
