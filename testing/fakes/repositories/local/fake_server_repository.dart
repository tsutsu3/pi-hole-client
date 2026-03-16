import 'package:pi_hole_client/data/repositories/local/interfaces/server_repository.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:result_dart/result_dart.dart';

class FakeServerRepository implements ServerRepository {
  // Failure controls
  bool shouldFailInsert = false;
  bool shouldFailUpdate = false;
  bool shouldFailDelete = false;
  bool shouldFailUpdateDefault = false;

  // Call tracking
  int insertCallCount = 0;
  int updateCallCount = 0;
  int deleteCallCount = 0;
  String? lastDeletedAddress;
  int updateDefaultCallCount = 0;
  String? lastUpdatedDefaultAddress;

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
    insertCallCount++;
    if (shouldFailInsert) {
      return Failure(Exception('FakeServerRepository: insertServer failed'));
    }
    return const Success(1);
  }

  @override
  Future<Result<int>> updateServer(
    Server server, {
    String? token,
    String? password,
    String? sid,
  }) async {
    updateCallCount++;
    if (shouldFailUpdate) {
      return Failure(Exception('FakeServerRepository: updateServer failed'));
    }
    return const Success(1);
  }

  @override
  Future<Result<int>> updateDefaultServer(String url) async {
    updateDefaultCallCount++;
    lastUpdatedDefaultAddress = url;
    if (shouldFailUpdateDefault) {
      return Failure(
        Exception('FakeServerRepository: updateDefaultServer failed'),
      );
    }
    return const Success(1);
  }

  @override
  Future<Result<int>> deleteServer(String address) async {
    deleteCallCount++;
    lastDeletedAddress = address;
    if (shouldFailDelete) {
      return Failure(Exception('FakeServerRepository: deleteServer failed'));
    }
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

  @override
  Future<Result<void>> savePassword(String address, String password) async {
    return Success.unit();
  }

  @override
  Future<Result<void>> saveToken(String address, String token) async {
    return Success.unit();
  }

  @override
  Future<Result<void>> deletePassword(String address) async {
    return Success.unit();
  }

  @override
  Future<Result<void>> deleteToken(String address) async {
    return Success.unit();
  }
}
