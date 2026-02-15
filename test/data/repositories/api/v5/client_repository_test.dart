import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/client_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  group('NotSupportedException', () {
    late ClientRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = ClientRepositoryV5(client: client, creds: creds);
    });

    test('fetchClients should return NotSupportedException', () async {
      final result = await repository.fetchClients();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('addClient should return NotSupportedException', () async {
      final result = await repository.addClient('10.0.0.1');
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('updateClient should return NotSupportedException', () async {
      final result = await repository.updateClient('10.0.0.1');
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('deleteClient should return NotSupportedException', () async {
      final result = await repository.deleteClient('10.0.0.1');
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
