import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/v5/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() {
  const address = 'http://localhost:8080';

  group('NotSupportedException', () {
    late AdlistRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = AdlistRepositoryV5(client: client, creds: creds);
    });

    test('fetchAdlists should return NotSupportedException', () async {
      final result = await repository.fetchAdlists();
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('addAdlist should return NotSupportedException', () async {
      final result = await repository.addAdlist(address, ListType.allow);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('updateAdlist should return NotSupportedException', () async {
      final result = await repository.updateAdlist(address, ListType.allow);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });

    test('deleteAdlist should return NotSupportedException', () async {
      final result = await repository.deleteAdlist(address);
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });
}
