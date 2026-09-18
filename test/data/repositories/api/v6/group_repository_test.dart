import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/model/v6/groups/groups.dart';
import 'package:pi_hole_client/data/repositories/api/v6/group_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

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
    repository = GroupRepositoryV6(
      client: client,
      sessionCache: V6SessionCache(creds: creds, client: client),
    );
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
    test('should update comment and enabled without re-fetching', () async {
      final result = await repository.updateGroup(
        'test',
        comment: 'updated',
        enabled: false,
      );
      expect(result.isSuccess(), true);
    });

    test('should re-fetch and return the renamed group', () async {
      client.getGroupsResponse = kSrvGetGroupsAfterRename;

      final result = await repository.updateGroup('test', newName: 'renamed');

      expect(client.lastPutGroupsNewName, 'renamed');
      expect(result.getOrNull()?.name, 'renamed');
      expect(result.getOrNull()?.id, 5);
    });

    // Unexpected: the Pi-hole server renamed the group but does not list it.
    test(
      'should fail when the renamed group is not found after re-fetching',
      () async {
        final result = await repository.updateGroup('test', newName: 'missing');
        expectError(result, messageContains: 'Group missing not found');
      },
    );

    // Unexpected: the Pi-hole server returned no group without a rename.
    test(
      'should fail when an empty group list is returned without a rename',
      () async {
        client.shouldPutGroupsReturnEmpty = true;

        final result = await repository.updateGroup('test', comment: 'updated');
        expectError(result, messageContains: 'was updated but not returned');
      },
    );

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

  group('already exists', () {
    // FTL v6.7 and later answer a duplicate with 400.
    const latestDuplicateBody =
        '{"error":{"key":"database_error",'
        ' "message":"Could not add to gravity database",'
        ' "hint":"The item is already present"}}';

    // Older FTL (e.g. pihole:2025.02.7) answers 2xx and puts the reason in
    // processed.errors.
    const olderProcessed = Processed(
      success: [],
      errors: [
        ProcessedError(
          item: 'group',
          error: 'UNIQUE constraint failed: group.name',
        ),
      ],
    );

    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = GroupRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
    });

    test('addGroup: 400 from FTL v6.7 and later', () async {
      client.saveFailure = HttpStatusCodeException(400, latestDuplicateBody);

      final result = await repository.addGroup('group');

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });

    test('addGroup: 201 with processed.errors from older FTL', () async {
      client.postGroupsResponse = kSrvPostGroups.copyWith(
        processed: olderProcessed,
      );

      final result = await repository.addGroup('group');

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });

    test('updateGroup (rename): 400 from FTL v6.7 and later', () async {
      client.saveFailure = HttpStatusCodeException(400, latestDuplicateBody);

      final result = await repository.updateGroup('group', newName: 'other');

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });

    test(
      'updateGroup (rename): 200 with processed.errors from older FTL',
      () async {
        client.putGroupsResponse = kSrvPutGroups.copyWith(
          processed: olderProcessed,
        );

        final result = await repository.updateGroup('group', newName: 'other');

        expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
        expect(client.saveCallCount, 1);
      },
    );

    test('other errors are still retried once', () async {
      client.saveFailure = HttpStatusCodeException(500, 'Server error');

      final result = await repository.addGroup('group');

      expect(result.exceptionOrNull(), isNot(isA<AlreadyExistsException>()));
      expect(client.saveCallCount, 2);
    });
  });
}
