import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class ServerRepository {
  Future<Result<List<Server>>> fetchServers();
  Future<Result<int>> insertServer(
    Server server, {
    String? token,
    String? password,
    String? sid,
  });
  Future<Result<int>> updateServer(
    Server server, {
    String? token,
    String? password,
    String? sid,
  });
  Future<Result<int>> updateDefaultServer(String url);
  Future<Result<int>> deleteServer(String address);
  Future<Result<int>> deleteAllServers();
  Future<Result<bool>> doesServerExist(String url);
  Future<Result<void>> deleteUnusedServerSecrets();

  /// Fetches the stored password for v6 authentication.
  /// Returns empty string if no password is stored.
  Future<Result<String>> fetchPassword(String address);

  /// Fetches stored credentials (token + password) for the edit screen.
  /// Returns empty strings if not stored.
  Future<Result<({String token, String password})>> fetchCredentials(
    String address,
  );

  Future<Result<void>> savePassword(String address, String password);
  Future<Result<void>> saveToken(String address, String token);
  Future<Result<void>> deletePassword(String address);
  Future<Result<void>> deleteToken(String address);
}
