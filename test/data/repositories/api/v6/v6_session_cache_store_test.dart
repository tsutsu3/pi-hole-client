import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache_store.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';

void main() {
  late V6SessionCacheStore store;

  setUp(() {
    store = V6SessionCacheStore();
  });

  test('returns the same cache instance for the same address', () {
    final a = store.getOrCreate(
      address: 'http://pi.hole',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    final b = store.getOrCreate(
      address: 'http://pi.hole',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    expect(identical(a, b), isTrue);
  });

  test('returns different instances for different addresses', () {
    final a = store.getOrCreate(
      address: 'http://a',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    final b = store.getOrCreate(
      address: 'http://b',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    expect(identical(a, b), isFalse);
  });

  test('reusing an address rebinds but preserves session state', () async {
    final cache = store.getOrCreate(
      address: 'http://pi.hole',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    await cache.saveSid('sid_shared');

    // A second getOrCreate (e.g. a throwaway connect bundle) rebinds to new
    // deps but returns the same cache, so the SID is kept.
    final reused = store.getOrCreate(
      address: 'http://pi.hole',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    expect(identical(cache, reused), isTrue);
    expect(await reused.getSid(), 'sid_shared');
  });

  test('remove drops the cache so the next getOrCreate starts fresh', () async {
    final cache = store.getOrCreate(
      address: 'http://pi.hole',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    await cache.saveSid('sid_old');

    store.remove('http://pi.hole');

    final fresh = store.getOrCreate(
      address: 'http://pi.hole',
      creds: FakeSessionCredentialService()..shouldFailSidRead = true,
      client: FakePiholeV6ApiClient(),
    );
    expect(identical(cache, fresh), isFalse);
    await expectLater(fresh.getSid(), throwsA(isA<SidNotFoundException>()));
  });

  test('clear drops every cache', () {
    final a = store.getOrCreate(
      address: 'http://a',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    store.clear();
    final b = store.getOrCreate(
      address: 'http://a',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    expect(identical(a, b), isFalse);
  });
}
