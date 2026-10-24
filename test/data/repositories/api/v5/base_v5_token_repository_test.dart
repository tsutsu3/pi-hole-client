import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';

import '../../../../../testing/fakes/services/fake_session_credential_service.dart';

// Minimal concrete subclass for testing the base class methods.
class _TestRepo extends BaseV5TokenRepository {
  _TestRepo({required super.creds, super.token});
}

void main() {
  late FakeSessionCredentialService creds;

  setUp(() {
    creds = FakeSessionCredentialService()..addressToken = 'stored-token';
  });

  group('getToken without a given token', () {
    test('returns the stored token', () async {
      final repo = _TestRepo(creds: creds);

      expect(await repo.getToken(), 'stored-token');
    });

    test('reads the stored token again after clearToken', () async {
      final repo = _TestRepo(creds: creds);
      await repo.getToken();

      creds.addressToken = 'updated-token';
      await repo.clearToken();

      expect(await repo.getToken(), 'updated-token');
    });
  });

  group('getToken with a given token', () {
    test('returns the given token, not the stored token', () async {
      final repo = _TestRepo(creds: creds, token: 'given-token');

      expect(await repo.getToken(), 'given-token');
    });

    test('keeps the given token after clearToken', () async {
      final repo = _TestRepo(creds: creds, token: 'given-token');

      // A retry calls clearToken. The given token must still be used.
      await repo.clearToken();

      expect(await repo.getToken(), 'given-token');
    });
  });
}
