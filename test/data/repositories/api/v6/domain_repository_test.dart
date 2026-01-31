import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/v6/domain_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/domain.dart';

void main() {
  late DomainRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchAllDomains', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DomainRepositoryV6(client: client, creds: creds);
    });

    test('should fetch all domains successfully', () async {
      final result = await repository.fetchAllDomains();
      expect(result.getOrNull(), kRepoFetchAllDomains);
    });

    test('should fail when fetching all domains fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchAllDomains();
      expectError(result, messageContains: 'Forced getDomains failure');
    });
  });

  group('addDomain', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DomainRepositoryV6(client: client, creds: creds);
    });

    test('should add domain successfully', () async {
      final result = await repository.addDomain(
        DomainType.deny,
        DomainKind.exact,
        'example.com',
      );
      expect(result.getOrNull(), kRepoAddDomain);
    });

    test('should fail when adding domain fails', () async {
      client.shouldFail = true;

      final result = await repository.addDomain(
        DomainType.deny,
        DomainKind.exact,
        'example.com',
      );
      expectError(result, messageContains: 'Forced postDomains failure');
    });
  });

  group('updateDomain', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DomainRepositoryV6(client: client, creds: creds);
    });

    test('should update domain successfully', () async {
      final result = await repository.updateDomain(
        DomainType.deny,
        DomainKind.exact,
        'example.com',
        comment: 'test',
        groups: [1],
        enabled: false,
      );
      expect(result.getOrNull(), kRepoUpdateDomain);
    });

    test('should fail when updating domain fails', () async {
      client.shouldFail = true;

      final result = await repository.updateDomain(
        DomainType.deny,
        DomainKind.exact,
        'example.com',
        comment: 'test',
        groups: [1],
        enabled: false,
      );
      expectError(result, messageContains: 'Forced putDomains failure');
    });
  });

  group('deleteDomain', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DomainRepositoryV6(client: client, creds: creds);
    });

    test('should delete domain successfully', () async {
      final result = await repository.deleteDomain(
        DomainType.deny,
        DomainKind.exact,
        'example.com',
      );
      expectSuccess(result);
    });

    test('should fail when deleting domain fails', () async {
      client.shouldFail = true;

      final result = await repository.deleteDomain(
        DomainType.deny,
        DomainKind.exact,
        'example.com',
      );
      expectError(result, messageContains: 'Forced deleteDomains failure');
    });
  });
}
