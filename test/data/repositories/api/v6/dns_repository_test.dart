import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/dns_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/dns.dart';

void main() {
  late DnsRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchBlockingStatus', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DnsRepositoryV6(client: client, creds: creds);
    });

    test('should fetch DNS blocking status successfully', () async {
      final result = await repository.fetchBlockingStatus();
      expect(result.getOrNull(), kRepoFetchDnsBlocking);
    });

    test('should fail when fetching DNS blocking status fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchBlockingStatus();
      expectError(result, messageContains: 'Forced getDnsBlocking failure');
    });
  });

  group('enableBlocking', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DnsRepositoryV6(client: client, creds: creds);
    });

    test('should enable DNS blocking successfully', () async {
      client.shouldPostDnsBlockingReturnEnabled = true;
      final result = await repository.enableBlocking();
      expect(result.getOrNull(), kRepoEnableDnsBlocking);
    });

    test('should fail when enabling DNS blocking fails', () async {
      client.shouldFail = true;

      final result = await repository.enableBlocking();
      expectError(result, messageContains: 'Forced postDnsBlocking failure');
    });
  });

  group('disableBlocking', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DnsRepositoryV6(client: client, creds: creds);
    });

    test('should disable DNS blocking successfully', () async {
      client.shouldPostDnsBlockingReturnEnabled = false;
      final result = await repository.disableBlocking(30);
      expect(result.getOrNull(), kRepoDisableDnsBlocking);
    });

    test('should fail when disabling DNS blocking fails', () async {
      client.shouldFail = true;

      final result = await repository.disableBlocking(30);
      expectError(result, messageContains: 'Forced postDnsBlocking failure');
    });
  });
}
