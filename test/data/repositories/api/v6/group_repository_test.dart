import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/group_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/group.dart';

void main() {
  late GroupRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchAdlists', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = GroupRepositoryV6(client: client, creds: creds);
    });

    test('should get groups successfully', () async {
      final result = await repository.fetchGroups();
      expect(result.getOrNull(), kRepoFetchGroups);
    });

    test('should fail when fetching groups', () async {
      client.shouldFail = true;

      final result = await repository.fetchGroups();
      expectError(result, messageContains: 'Forced getGroups failure');
    });
  });
}
