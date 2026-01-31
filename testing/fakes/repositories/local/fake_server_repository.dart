import 'package:pi_hole_client/data/repositories/local/server_repository.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:result_dart/result_dart.dart';

class FakeServerRepository implements ServerRepository {
  @override
  Future<Result<List<ServerDbData>>> fetchServers() async {
    return Success([
      ServerDbData(
        address: 'http://example.com',
        alias: 'v6',
        token: null,
        isDefaultServer: 1,
        apiVersion: 'v6',
        sid: 'sid123',
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
        pinnedCertificateSha256: null,
      ),
      ServerDbData(
        address: 'http://example.com:8080',
        alias: 'v5',
        token: 'token123',
        isDefaultServer: 0,
        apiVersion: 'v5',
        sid: null,
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
        pinnedCertificateSha256: null,
      ),
    ]);
  }

  @override
  Future<Result<int>> insertServer(Server server) async {
    return const Success(1);
  }

  @override
  Future<Result<int>> updateServer(Server server) async {
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
}
