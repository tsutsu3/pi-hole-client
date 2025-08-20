import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase_v5.dart';

import '../../../../testing/fakes/repositories/api/fake_realtime_status_repository.dart';
import '../../../../testing/helper/test_helper.dart';
import '../../../../testing/models/v5/realtime_status.dart';

void main() {
  group('RealTimeStatusUseCaseV5', () {
    late FakeRealTimeStatusRepository repository;
    late RealtimeStatusUseCaseV5 useCase;

    setUp(() {
      repository = FakeRealTimeStatusRepository();
      useCase = RealtimeStatusUseCaseV5(repository: repository);
    });

    test('should fetch real-time status successfully', () async {
      final result = await useCase.fetchRealtimeStatus();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), kRepoFetchRealTimeStatus);
    });

    test('should handle errors when fetching real-time status', () async {
      repository.shouldFail = true;
      final result = await useCase.fetchRealtimeStatus();
      expect(result.isError(), true);
      expectError(result, messageContains: 'Failed to fetch real-time status');
    });
  });
}
