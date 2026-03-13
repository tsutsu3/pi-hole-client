import 'package:pi_hole_client/data/repositories/local/interfaces/server_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/data/services/utils/database_utils.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:result_dart/result_dart.dart';

/// A repository that manages server-related data and secure credentials.
///
/// This class handles all database operations related to Pi-hole server configurations,
/// such as inserting, updating, deleting, and querying server records from the local
/// SQLite database. It also manages secure data like API tokens, passwords, and session
/// identifiers using [SecureStorageService].
///
/// Use this repository to perform persistence operations on server data, while keeping
/// sensitive values securely stored outside of the main database.
class LocalServerRepository implements ServerRepository {
  LocalServerRepository(
    DatabaseService database,
    SecureStorageService secureStorage,
  ) : _database = database,
      _secureStorage = secureStorage;

  final DatabaseService _database;
  final SecureStorageService _secureStorage;

  /// Loads all saved server entries from the database as [Server] domain objects.
  ///
  /// This method reads all rows from the `servers` table and converts them
  /// into [Server] domain model instances. Secrets (token, sid) remain in
  /// secure storage and are not loaded into the domain model.
  ///
  /// Returns a [Result] containing the list of [Server] on success,
  /// or a [Failure] if any error occurs during retrieval.
  @override
  Future<Result<List<Server>>> fetchServers() async {
    try {
      await openDbIfNeeded(_database);

      final rows = await runWithRetry<Result<List<Map<String, dynamic>>>>(
        action: () => _database.rawQuery('SELECT * FROM servers'),
        onRetry: (attempt, error, _) =>
            logger.w('Attempt $attempt: Failed to read servers - $error'),
      );

      final servers = rows.getOrThrow().map((map) {
        return Server(
          address: map['address']! as String,
          alias: map['alias']! as String,
          apiVersion: map['apiVersion']! as String,
          defaultServer: (map['isDefaultServer']! as int) == 1,
          allowSelfSignedCert: (map['allowSelfSignedCert']! as int) == 1,
          ignoreCertificateErrors:
              ((map['ignoreCertificateErrors'] as int?) ?? 0) == 1,
          pinnedCertificateSha256: map['pinnedCertificateSha256'] as String?,
        );
      }).toList();

      return Success(servers);
    } catch (e, st) {
      logger.e('Failed to load servers: $e\n$st');
      return Failure(Exception('Failed to load servers: $e\n$st'));
    }
  }

  /// Saves a new server entry to the database and stores secrets in secure storage.
  ///
  /// This method inserts a new row into the `servers` table with the provided server
  /// data. If [token], [password], or [sid] are provided, they are saved to
  /// secure storage under the server address prefix.
  ///
  /// Returns a [Result] containing the number of rows inserted on success,
  /// or a [Failure] if the operation fails.
  @override
  Future<Result<int>> insertServer(
    Server server, {
    String? token,
    String? password,
    String? sid,
  }) async {
    try {
      await openDbIfNeeded(_database);

      if (token != null && token.isNotEmpty) {
        await _secureStorage.saveValue('${server.address}_token', token);
      }

      if (password != null && password.isNotEmpty) {
        await _secureStorage.saveValue('${server.address}_password', password);
      }

      if (sid != null && sid.isNotEmpty) {
        await _secureStorage.saveValue('${server.address}_sid', sid);
      }

      return await _database.insert('servers', {
        'address': server.address,
        'alias': server.alias,
        'isDefaultServer': server.defaultServer ? 1 : 0,
        'apiVersion': server.apiVersion,
        'allowSelfSignedCert': server.allowSelfSignedCert ? 1 : 0,
        'ignoreCertificateErrors': server.ignoreCertificateErrors ? 1 : 0,
        'pinnedCertificateSha256': server.pinnedCertificateSha256,
      });
    } catch (e, st) {
      logger.e('Failed to save server: $e\n$st');
      return Failure(Exception('Failed to save server: $e\n$st'));
    }
  }

