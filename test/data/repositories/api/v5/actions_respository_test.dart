import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  const sid = 'sid12345';

  late ActionsRepositoryV5 repository;
  late FakePiholeV5ApiClient client;

  setUp(() {
    client = FakePiholeV5ApiClient();
    repository = ActionsRepositoryV5(
      sid: sid,
      client: client,
    );
  });

  group('flushArp', () {
    test('returns NotSupportedException', () async {
      final result = await repository.flushArp();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });

  group('flushLogs', () {
    test('returns NotSupportedException', () async {
      final result = await repository.flushLogs();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });

  group('updateGravity', () {
    test('returns NotSupportedException', () async {
      final responses = <Result<List<String>>>[];

      await for (final res in repository.updateGravity()) {
        responses.add(res);
      }

      expect(responses.length, 1);
      expect(responses.first.isError(), true);
      expectError(responses.first, messageContains: kNotSupportedInV5Message);
    });
  });

  group('restartDns', () {
    test('returns NotSupportedException', () async {
      final result = await repository.restartDns();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
