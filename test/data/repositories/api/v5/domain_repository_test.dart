import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/v5/domain_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';

import '../../../../../testing/fakes/models/v5/domain.dart';
import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';
import '../../../../../testing/helper/test_helper.dart';

void main() async {
  group('NotSupportedException', () {
    late DomainRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = DomainRepositoryV5(client: client, creds: creds);
    });

    test('updateDomain should return NotSupportedException', () async {
      final result = await repository.updateDomain(
        DomainType.allow,
        DomainKind.exact,
        'example.com',
      );
      expectError(result, messageContains: kNotSupportedInV5Message);
    });
  });

  group('fetchAllDomains', () {
    late DomainRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = DomainRepositoryV5(client: client, creds: creds);
    });

    test('should fetch all domains', () async {
      final result = await repository.fetchAllDomains();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), kRepoGetDomains);
    });

    test('should return an error if fetching domains fails', () async {
      client.shouldFail = true;
      final result = await repository.fetchAllDomains();
      expect(result.isError(), true);
    });
  });

  group('addDomain', () {
    late DomainRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = DomainRepositoryV5(client: client, creds: creds);
    });
  });

  group('deleteDomain', () {
    late DomainRepositoryV5 repository;
    late FakePiholeV5ApiClient client;
    late FakeSessionCredentialService creds;

    setUp(() {
      client = FakePiholeV5ApiClient();
      creds = FakeSessionCredentialService();
      repository = DomainRepositoryV5(client: client, creds: creds);
    });
  });
}
