import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/network_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  group('NotSupportedException', () {
    late NetworkRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = NetworkRepositoryV5(client: client, creds: creds);
    });

    test('fetchDevices should return NotSupportedException', () async {
      final result = await repository.fetchDevices();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('deleteDevice should return NotSupportedException', () async {
      final result = await repository.deleteDevice(1);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('fetchGateways should return NotSupportedException', () async {
      final result = await repository.fetchGateways();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
