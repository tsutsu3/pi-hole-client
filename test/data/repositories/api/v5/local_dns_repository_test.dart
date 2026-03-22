import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  group('NotSupportedException', () {
    late LocalDnsRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = LocalDnsRepositoryV5(client: client, creds: creds);
    });

    test('fetchRecords should return NotSupportedException', () async {
      final result = await repository.fetchRecords();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('addRecord should return NotSupportedException', () async {
      final result = await repository.addRecord(
        ip: '192.168.1.1',
        name: 'mydevice',
      );
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('updateRecord should return NotSupportedException', () async {
      final result = await repository.updateRecord(
        record: const LocalDns(ip: '192.168.1.1', name: 'mydevice'),
        oldIp: '192.168.1.0',
      );
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('deleteRecord should return NotSupportedException', () async {
      final result = await repository.deleteRecord(
        ip: '192.168.1.1',
        name: 'mydevice',
      );
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
