import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v5/versions.dart';

void main() {
  group('NotSupportedException', () {
    late FtlRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV5(client: client, creds: creds);
    });

    test('fetchInfoClient should return NotSupportedException', () async {
      final result = await repository.fetchInfoClient();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('fetchInfoFtl should return NotSupportedException', () async {
      final result = await repository.fetchInfoFtl();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('fetchInfoHost should return NotSupportedException', () async {
      final result = await repository.fetchInfoHost();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('fetchInfoMessages should return NotSupportedException', () async {
      final result = await repository.fetchInfoMessages();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('deleteInfoMessage should return NotSupportedException', () async {
      final result = await repository.deleteInfoMessage(1);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('fetchInfoMetrics should return NotSupportedException', () async {
      final result = await repository.fetchInfoMetrics();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('fetchInfoSensors should return NotSupportedException', () async {
      final result = await repository.fetchInfoSensors();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('fetchInfoSystem should return NotSupportedException', () async {
      final result = await repository.fetchInfoSystem();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });

  group('fetchInfoVersion', () {
    late FtlRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV5(client: client, creds: creds);
    });

    test('should get info version successfully', () async {
      final result = await repository.fetchInfoVersion();
      expect(result.isSuccess(), true);
      final info = result.getOrNull();
      expect(info, kRepoInfoVersion);
    });

    test('should get info version with docker successfully', () async {
      client.isDocker = true;
      final result = await repository.fetchInfoVersion();
      expect(result.isSuccess(), true);
      final info = result.getOrNull();
      expect(info, kRepoInfoVersionWithDocker);
    });

    test('should return an error if fetching version fails', () async {
      client.shouldFail = true;
      final result = await repository.fetchInfoVersion();
      expect(result.isError(), true);
      expectError(result, messageContains: 'Failed to fetch versions');
    });
  });

  group('fetchAllServerInfo', () {
    late FtlRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV5(client: client, creds: creds);
    });

    test('should fetch all server info successfully', () async {
      final result = await repository.fetchAllServerInfo();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), kRepoInfoPiholeServer);
    });

    test('should fetch all server info with docker successfully', () async {
      client.isDocker = true;
      final result = await repository.fetchAllServerInfo();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), kRepoInfoPiholeServerWithDocker);
    });

    test('should return an error if fetching server info fails', () async {
      client.shouldFail = true;
      final result = await repository.fetchAllServerInfo();
      expect(result.isError(), true);
      expectError(result, messageContains: 'Failed to fetch versions');
    });
  });
}
