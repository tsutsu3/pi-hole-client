import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

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

    test('getInfoClient should return NotSupportedException', () async {
      final result = await repository.getInfoClient();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('getInfoFtl should return NotSupportedException', () async {
      final result = await repository.getInfoFtl();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('getInfoHost should return NotSupportedException', () async {
      final result = await repository.getInfoHost();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('getInfoMessages should return NotSupportedException', () async {
      final result = await repository.getInfoMessages();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('deleteInfoMessage should return NotSupportedException', () async {
      final result = await repository.deleteInfoMessage(1);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('getInfoMetrics should return NotSupportedException', () async {
      final result = await repository.getInfoMetrics();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('getInfoSystem should return NotSupportedException', () async {
      final result = await repository.getInfoSystem();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });

  group('getInfoVersion', () {
    late FtlRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = FtlRepositoryV5(client: client, creds: creds);
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
  });
}
