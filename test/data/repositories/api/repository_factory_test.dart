import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/repositories/api/v5/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/local/secure_data_repository.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';

import '../../../../testing/fakes/services/fake_secure_storage_service.dart';

void main() {
  late FakeSecureStorageService fakeStorage;

  setUp(() {
    fakeStorage = FakeSecureStorageService();
  });

  Server createServer({required String apiVersion, String address = 'http://localhost'}) {
    return Server(
      address: address,
      alias: 'test',
      defaultServer: false,
      apiVersion: apiVersion,
      allowSelfSignedCert: false,
      ignoreCertificateErrors: false,
      sm: SecureDataRepository(fakeStorage, address),
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
      server: createServer(apiVersion: 'v6', address: 'http://192.168.1.100:8080'),
      storage: fakeStorage,
    );

    expect(bundle.serverAddress, 'http://192.168.1.100:8080');
  });
}
