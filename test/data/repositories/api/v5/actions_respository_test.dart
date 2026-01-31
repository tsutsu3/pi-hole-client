import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  group('NotSupportedException', () {
    late ActionsRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = ActionsRepositoryV5(client: client, creds: creds);
    });

    test('flushArp should return NotSupportedException', () async {
      final result = await repository.flushArp();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('flushLogs should return NotSupportedException', () async {
      final result = await repository.flushLogs();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('restartDns should return NotSupportedException', () async {
      final result = await repository.restartDns();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('updateGravity should return NotSupportedException', () async {
      final responseStream = repository.updateGravity();
      final response = await responseStream.last;
      expectError(response, messageContains: kNotSupportedInV5Message);
    });
  });
}
