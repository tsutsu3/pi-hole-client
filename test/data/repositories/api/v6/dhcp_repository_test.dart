import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/dhcp_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/dhcp.dart';

void main() {
  late DhcpRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchDhcpLeases', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DhcpRepositoryV6(client: client, creds: creds);
    });

    test('should fetch DHCP leases successfully', () async {
      final result = await repository.fetchDhcpLeases();
      expect(result.getOrNull(), kRepoFetchDhcpLeases);
    });

    test('should fail when fetching DHCP leases fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchDhcpLeases();
      expectError(result, messageContains: 'Forced getDhcpLeases failure');
    });
  });

  group('deleteDhcpLeaseByIp', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = DhcpRepositoryV6(client: client, creds: creds);
    });

    test('should fetch DHCP lease successfully', () async {
      final result = await repository.deleteDhcpLeaseByIp('192.168.2.111');
      expectSuccess(result);
    });

    test('should fail when fetching DHCP lease fails', () async {
      client.shouldFail = true;

      final result = await repository.deleteDhcpLeaseByIp('192.168.2.111');
      expectError(result, messageContains: 'Forced deleteDhcpLeases failure');
    });
  });
}
