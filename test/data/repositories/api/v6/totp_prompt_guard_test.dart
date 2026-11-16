import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/v6/totp_prompt_guard.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache_store.dart';

import '../../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';

const _address = 'http://pi.hole';

void main() {
  late V6SessionCacheStore store;
  late TotpPromptGuard guard;

  setUp(() {
    store = V6SessionCacheStore();
    guard = TotpPromptGuard(store);
  });

  void createCache() {
    store.getOrCreate(
      address: _address,
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
  }

  test('decline marks the address as declined', () {
    createCache();

    guard.decline(_address);

    expect(guard.isDeclined(_address), isTrue);
  });

  test('allowPrompt removes the declined mark', () {
    createCache();
    guard.decline(_address);

    guard.allowPrompt(_address);

    expect(guard.isDeclined(_address), isFalse);
  });

  test('clear removes the declined mark', () {
    createCache();
    guard.decline(_address);

    guard.clear(_address);

    expect(guard.isDeclined(_address), isFalse);
  });

  test('does nothing for an address with no cache', () {
    guard.decline(_address);

    expect(guard.isDeclined(_address), isFalse);
    expect(store.find(_address), isNull);
  });

  test('store.remove drops the declined mark', () {
    createCache();
    guard.decline(_address);

    store.remove(_address);
    createCache();

    expect(guard.isDeclined(_address), isFalse);
  });

  test('store.clear drops the declined mark', () {
    createCache();
    guard.decline(_address);

    store.clear();
    createCache();

    expect(guard.isDeclined(_address), isFalse);
  });
}
