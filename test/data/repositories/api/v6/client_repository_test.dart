import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/model/v6/clients/clients.dart';
import 'package:pi_hole_client/data/repositories/api/v6/client_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/client.dart';

void main() {
  late ClientRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  setUp(() {
    creds = FakeSessionCredentialService();
    client = FakePiholeV6ApiClient();
    repository = ClientRepositoryV6(
      client: client,
      sessionCache: V6SessionCache(creds: creds, client: client),
    );
  });

  group('fetchClients', () {
    test('should get clients successfully', () async {
      final result = await repository.fetchClients();
      expect(result.getOrNull(), kRepoFetchClients);
    });

    test('should fail when fetching clients', () async {
      client.shouldFail = true;

      final result = await repository.fetchClients();
      expectError(result, messageContains: 'Forced getClients failure');
    });
  });

  group('addClient', () {
    test('should add client successfully', () async {
      final result = await repository.addClient('10.0.0.1');
      expect(result.isSuccess(), true);
    });

    test('should fail when adding client', () async {
      client.shouldFail = true;

      final result = await repository.addClient('10.0.0.1');
      expectError(result, messageContains: 'Forced postClients failure');
    });
  });

  group('updateClient', () {
    test('should update client successfully', () async {
      final result = await repository.updateClient(
        '192.168.1.100',
        comment: 'updated',
        groups: [0, 5],
      );
      expect(result.isSuccess(), true);
    });

    test('should fail when updating client', () async {
      client.shouldFail = true;

      final result = await repository.updateClient('192.168.1.100');
      expectError(result, messageContains: 'Forced putClients failure');
    });
  });

  group('deleteClient', () {
    test('should delete client successfully', () async {
      final result = await repository.deleteClient('192.168.1.100');
      expect(result.isSuccess(), true);
    });

    test('should fail when deleting client', () async {
      client.shouldFail = true;

      final result = await repository.deleteClient('192.168.1.100');
      expectError(result, messageContains: 'Forced deleteClients failure');
    });
  });

  group('already exists', () {
    // FTL v6.7 and later answer a duplicate with 400.
    const latestDuplicateBody =
        '{"error":{"key":"database_error",'
        ' "message":"Could not add to gravity database",'
        ' "hint":"The item is already present"}}';

    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = ClientRepositoryV6(
        client: client,
        sessionCache: V6SessionCache(creds: creds, client: client),
      );
    });

    test('addClient: 400 from FTL v6.7 and later', () async {
      client.saveFailure = HttpStatusCodeException(400, latestDuplicateBody);

      final result = await repository.addClient('192.168.1.10');

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });

    // Older FTL (e.g. pihole:2025.02.7) answers 2xx and puts the reason in
    // processed.errors.
    test('addClient: 201 with processed.errors from older FTL', () async {
      client.postClientsResponse = kSrvPostClients.copyWith(
        processed: const Processed(
          success: [],
          errors: [
            ProcessedError(
              item: '192.168.1.10',
              error: 'UNIQUE constraint failed: client.ip',
            ),
          ],
        ),
      );

      final result = await repository.addClient('192.168.1.10');

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
      expect(client.saveCallCount, 1);
    });
  });
}
