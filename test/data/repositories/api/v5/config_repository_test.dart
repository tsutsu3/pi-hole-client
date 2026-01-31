import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/config_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  group('NotSupportedException', () {
    late ConfigRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = ConfigRepositoryV5(client: client, creds: creds);
    });

    test('fetchDnsQueryLogging should return NotSupportedException', () async {
      final result = await repository.fetchDnsQueryLogging();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('setDnsQueryLogging should return NotSupportedException', () async {
      final result = await repository.setDnsQueryLogging(true);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
