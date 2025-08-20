import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/realtime_status_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  late RealtimeStatusRepositoryV6 repository;
  late FakePiholeV6ApiClient client;
  late FakeSessionCredentialService creds;

  group('fetchRealtimeStatus', () {
    setUp(() {
      client = FakePiholeV6ApiClient();
      creds = FakeSessionCredentialService();
      repository = RealtimeStatusRepositoryV6(client: client, creds: creds);
    });

    test('fetchRealtimeStatus should return NotSupportedException', () async {
      final result = await repository.fetchRealtimeStatus();
      expectError(result, messageContains: kNotSupportedInV6Message);
    });
  });
}
