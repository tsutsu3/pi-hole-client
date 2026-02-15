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

  setUp(() {
    creds = FakeSessionCredentialService();
    client = FakePiholeV6ApiClient();
    repository = GroupRepositoryV6(client: client, creds: creds);
  });

  group('fetchGroups', () {
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

  group('addGroup', () {
    test('should add group successfully', () async {
      final result = await repository.addGroup('NewGroup');
      expect(result.isSuccess(), true);
    });

    test('should fail when adding group', () async {
      client.shouldFail = true;

      final result = await repository.addGroup('NewGroup');
      expectError(result, messageContains: 'Forced postGroups failure');
    });
  });

  group('updateGroup', () {
    test('should update group successfully', () async {
      final result = await repository.updateGroup(
        'test',
        comment: 'updated',
        enabled: false,
      );
      expect(result.isSuccess(), true);
    });

    test('should fail when updating group', () async {
      client.shouldFail = true;

      final result = await repository.updateGroup('test');
      expectError(result, messageContains: 'Forced putGroups failure');
    });
  });

  group('deleteGroup', () {
    test('should delete group successfully', () async {
      final result = await repository.deleteGroup('test');
      expect(result.isSuccess(), true);
    });

    test('should fail when deleting group', () async {
      client.shouldFail = true;

      final result = await repository.deleteGroup('test');
      expectError(result, messageContains: 'Forced deleteGroups failure');
    });
  });
}