  /// Updates an existing server entry and optionally its secrets.
  ///
  /// This method updates the server record in the `servers` table matching the
  /// given address. If [token], [password], or [sid] are provided, they are
  /// also updated in secure storage.
  ///
  /// Returns a [Result] containing the number of rows updated on success,
  /// or a [Failure] if the operation fails.
  @override
  Future<Result<int>> updateServer(
    Server server, {
    String? token,
    String? password,
    String? sid,
  }) async {
    try {
      await openDbIfNeeded(_database);

      if (token != null && token.isNotEmpty) {
        await _secureStorage.saveValue('${server.address}_token', token);
      }

      if (password != null && password.isNotEmpty) {
        await _secureStorage.saveValue('${server.address}_password', password);
      }

      if (sid != null && sid.isNotEmpty) {
        await _secureStorage.saveValue('${server.address}_sid', sid);
      }

      return await _database.update(
        'servers',
        {
          'alias': server.alias,
          'isDefaultServer': convertFromBoolToInt(server.defaultServer),
          'apiVersion': server.apiVersion,
          'allowSelfSignedCert': server.allowSelfSignedCert ? 1 : 0,
          'ignoreCertificateErrors': server.ignoreCertificateErrors ? 1 : 0,
          'pinnedCertificateSha256': server.pinnedCertificateSha256,
        },
        where: 'address = ?',
        whereArgs: [server.address],
      );
    } catch (e, st) {
      logger.e('Failed to edit server: $e\n$st');
      return Failure(Exception('Failed to edit server: $e\n$st'));
    }
  }

