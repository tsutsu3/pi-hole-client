import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/repositories/api/v5/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache_store.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';

import '../../../../testing/fakes/services/fake_pihole_v6_api_client.dart';
import '../../../../testing/fakes/services/fake_secure_storage_service.dart';
import '../../../../testing/fakes/services/fake_session_credential_service.dart';

void main() {
  late FakeSecureStorageService fakeStorage;

  setUp(() {
    fakeStorage = FakeSecureStorageService();
  });

  Server createServer({
    required String apiVersion,
    String address = 'http://localhost',
  }) {
    return Server(
      address: address,
      alias: 'test',
      defaultServer: false,
      apiVersion: apiVersion,
      allowUntrustedCert: false,
      ignoreCertificateErrors: false,
    );
  }

  test('creates AuthRepositoryV6 for v6 server', () {
    final bundle = RepositoryBundleFactory.create(
      server: createServer(apiVersion: 'v6'),
      storage: fakeStorage,
    );

    expect(bundle.auth, isA<AuthRepositoryV6>());
    expect(bundle.ftl, isA<FtlRepositoryV6>());
    expect(bundle.serverAddress, 'http://localhost');
  });

  test('creates AuthRepositoryV5 for v5 server', () {
    final bundle = RepositoryBundleFactory.create(
      server: createServer(apiVersion: 'v5'),
      storage: fakeStorage,
    );

    expect(bundle.auth, isA<AuthRepositoryV5>());
    expect(bundle.ftl, isA<FtlRepositoryV5>());
    expect(bundle.serverAddress, 'http://localhost');
  });

  test('defaults to AuthRepositoryV5 for unknown API version', () {
    final bundle = RepositoryBundleFactory.create(
      server: createServer(apiVersion: 'v99'),
      storage: fakeStorage,
    );

    expect(bundle.auth, isA<AuthRepositoryV5>());
    expect(bundle.ftl, isA<FtlRepositoryV5>());
  });

  test('preserves server address in bundle', () {
    final bundle = RepositoryBundleFactory.create(
      server: createServer(
        apiVersion: 'v6',
        address: 'http://192.168.1.100:8080',
      ),
      storage: fakeStorage,
    );

    expect(bundle.serverAddress, 'http://192.168.1.100:8080');
  });

  test('reuses the per-address session cache from the store', () async {
    final store = V6SessionCacheStore();

    final seeded = store.getOrCreate(
      address: 'http://shared',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    await seeded.saveSid('sid_primed');

    RepositoryBundleFactory.create(
      server: createServer(apiVersion: 'v6', address: 'http://shared'),
      storage: fakeStorage,
      sessionCacheStore: store,
    );

    final afterBundle = store.getOrCreate(
      address: 'http://shared',
      creds: FakeSessionCredentialService(),
      client: FakePiholeV6ApiClient(),
    );
    expect(identical(seeded, afterBundle), isTrue);
    expect(await afterBundle.getSid(), 'sid_primed');
  });
}
