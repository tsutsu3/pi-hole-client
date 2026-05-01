import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';

// Minimal concrete subclass for testing the base class methods.
class _TestRepo extends BaseV6SidRepository {
  _TestRepo({required super.sessionCache});
}

void main() {
  late _TestRepo repo;
  late FakePiholeV6ApiClient client;

  setUp(() {
    client = FakePiholeV6ApiClient();
    final creds = FakeSessionCredentialService();
    final cache = V6SessionCache(creds: creds, client: client);
    repo = _TestRepo(sessionCache: cache);
  });

  // ---------------------------------------------------------------------------
  // renewSidIfExpired
  // ---------------------------------------------------------------------------
  group('renewSidIfExpired', () {
    test('calls clearAndRenewSid when error is 401', () async {
      await repo.renewSidIfExpired(HttpStatusCodeException(401));
      expect(client.postAuthCallCount, 1);
    });

    test('calls clearAndRenewSid when error is SidNotFoundException', () async {
      await repo.renewSidIfExpired(SidNotFoundException());
      expect(client.postAuthCallCount, 1);
    });

    test('does nothing when error is 503', () async {
      await repo.renewSidIfExpired(HttpStatusCodeException(503));
      expect(client.postAuthCallCount, 0);
    });

    test('does nothing when error is 500', () async {
      await repo.renewSidIfExpired(HttpStatusCodeException(500));
      expect(client.postAuthCallCount, 0);
    });

    test('does nothing when error is a generic timeout exception', () async {
      await repo.renewSidIfExpired(Exception('Connection timed out'));
      expect(client.postAuthCallCount, 0);
    });
  });

  // ---------------------------------------------------------------------------
  // isReauthRequired
  // ---------------------------------------------------------------------------
  group('isReauthRequired', () {
    test('returns true for 401', () {
      expect(isReauthRequired(HttpStatusCodeException(401)), isTrue);
    });

    test('returns true for SidNotFoundException', () {
      expect(isReauthRequired(SidNotFoundException()), isTrue);
    });

    test('returns false for 503', () {
      expect(isReauthRequired(HttpStatusCodeException(503)), isFalse);
    });

    test('returns false for 504', () {
      expect(isReauthRequired(HttpStatusCodeException(504)), isFalse);
    });

    test('returns false for 500', () {
      expect(isReauthRequired(HttpStatusCodeException(500)), isFalse);
    });

    test('returns false for 495 (SSL)', () {
      expect(isReauthRequired(HttpStatusCodeException(495)), isFalse);
    });

    test('returns false for generic exception', () {
      expect(isReauthRequired(Exception('timeout')), isFalse);
    });

    test('returns false for null', () {
      expect(isReauthRequired(null), isFalse);
    });
  });
}
