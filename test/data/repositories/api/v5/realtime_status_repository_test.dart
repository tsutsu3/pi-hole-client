import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/realtime_status_repository.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';
import '../../../../../testing/models/v5/realtime_status.dart';

void main() {
  group('fetchRealtimeStatus', () {
    late RealTimeStatusRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = RealTimeStatusRepositoryV5(client: client, creds: creds);
    });

    test('should fetch real-time status successfully', () async {
      final result = await repository.fetchRealtimeStatus();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), kRepoFetchRealTimeStatus);
    });

    test(
      'should return failure when fetching real-time status fails',
      () async {
        client.shouldFail = true;
        final result = await repository.fetchRealtimeStatus();
        expectError(
          result,
          messageContains: 'Failed to fetch real-time status',
        );
      },
    );
  });
}
