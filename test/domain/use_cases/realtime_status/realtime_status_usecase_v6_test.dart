import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase_v6.dart';

import '../../../../testing/fakes/repositories/api/fake_dns_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../testing/fakes/repositories/api/fake_metrics_repository.dart';
import '../../../../testing/helper/test_helper.dart';
import '../../../../testing/models/v6/realtime_status.dart';

void main() {
  group('RealTimeStatusUseCaseV6', () {
    late FakeMetricsRepository metricsRepository;
    late FakeFtlRepository ftlRepository;
    late FakeDnsRepository dnsRepository;
    late RealtimeStatusUseCaseV6 useCase;

    setUp(() {
      metricsRepository = FakeMetricsRepository();
      ftlRepository = FakeFtlRepository();
      dnsRepository = FakeDnsRepository();
      useCase = RealtimeStatusUseCaseV6(
        metricsRepository: metricsRepository,
        ftlRepository: ftlRepository,
        dnsRepository: dnsRepository,
      );
    });

    test('should fetch real-time status successfully', () async {
      final result = await useCase.fetchRealtimeStatus();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), kRepoFetchRealTimeStatus);
    });

    test('should handle errors when fetching real-time status', () async {
      metricsRepository.shouldFail = true;
      final result = await useCase.fetchRealtimeStatus();
      expect(result.isError(), true);
      expectError(result, messageContains: 'Force fetchStatsSummary failure');
    });
  });
}
