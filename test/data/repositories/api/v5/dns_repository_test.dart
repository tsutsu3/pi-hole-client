import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  group('NotSupportedException', () {
    late DnsRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = DnsRepositoryV5(client: client, creds: creds);
    });

    test('fetchBlockingStatus should return NotSupportedException', () async {
      final result = await repository.fetchBlockingStatus();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('enableBlocking should return NotSupportedException', () async {
      final result = await repository.enableBlocking();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('disableBlocking should return NotSupportedException', () async {
      final result = await repository.disableBlocking(30);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
