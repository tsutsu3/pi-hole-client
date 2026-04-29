import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  late LocalDnsRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchRecords', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = LocalDnsRepositoryV6(client: client, sessionCache: V6SessionCache(creds: creds, client: client));
    });

    test('should fetch records successfully', () async {
      final result = await repository.fetchRecords();
      expect(result.isSuccess(), true);
      // kSrvGetConfigElement has no hosts configured → empty list
      expect(result.getOrNull(), isEmpty);
    });

    test('should fail when fetching config fails', () async {
      client.shouldFail = true;
      final result = await repository.fetchRecords();
      expectError(result, messageContains: 'Forced getConfigElement failure');
    });
  });

  group('addRecord', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = LocalDnsRepositoryV6(client: client, sessionCache: V6SessionCache(creds: creds, client: client));
    });

    test('should add record successfully', () async {
      final result = await repository.addRecord(
        ip: '192.168.1.100',
        name: 'mydevice',
      );
      expect(result.isSuccess(), true);
    });

    test('should fail when adding record fails', () async {
      client.shouldFail = true;
      final result = await repository.addRecord(
        ip: '192.168.1.100',
        name: 'mydevice',
      );
      expectError(result, messageContains: 'Forced putConfigElement failure');
    });
  });

  group('deleteRecord', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = LocalDnsRepositoryV6(client: client, sessionCache: V6SessionCache(creds: creds, client: client));
    });

    test('should delete record successfully', () async {
      final result = await repository.deleteRecord(
        ip: '192.168.1.100',
        name: 'mydevice',
      );
      expect(result.isSuccess(), true);
    });

    test('should fail when deleting record fails', () async {
      client.shouldFail = true;
      final result = await repository.deleteRecord(
        ip: '192.168.1.100',
        name: 'mydevice',
      );
      expectError(
        result,
        messageContains: 'Forced deleteConfigElement failure',
      );
    });
  });

  group('updateRecord', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = LocalDnsRepositoryV6(client: client, sessionCache: V6SessionCache(creds: creds, client: client));
    });

    test('should fail when fetching current config fails', () async {
      client.shouldFail = true;
      final result = await repository.updateRecord(
        record: const LocalDns(ip: '192.168.1.100', name: 'mydevice'),
        oldIp: '192.168.1.1',
      );
      expectError(result, messageContains: 'Forced getConfigElement failure');
    });

    test('should fail when entry with oldIp is not found in hosts', () async {
      final result = await repository.updateRecord(
        record: const LocalDns(ip: '192.168.1.100', name: 'newname'),
        oldIp: '10.0.0.1',
      );
      expectError(result, messageContains: 'Entry with IP');
    });
  });
}
