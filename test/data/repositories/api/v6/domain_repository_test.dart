import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/model/v6/domains/domains.dart';
import 'package:pi_hole_client/data/repositories/api/v6/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

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
      repository = DomainRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
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
      repository = DomainRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
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
      repository = DomainRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
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
      repository = DomainRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
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
          item: 'example.com',
          error: 'UNIQUE constraint failed: domainlist.domain, domainlist.type',
        ),
      ],
    );

    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = DomainRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
    });

    test('addDomain: 400 from FTL v6.7 and later', () async {
      client.saveFailure = HttpStatusCodeException(400, latestDuplicateBody);

      final result = await repository.addDomain(
        DomainType.allow,
        DomainKind.exact,
        'example.com',
      );

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });

    test('addDomain: 201 with processed.errors from older FTL', () async {
      client.postDomainsResponse = kSrvPostDomains.copyWith(
        processed: olderProcessed,
      );

      final result = await repository.addDomain(
        DomainType.allow,
        DomainKind.exact,
        'example.com',
      );

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });

    test('updateDomain: 400 from FTL v6.7 and later', () async {
      client.saveFailure = HttpStatusCodeException(400, latestDuplicateBody);

      final result = await repository.updateDomain(
        DomainType.allow,
        DomainKind.exact,
        'example.com',
      );

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });

    test('updateDomain: 200 with processed.errors from older FTL', () async {
      client.putDomainsResponse = kSrvPutDomains.copyWith(
        processed: olderProcessed,
      );

      final result = await repository.updateDomain(
        DomainType.allow,
        DomainKind.exact,
        'example.com',
      );

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });
  });
}
