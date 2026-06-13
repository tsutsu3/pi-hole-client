import 'package:pi_hole_client/data/repositories/local/interfaces/server_repository.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:result_dart/result_dart.dart';

class FakeServerRepository implements ServerRepository {
  // Failure controls
  bool shouldFailInsert = false;
  bool shouldFailUpdate = false;
  bool shouldFailReplace = false;
  bool shouldFailDelete = false;
  bool shouldFailUpdateDefault = false;

  // Call tracking
  int insertCallCount = 0;
  int updateCallCount = 0;
  int replaceCallCount = 0;
  String? lastReplacedOldAddress;
  Server? lastReplacedNewServer;
  int deleteCallCount = 0;
  String? lastDeletedAddress;
  int updateDefaultCallCount = 0;
  String? lastUpdatedDefaultAddress;
  int savePasswordCallCount = 0;
  String? lastSavedPasswordAddress;
  String? lastSavedPassword;
  int saveTokenCallCount = 0;
  String? lastSavedTokenAddress;
  String? lastSavedToken;

  @override
  Future<Result<List<Server>>> fetchServers() async {
    return const Success([
      Server(
        address: 'http://example.com',
        alias: 'v6',
        defaultServer: true,
        apiVersion: 'v6',
        allowUntrustedCert: true,
        ignoreCertificateErrors: false,
        pinnedCertificateSha256: null,
      ),
      Server(
        address: 'http://example.com:8080',
        alias: 'v5',
        defaultServer: false,
        apiVersion: 'v5',
        allowUntrustedCert: true,
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
  Future<Result<int>> replaceServer(String oldAddress, Server newServer) async {
    replaceCallCount++;
    lastReplacedOldAddress = oldAddress;
    lastReplacedNewServer = newServer;
    if (shouldFailReplace) {
      return Failure(Exception('FakeServerRepository: replaceServer failed'));
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

  /// Stored credentials returned by [fetchPassword]/[fetchCredentials].
  ///
  /// Defaults to non-empty values so that an edit screen loads with a populated
  /// password/token, matching a real saved server. Tests can override these to
  /// simulate a server with no stored secret.
  String fakePassword = 'stored-pass';
  String fakeToken = 'stored-token';

  /// When true, [fetchCredentials] returns a [Failure], simulating a transient
  /// secure-storage read error on edit-screen load.
  bool shouldFailFetchCredentials = false;

  @override
  Future<Result<String>> fetchPassword(String address) async {
    return Success(fakePassword);
  }

  @override
  Future<Result<({String token, String password})>> fetchCredentials(
    String address,
  ) async {
    if (shouldFailFetchCredentials) {
      return Failure(
        Exception('FakeServerRepository: fetchCredentials failed'),
      );
    }
    return Success((token: fakeToken, password: fakePassword));
  }

  @override
  Future<Result<void>> savePassword(String address, String password) async {
    savePasswordCallCount++;
    lastSavedPasswordAddress = address;
    lastSavedPassword = password;
    return Success.unit();
  }

  @override
  Future<Result<void>> saveToken(String address, String token) async {
    saveTokenCallCount++;
    lastSavedTokenAddress = address;
    lastSavedToken = token;
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

  @override
  Future<Result<void>> deleteSid(String address) async {
    return Success.unit();
  }
}
