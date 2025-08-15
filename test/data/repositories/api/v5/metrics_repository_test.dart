import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/metrics_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  group('NotSupportedException', () {
    late MetricsRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = MetricsRepositoryV5(client: client, creds: creds);
    });

    test('fetchHistory should return NotSupportedException', () async {
      final result = await repository.fetchHistory();
      expectError(
        result,
        messageContains: kHandledByOverTimeRepositoryInV5Message,
      );
    });

    test('fetchHistoryClient should return NotSupportedException', () async {
      final result = await repository.fetchHistoryClient();
      expectError(
        result,
        messageContains: kHandledByOverTimeRepositoryInV5Message,
      );
    });

    test('fetchStatsSummary should return NotSupportedException', () async {
      final result = await repository.fetchStatsSummary();
      expectError(
        result,
        messageContains: kHandledByRealtimeRepositoryInV5Message,
      );
    });

    test('fetchStatsUpstreams should return NotSupportedException', () async {
      final result = await repository.fetchStatsUpstreams();
      expectError(
        result,
        messageContains: kHandledByRealtimeRepositoryInV5Message,
      );
    });

    test(
      'fetchStatsTopClientsAllowed should return NotSupportedException',
      () async {
        final result = await repository.fetchStatsTopClientsAllowed();
        expectError(
          result,
          messageContains: kHandledByRealtimeRepositoryInV5Message,
        );
      },
    );
  });

  group('fetchQueries', () {
    late MetricsRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = MetricsRepositoryV5(client: client, creds: creds);
    });
  });

  group('fetchOverTime', () {
    late MetricsRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = MetricsRepositoryV5(client: client, creds: creds);
    });
  });
}
