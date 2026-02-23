import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/v5/dns_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';

void main() {
  late DnsRepositoryV5 repository;
  late FakePiholeV5ApiClient client;
  late FakeSessionCredentialService creds;

  setUp(() {
    client = FakePiholeV5ApiClient();
    creds = FakeSessionCredentialService();
    repository = DnsRepositoryV5(client: client, creds: creds);
  });

  group('fetchBlockingStatus', () {
    test('should return blocking status on success', () async {
      final result = await repository.fetchBlockingStatus();
      expect(result.isSuccess(), true);
      expect(result.getOrThrow().status, DnsBlockingStatus.enabled);
    });

    test('should return error on failure', () async {
      client.shouldFail = true;
      final result = await repository.fetchBlockingStatus();
      expect(result.isError(), true);
    });
  });

  group('enableBlocking', () {
    test('should return enabled status on success', () async {
      final result = await repository.enableBlocking();
      expect(result.isSuccess(), true);
      expect(result.getOrThrow().status, DnsBlockingStatus.enabled);
    });

    test('should return error on failure', () async {
      client.shouldFail = true;
      final result = await repository.enableBlocking();
      expect(result.isError(), true);
    });
  });

  group('disableBlocking', () {
    test('should return disabled status on success', () async {
      final result = await repository.disableBlocking(30);
      expect(result.isSuccess(), true);
      expect(result.getOrThrow().status, DnsBlockingStatus.disabled);
    });

    test('should return error on failure', () async {
      client.shouldFail = true;
      final result = await repository.disableBlocking(30);
      expect(result.isError(), true);
    });
  });
}
