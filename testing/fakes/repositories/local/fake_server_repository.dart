import 'package:pi_hole_client/data/repositories/local/interfaces/server_repository.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:result_dart/result_dart.dart';

class FakeServerRepository implements ServerRepository {
  @override
  Future<Result<List<Server>>> fetchServers() async {
    return const Success([
      Server(
        address: 'http://example.com',
        alias: 'v6',
        defaultServer: true,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
        pinnedCertificateSha256: null,
      ),
      Server(
        address: 'http://example.com:8080',
        alias: 'v5',
        defaultServer: false,
        apiVersion: 'v5',
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
        pinnedCertificateSha256: null,
      ),
    ]);
  }

  @override
  Future<Result<int>> insertServer(
    Server server, {
    String? token,
    String? password,
    String? sid,
  }) async {
    return const Success(1);
  }

  @override
  Future<Result<int>> updateServer(
    Server server, {
    String? token,
    String? password,
    String? sid,
  }) async {
    return const Success(1);
  }

  @override
  Future<Result<int>> updateDefaultServer(String url) async {
    return const Success(1);
  }

  @override
  Future<Result<int>> deleteServer(String address) async {
    return const Success(1);
  }

  @override
  Future<Result<int>> deleteAllServers() async {
    return const Success(1);
  }

  @override
  Future<Result<bool>> doesServerExist(String url) async {
    return const Success(true);
  }

  @override
  Future<Result<void>> deleteUnusedServerSecrets() async {
    return Success.unit();
  }

  @override
  Future<Result<String>> fetchPassword(String address) async {
    return const Success('');
  }

  @override
  Future<Result<({String token, String password})>> fetchCredentials(
    String address,
  ) async {
    return const Success((token: '', password: ''));
  }
}
