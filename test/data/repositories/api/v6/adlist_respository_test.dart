import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/model/v6/lists/lists.dart';
import 'package:pi_hole_client/data/repositories/api/v6/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/adlist.dart';

void main() {
  late AdlistRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchAdlists', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = AdlistRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
    });

    test('should get adlists successfully', () async {
      final result = await repository.fetchAdlists();
      expect(result.getOrNull(), kRepoFetchAdlists);
    });

    test('should fail when fetching adlists', () async {
      client.shouldFail = true;

      final result = await repository.fetchAdlists();
      expectError(result, messageContains: 'Forced getLists failure');
    });
  });

  group('addAdlist', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = AdlistRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
    });

    test('should add adlist successfully', () async {
      final result = await repository.addAdlist(
        'https://example.com/adlist.txt',
        ListType.block,
      );
      expect(result.getOrNull(), kRepoAddAdlist);
    });

    test('should fail when adding adlist', () async {
      client.shouldFail = true;

      final result = await repository.addAdlist(
        'https://example.com/adlist.txt',
        ListType.block,
      );
      expectError(result, messageContains: 'Forced postLists failure');
    });
  });

  group('updateAdlist', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = AdlistRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
    });

    test('should remove adlist successfully', () async {
      final result = await repository.updateAdlist(
        'https://example.com/adlist.txt',
        ListType.block,
      );
      expect(result.getOrNull(), kRepoUpdateAdlist);
    });

    test('should fail when updating adlist', () async {
      client.shouldFail = true;

      final result = await repository.updateAdlist(
        'https://example.com/adlist.txt',
        ListType.block,
      );
      expectError(result, messageContains: 'Forced putLists failure');
    });
  });

  group('deleteAdlist', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = AdlistRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
    });

    test('should remove adlist successfully', () async {
      final result = await repository.deleteAdlist(
        'https://example.com/adlist.txt',
        ListType.block,
      );
      expectSuccess(result);
    });

    test('should fail when deleting adlist', () async {
      client.shouldFail = true;

      final result = await repository.deleteAdlist(
        'https://example.com/adlist.txt',
        ListType.block,
      );
      expectError(result, messageContains: 'Forced deleteLists failure');
    });
  });

  group('already exists', () {
    // FTL v6.7 and later answer a duplicate with 400.
    const latestDuplicateBody =
        '{"error":{"key":"database_error",'
        ' "message":"Could not add to gravity database",'
        ' "hint":"The item is already present"}}';

    const address =
        'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts';

    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = AdlistRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
    });

    test('addAdlist: 400 from FTL v6.7 and later', () async {
      client.saveFailure = HttpStatusCodeException(400, latestDuplicateBody);

      final result = await repository.addAdlist(address, ListType.block);

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });

    // Older FTL answers 2xx and puts the reason in processed.errors. This is
    // the body seen from pihole:2025.02.7.
    test('addAdlist: 201 with processed.errors from older FTL', () async {
      client.postListsResponse = Lists.fromJson({
        'lists': [
          {
            'address': address,
            'comment': 'Migrated from /etc/pihole/adlists.list',
            'groups': [0],
            'enabled': true,
            'id': 1,
            'date_added': 1787485766,
            'date_modified': 1787485766,
            'type': 'block',
            'date_updated': 1787485769,
            'number': 93517,
            'invalid_domains': 0,
            'abp_entries': 0,
            'status': 1,
          },
        ],
        'processed': {
          'errors': [
            {
              'item': address,
              'error': 'UNIQUE constraint failed: adlist.address, adlist.type',
            },
          ],
          'success': <Object>[],
        },
        'took': 0.00035715103149414062,
      });

      final result = await repository.addAdlist(address, ListType.block);

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });
  });
}
