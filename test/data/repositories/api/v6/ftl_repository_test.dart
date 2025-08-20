import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/ftl_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/ftl.dart';

void main() {
  late FtlRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchInfoClient', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch info client successfully', () async {
      final result = await repository.fetchInfoClient();
      expect(result.getOrNull(), kRepoFetchInfoClient);
    });

    test('should fail when fetching info client fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchInfoClient();
      expectError(result, messageContains: 'Forced getInfoClient failure');
    });
  });

  group('fetchInfoFtl', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch info ftl successfully', () async {
      final result = await repository.fetchInfoFtl();
      expect(result.getOrNull(), kRepoFetchInfoFtl);
    });

    test('should fail when fetching info ftl fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchInfoFtl();
      expectError(result, messageContains: 'Forced getInfoFtl failure');
    });
  });

  group('fetchInfoHost', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch info host successfully', () async {
      final result = await repository.fetchInfoHost();
      expect(result.getOrNull(), kRepoFetchInfoHost);
    });

    test('should fail when fetching info host fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchInfoHost();
      expectError(result, messageContains: 'Forced getInfoHost failure');
    });
  });

  group('fetchInfoMessages', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch gravity messages successfully', () async {
      final result = await repository.fetchInfoMessages();
      expect(result.getOrNull(), kRepoFetchInfoMessages);
    });

    test('should fail when fetching gravity messages fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchInfoMessages();
      expectError(result, messageContains: 'Forced getInfoMessages failure');
    });
  });

  group('deleteInfoMessage', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should delete info message successfully', () async {
      final result = await repository.deleteInfoMessage(1);
      expectSuccess(result);
    });

    test('should fail when deleting info message fails', () async {
      client.shouldFail = true;

      final result = await repository.deleteInfoMessage(1);
      expectError(result, messageContains: 'Forced deleteInfoMessages failure');
    });
  });

  group('fetchInfoMetrics', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch info metrics successfully', () async {
      final result = await repository.fetchInfoMetrics();
      expect(result.getOrNull(), kRepoFetchInfoMetrics);
    });

    test('should fail when fetching info metrics fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchInfoMetrics();
      expectError(result, messageContains: 'Forced getInfoMetrics failure');
    });
  });

  group('fetchInfoSensors', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch all sensors successfully', () async {
      final result = await repository.fetchInfoSensors();
      expect(result.getOrNull(), kRepoFetchInfoSensors);
    });

    test('should fail when fetching all sensors fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchInfoSensors();
      expectError(result, messageContains: 'Forced getInfoSensors failure');
    });
  });

  group('fetchInfoSystem', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch info system successfully', () async {
      final result = await repository.fetchInfoSystem();
      expect(result.getOrNull(), kRepoFetchInfoSystem);
    });

    test('should fetch info system successfully (FTL < 6.1)', () async {
      client.shouldGetInfoSystemOld = true;
      final result = await repository.fetchInfoSystem();
      expect(result.getOrNull(), kRepoFetchInfoSystemOld);
    });

    test('should fail when fetching info system fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchInfoSystem();
      expectError(result, messageContains: 'Forced getInfoSystem failure');
    });
  });

  group('fetchInfoVersion', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch info version successfully', () async {
      final result = await repository.fetchInfoVersion();
      expect(result.getOrNull(), kRepoFetchInfoVersion);
    });

    test('should fetch info version successfully (with Docker)', () async {
      client.shouldGetInfoVersionWithDocker = true;
      final result = await repository.fetchInfoVersion();
      expect(result.getOrNull(), kRepoFetchInfoVersionWithDocker);
    });

    test('should fail when fetching info version fails', () async {
      client.shouldFail = true;

      final result = await repository.fetchInfoVersion();
      expectError(result, messageContains: 'Forced getInfoVersion failure');
    });
  });

  group('fetchAllServerInfo', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV6(client: client, creds: creds);
    });

    test('should fetch all server info successfully', () async {
      final result = await repository.fetchAllServerInfo();
      expect(result.getOrNull(), kRepoFetchAllServerInfo);
    });

    test('should fail when fetching all server info fails', () async {
      client.shouldFail = true;
      final result = await repository.fetchAllServerInfo();
      expectError(result, messageContains: 'Forced getInfoHost failure');
    });
  });
}
