import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/v6/adlist_repository.dart';

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
      repository = AdlistRepositoryV6(client: client, creds: creds);
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
      repository = AdlistRepositoryV6(client: client, creds: creds);
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
      repository = AdlistRepositoryV6(client: client, creds: creds);
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
      repository = AdlistRepositoryV6(client: client, creds: creds);
    });

    test('should remove adlist successfully', () async {
      final result = await repository.deleteAdlist(
        'https://example.com/adlist.txt',
      );
      expectSuccess(result);
    });

    test('should fail when deleting adlist', () async {
      client.shouldFail = true;

      final result = await repository.deleteAdlist(
        'https://example.com/adlist.txt',
      );
      expectError(result, messageContains: 'Forced deleteLists failure');
    });
  });
}
