import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/actions_respository.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/actions.dart';

void main() {
  const sid = 'sid12345';

  late ActionsRepositoryV6 repository;
  late FakePiholeV6ApiClient client;

  setUp(() {
    client = FakePiholeV6ApiClient();
    repository = ActionsRepositoryV6(sid: sid, client: client);
  });

  group('flushArp', () {
    test('should flush ARP successfully', () async {
      final result = await repository.flushArp();
      expectSuccess(result);
    });

    test('retries on failure', () async {
      client.shouldFailPostActionFlushArp = true;

      final result = await repository.flushArp();
      expectError(result, messageContains: 'Failed after 1 attempts');
    });
  });

  group('flushLogs', () {
    test('should flush logs successfully', () async {
      final result = await repository.flushLogs();
      expectSuccess(result);
    });

    test('retries on failure', () async {
      client.shouldFailPostActionFlushLogs = true;

      final result = await repository.flushLogs();
      expectError(result, messageContains: 'Failed after 1 attempts');
    });
  });

  group('updateGravity', () {
    test('should update gravity successfully', () async {
      final responses = <List<String>>[];

      await for (final res in repository.updateGravity()) {
        responses.add(res.getOrThrow());
      }

      expect(responses.length, kSrvPostActionGravity.length);
      expect(responses, kRepoGravity);
    });

    test('retries on failure', () async {
      client.shouldFailPostActionGravity = true;

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
    test('should restart DNS successfully', () async {
      final result = await repository.restartDns();
      expectSuccess(result);
    });

    test('retries on failure', () async {
      client.shouldFailPostActionRestartDns = true;

      final result = await repository.restartDns();
      expectError(result, messageContains: 'Failed after 1 attempts');
    });
  });
}