  /// Sets the given server as the new default server.
  ///
  /// This method performs a transaction to first clear the `isDefaultServer` flag
  /// from all entries, then sets the flag for the server matching the provided [url].
  ///
  /// Returns the total number of rows updated, or a failure if the update fails.
  @override
  Future<Result<int>> updateDefaultServer(String url) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.transaction<int>((txn) async {
        final count1 = await txn.update(
          'servers',
          {'isDefaultServer': '0'},
          where: 'isDefaultServer = ?',
          whereArgs: [1],
        );
        final count2 = await txn.update(
          'servers',
          {'isDefaultServer': '1'},
          where: 'address = ?',
          whereArgs: [url],
        );
        return count1 + count2;
      });
    } catch (e, st) {
      logger.e('Failed to set default server: $e\n$st');
      return Failure(Exception('Failed to set default server: $e\n$st'));
    }
  }

  /// Deletes a specific server entry and its associated secrets.
  ///
  /// This method removes token, password, and session ID from secure storage
  /// for the given [address], and deletes the corresponding row from the `servers` table.
  ///
  /// Returns the number of rows deleted, or a failure if the operation fails.
  @override
  Future<Result<int>> deleteServer(String address) async {
    try {
      await openDbIfNeeded(_database);

      await _secureStorage.deleteValue('${address}_token');
      await _secureStorage.deleteValue('${address}_password');
      await _secureStorage.deleteValue('${address}_sid');

      logger.d((await _secureStorage.readAll()).toString());

      return await _database.delete(
        'servers',
        where: 'address = ?',
        whereArgs: [address],
      );
    } catch (e, st) {
      logger.e('Failed to remove server: $e\n$st');
      return Failure(Exception('Failed to remove server: $e\n$st'));
    }
  }

  /// Deletes all server entries and clears all secure storage keys.
  ///
  /// This method removes every row from the `servers` table and calls `clearAll()`
  /// on secure storage to delete all stored credentials.
  ///
  /// Returns the number of rows deleted, or a failure if the deletion fails.
  @override
  Future<Result<int>> deleteAllServers() async {
    try {
      await openDbIfNeeded(_database);

      await _secureStorage.clearAll();

      return await _database.delete('servers');
    } catch (e, st) {
      logger.e('Failed to delete all servers data: $e\n$st');
      return Failure(Exception('Failed to delete all servers data: $e\n$st'));
    }
  }

  /// Checks whether a server entry with the given [url] exists in the database.
  ///
  /// This runs a transaction that queries the `servers` table by the provided address.
  /// If a matching record is found, returns `Success(true)`, otherwise `Success(false)`.
  ///
  /// If the operation fails, returns a [Failure] containing the exception.
  @override
  Future<Result<bool>> doesServerExist(String url) async {
    try {
      await openDbIfNeeded(_database);

      final result = await _database.query(
        'servers',
        columns: ['count(address) as quantity'],
        where: 'address = ?',
        whereArgs: [url],
      );

      if (result.isError()) return Failure(result.exceptionOrNull()!);

      final quantity = result.getOrNull()?.first['quantity'] as int? ?? 0;

      return Success(quantity > 0);
    } catch (e, st) {
      logger.e('Failed to check if URL exists: $e\n$st');
      return Failure(Exception('Failed to check if URL exists: $e\n$st'));
    }
  }

  /// Deletes any secure storage entries that do not correspond to existing servers.
  ///
  /// This is typically called during app startup to clean up outdated tokens,
  /// passwords, or session IDs. Secure keys are removed only if the corresponding
  /// server no longer exists in the database.
  ///
  /// Returns [Success.unit()] if cleanup succeeds, or a [Failure] if an error occurs.
  @override
  Future<Result<void>> deleteUnusedServerSecrets() async {
    try {
      final servers = await fetchServers();
      final serverAddresses = servers
          .getOrThrow()
          .map((e) => e.address)
          .toList();
      final keys = await _secureStorage.readAll();

      if (keys.isError()) return Failure(keys.exceptionOrNull()!);

      // Collect keys to be deleted
      final keysToDelete = <String>[];

      for (final key in keys.getOrThrow().keys) {
        if (key.endsWith('_token') ||
            key.endsWith('_password') ||
            key.endsWith('_sid')) {
          final address = key.split('_').first;
          if (!serverAddresses.contains(address)) {
            keysToDelete.add(key);
          }
        }
      }

      // Delete collected keys separately
      for (final key in keysToDelete) {
        await _secureStorage.deleteValue(key);
      }

      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to delete unused server secrets: $e\n$st');
      return Failure(
        Exception('Failed to delete unused server secrets: $e\n$st'),
      );
    }
  }

  @override
  Future<Result<String>> fetchPassword(String address) async {
    try {
      final result = await _secureStorage.getValue('${address}_password');
      return Success(result.getOrElse((_) => ''));
    } catch (e, st) {
      logger.e('Failed to fetch password: $e\n$st');
      return Failure(Exception('Failed to fetch password: $e\n$st'));
    }
  }

  @override
  Future<Result<({String token, String password})>> fetchCredentials(
    String address,
  ) async {
    try {
      final token = await _secureStorage.getValue('${address}_token');
      final password = await _secureStorage.getValue('${address}_password');
      return Success((
        token: token.getOrElse((_) => ''),
        password: password.getOrElse((_) => ''),
      ));
    } catch (e, st) {
      logger.e('Failed to fetch credentials: $e\n$st');
      return Failure(Exception('Failed to fetch credentials: $e\n$st'));
    }
  }

  @override
  Future<Result<void>> savePassword(String address, String password) async {
    try {
      await _secureStorage.saveValue('${address}_password', password);
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to save password: $e\n$st');
      return Failure(Exception('Failed to save password: $e\n$st'));
    }
  }

  @override
  Future<Result<void>> saveToken(String address, String token) async {
    try {
      await _secureStorage.saveValue('${address}_token', token);
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to save token: $e\n$st');
      return Failure(Exception('Failed to save token: $e\n$st'));
    }
  }

  @override
  Future<Result<void>> deletePassword(String address) async {
    try {
      await _secureStorage.deleteValue('${address}_password');
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to delete password: $e\n$st');
      return Failure(Exception('Failed to delete password: $e\n$st'));
    }
  }

  @override
  Future<Result<void>> deleteToken(String address) async {
    try {
      await _secureStorage.deleteValue('${address}_token');
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to delete token: $e\n$st');
      return Failure(Exception('Failed to delete token: $e\n$st'));
    }
  }
}
