import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/config_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/config.dart';

void main() {
  late ConfigRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchDnsQueryLogging', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = ConfigRepositoryV6(client: client, creds: creds);
    });

    test('should fetch DNS query logging successfully', () async {
      final result = await repository.fetchDnsQueryLogging();
      expect(result.getOrNull(), kRepoFetchDnsQueryLogging);
    });

    test('should fail when fetching DNS query logging fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchDnsQueryLogging();
      expectError(result, messageContains: 'Forced getConfigElement failure');
    });
  });

  group('setDnsQueryLogging', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = ConfigRepositoryV6(client: client, creds: creds);
    });

    test('should fetch DNS query logging successfully', () async {
      final result = await repository.setDnsQueryLogging(false);
      expect(result.getOrNull(), kRepoSetDnsQueryLogging);
    });

    test('should fail when fetching DNS query logging fails', () async {
      client.shouldFail = true;

      final result = await repository.setDnsQueryLogging(false);
      expectError(result, messageContains: 'Forced patchConfig failure');
    });
  });
}
