import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/metrics_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v6/metrics.dart';

void main() {
  late MetricsRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchHistory', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get history successfully', () async {
      final result = await repository.fetchHistory();
      expect(result.getOrNull(), kRepoFetchHistory);
    });

    test('should fail when fetching history', () async {
      client.shouldFail = true;

      final result = await repository.fetchHistory();
      expectError(result, messageContains: 'Forced getHistory failure');
    });
  });

  group('fetchHistoryClient', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get history client successfully', () async {
      final result = await repository.fetchHistoryClient();
      expect(result.getOrNull(), kRepoFetchHistoryClient);
    });

    test('should fail when fetching history client', () async {
      client.shouldFail = true;

      final result = await repository.fetchHistoryClient();
      expectError(result, messageContains: 'Forced getHistoryClient failure');
    });
  });

  group('fetchQueries', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get queries successfully', () async {
      final result = await repository.fetchQueries(
        from: DateTime.fromMicrosecondsSinceEpoch(1511819900 * 1000),
        until: DateTime.fromMicrosecondsSinceEpoch(1511820500 * 1000),
      );
      expect(result.getOrNull(), kRepoFetchQueries);
    });

    test('should fail when fetching queries', () async {
      client.shouldFail = true;

      final result = await repository.fetchQueries(
        from: DateTime.fromMicrosecondsSinceEpoch(1511819900 * 1000),
        until: DateTime.fromMicrosecondsSinceEpoch(1511820500 * 1000),
      );
      expectError(result, messageContains: 'Forced getQueries failure');
    });
  });

  group('fetchStatsSummary', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get stats summary successfully', () async {
      final result = await repository.fetchStatsSummary();
      expect(result.getOrNull(), kRepoFetchStatsSummary);
    });

    test('should fail when fetching stats summary', () async {
      client.shouldFail = true;

      final result = await repository.fetchStatsSummary();
      expectError(result, messageContains: 'Forced getStatsSummary failure');
    });
  });

  group('fetchStatsUpstreams', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get stats upstreams successfully', () async {
      final result = await repository.fetchStatsUpstreams();
      expect(result.getOrNull(), kRepoFetchStatsUpstreams);
    });

    test('should fail when fetching stats upstreams', () async {
      client.shouldFail = true;

      final result = await repository.fetchStatsUpstreams();
      expectError(result, messageContains: 'Forced getStatsUpstreams failure');
    });
  });

  group('fetchStatsTopDomainsBlocked', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get stats top domains blocked successfully', () async {
      final result = await repository.fetchStatsTopDomainsBlocked();
      expect(result.getOrNull(), kRepoFetchStatsTopDomainsBlocked);
    });

    test('should fail when fetching stats top domains blocked', () async {
      client.shouldFail = true;

      final result = await repository.fetchStatsTopDomainsBlocked();
      expectError(result, messageContains: 'Forced getStatsTopDomains failure');
    });
  });

  group('fetchStatsTopDomainsAllowed', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get stats top domains allowed successfully', () async {
      final result = await repository.fetchStatsTopDomainsAllowed();
      expect(result.getOrNull(), kRepoFetchStatsTopDomainsAllowed);
    });

    test('should fail when fetching stats top domains allowed', () async {
      client.shouldFail = true;

      final result = await repository.fetchStatsTopDomainsAllowed();
      expectError(result, messageContains: 'Forced getStatsTopDomains failure');
    });
  });

  group('fetchStatsTopClientsBlocked', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get stats top clients blocked successfully', () async {
      final result = await repository.fetchStatsTopClientsBlocked();
      expect(result.getOrNull(), kRepoFetchStatsTopClientsBlocked);
    });

    test('should fail when fetching stats top clients blocked', () async {
      client.shouldFail = true;

      final result = await repository.fetchStatsTopClientsBlocked();
      expectError(result, messageContains: 'Forced getStatsTopClients failure');
    });
  });

  group('fetchStatsTopClientsAllowed', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get stats top clients allowed successfully', () async {
      final result = await repository.fetchStatsTopClientsAllowed();
      expect(result.getOrNull(), kRepoFetchStatsTopClientsAllowed);
    });

    test('should fail when fetching stats top clients allowed', () async {
      client.shouldFail = true;

      final result = await repository.fetchStatsTopClientsAllowed();
      expectError(result, messageContains: 'Forced getStatsTopClients failure');
    });
  });

  group('fetchOverTime', () {
    setUp(() {
      creds = FakeSessionCredentialService();
      client = FakePiholeV6ApiClient();
      repository = MetricsRepositoryV6(client: client, creds: creds);
    });

    test('should get stats over time successfully', () async {
      final result = await repository.fetchOverTime();
      expect(result.getOrNull(), kRepoFetchOverTime);
    });

    test('should fail when fetching stats over time', () async {
      client.shouldFail = true;

      final result = await repository.fetchOverTime();
      expectError(result, messageContains: 'Forced getHistory failure');
    });
  });
}
