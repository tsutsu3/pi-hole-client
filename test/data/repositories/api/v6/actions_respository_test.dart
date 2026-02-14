import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/actions_respository.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/actions.dart';

void main() {
  late ActionsRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('flushArp', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = ActionsRepositoryV6(client: client, creds: creds);
    });

    test('should flush ARP successfully', () async {
      final result = await repository.flushArp();
      expectSuccess(result);
    });

    test('retries on failure', () async {
      client.shouldFail = true;

      final result = await repository.flushArp();
      expectError(
        result,
        messageContains: 'Forced postActionFlushNetwork failure',
      );
    });

    test('falls back to flush/arp when flush/network returns 404', () async {
      client.shouldFlushNetworkReturn404 = true;

      final result = await repository.flushArp();
      expectSuccess(result);
    });
  });

  group('flushLogs', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = ActionsRepositoryV6(client: client, creds: creds);
    });

    test('should flush logs successfully', () async {
      final result = await repository.flushLogs();
      expectSuccess(result);
    });

    test('retries on failure', () async {
      client.shouldFail = true;

      final result = await repository.flushLogs();
      expectError(
        result,
        messageContains: 'Forced postActionFlushLogs failure',
      );
    });
  });

  group('updateGravity', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = ActionsRepositoryV6(client: client, creds: creds);
    });

    test('should update gravity successfully', () async {
      final responses = <List<String>>[];

      await for (final res in repository.updateGravity()) {
        responses.add(res.getOrThrow());
      }

      expect(responses.length, kSrvPostActionGravity.length);
      expect(responses, kRepoGravity);
    });

    test('retries on failure', () async {
      client.shouldFail = true;

      final results = <Result<List<String>>>[];
      await for (final res in repository.updateGravity()) {
        results.add(res);
      }

      expect(results.length, 4);
      expectError(
        results.first,
        messageContains: 'Forced postActionGravity failure',
      );
    });
  });

  group('restartDns', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = ActionsRepositoryV6(client: client, creds: creds);
    });

    test('should restart DNS successfully', () async {
      final result = await repository.restartDns();
      expectSuccess(result);
    });

    test('retries on failure', () async {
      client.shouldFail = true;

      final result = await repository.restartDns();
      expectError(
        result,
        messageContains: 'Forced postActionRestartDns failure',
      );
    });
  });
}
