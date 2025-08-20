import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/network_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/network.dart';

void main() {
  late NetworkRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchDevices', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = NetworkRepositoryV6(client: client, creds: creds);
    });

    test('should get devices successfully', () async {
      final result = await repository.fetchDevices();
      expect(result.getOrNull(), kRepoFetchDevices);
    });

    test('should fail when fetching devices', () async {
      client.shouldFail = true;

      final result = await repository.fetchDevices();
      expectError(result, messageContains: 'Forced getNetworkDevices failure');
    });
  });

  group('deleteDevice', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = NetworkRepositoryV6(client: client, creds: creds);
    });

    test('should get devices successfully', () async {
      final result = await repository.deleteDevice(1);
      expectSuccess(result);
    });

    test('should fail when fetching devices', () async {
      client.shouldFail = true;

      final result = await repository.deleteDevice(1);
      expectError(
        result,
        messageContains: 'Forced deleteNetworkDevices failure',
      );
    });
  });

  group('fetchGateways', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = NetworkRepositoryV6(client: client, creds: creds);
    });

    test('should get gateways successfully', () async {
      final result = await repository.fetchGateways();
      expect(result.getOrNull(), kRepoFetchGateways);
    });

    test('should get detailed gateways successfully', () async {
      final result = await repository.fetchGateways(isDetailed: true);
      expect(result.getOrNull(), kRepoFetchGatewaysDetailed);
    });

    test('should fail when fetching gateways', () async {
      client.shouldFail = true;

      final result = await repository.fetchGateways();
      expectError(result, messageContains: 'Forced getNetworkGateway failure');
    });
  });
}
