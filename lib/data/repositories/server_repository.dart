import 'package:pi_hole_client/data/services/database/database_service.dart';
import 'package:pi_hole_client/data/services/storage/secure_storage_service.dart';
import 'package:pi_hole_client/domain/models/database.dart';
import 'package:pi_hole_client/domain/models/server.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:pi_hole_client/utils/database_utils.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/retry.dart';
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
class ServerRepository {
  ServerRepository(DatabaseService database, SecureStorageService secureStorage)
      : _database = database,
        _secureStorage = secureStorage;

  final DatabaseService _database;
  final SecureStorageService _secureStorage;

  /// Loads all saved server entries from the database, along with their secrets.
  ///
  /// This method reads all rows from the `servers` table and for each one,
  /// it retrieves the corresponding token and sid from secure storage.
  /// These values are then merged into each server record.
  ///
  /// Returns a [Result] containing the list of [ServerDbData] with secrets
  /// on success, or a [Failure] if any error occurs during retrieval.
  Future<Result<List<ServerDbData>>> fetchServers() async {
    try {
      await openDbIfNeeded(_database);

      List<ServerDbData>? servers;

      final rows = await runWithRetry<Result<List<Map<String, dynamic>>>>(
        action: () => _database.rawQuery('SELECT * FROM servers'),
        onRetry: (attempt, error, _) => logger.w(
          'Attempt $attempt: Failed to read servers - $error',
        ),
      );
      servers = rows.getOrThrow().map(ServerDbData.fromMap).toList();

      if (servers.isNotEmpty) {
        for (var i = 0; i < servers.length; i++) {
          final srv = servers[i];
          final token = await _secureStorage.getValue('${srv.address}_token');
          final sid = await _secureStorage.getValue('${srv.address}_sid');

          servers[i] = ServerDbData.withSecrets(
            srv,
            token.getOrNull(),
            sid.getOrNull(),
          );
        }
      }

      return Success(servers);
    } catch (e, st) {
      logger.e('Failed to load servers: $e\n$st');
      return Failure(Exception('Failed to load servers: $e\n$st'));
    }
  }

  /// Saves a new server entry to the database and stores secrets in secure storage.
  ///
  /// This method inserts a new row into the `servers` table with the provided server
  /// data. If available, the token, password, and session ID (`sid`) are saved to
  /// secure storage under the server address prefix.
  ///
  /// Returns a [Result] containing the number of rows inserted on success,
  /// or a [Failure] if the operation fails.
  Future<Result<int>> insertServer(Server server) async {
    try {
      await openDbIfNeeded(_database);

      final token = await server.sm.token;
      if (token.isSuccess()) {
        await _secureStorage.saveValue(
          '${server.address}_token',
          token.getOrThrow(),
        );
      }

      final password = await server.sm.password;
      if (password.isSuccess()) {
        await _secureStorage.saveValue(
          '${server.address}_password',
          password.getOrThrow(),
        );
      }
      if (server.sm.sid != null) {
        await _secureStorage.saveValue(
          '${server.address}_sid',
          server.sm.sid ?? '',
        );
      }

      return await _database.insert('servers', {
        'address': server.address,
        'alias': server.alias,
        'isDefaultServer': 0,
        'apiVersion': server.apiVersion,
        'allowSelfSignedCert': server.allowSelfSignedCert ? 1 : 0,
      });
    } catch (e, st) {
      logger.e('Failed to save server: $e\n$st');
      return Failure(Exception('Failed to save server: $e\n$st'));
    }
  }

  /// Updates an existing server entry and its secrets.
  ///
  /// This method updates the server record in the `servers` table matching the
  /// given address. It also updates the token, password, and session ID in
  /// secure storage if new values are available.
  ///
  /// Returns a [Result] containing the number of rows updated on success,
  /// or a [Failure] if the operation fails.
  Future<Result<int>> updateServer(Server server) async {
    try {
      await openDbIfNeeded(_database);

      final token = await server.sm.token;
      if (token.isSuccess()) {
        await _secureStorage.saveValue(
          '${server.address}_token',
          token.getOrThrow(),
        );
      }

      final password = await server.sm.password;
      if (password.isSuccess()) {
        await _secureStorage.saveValue(
          '${server.address}_password',
          password.getOrThrow(),
        );
      }
      if (server.sm.sid != null) {
        await _secureStorage.saveValue(
          '${server.address}_sid',
          server.sm.sid!,
        );
      }

      return await _database.update(
        'servers',
        {
          'alias': server.alias,
          'isDefaultServer': convertFromBoolToInt(server.defaultServer),
          'apiVersion': server.apiVersion,
          'allowSelfSignedCert': server.allowSelfSignedCert ? 1 : 0,
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
  Future<Result<int>> deleteServer(
    String address,
  ) async {
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
  Future<Result<int>> deleteAllServer() async {
    try {
      await openDbIfNeeded(_database);

      await _secureStorage.clearAll();

      return await _database.delete('servers');
    } catch (e, st) {
      logger.e('Failed to delete servers data: $e\n$st');
      return Failure(Exception('Failed to delete servers data: $e\n$st'));
    }
  }

  /// Checks whether a server entry with the given [url] exists in the database.
  ///
  /// This runs a transaction that queries the `servers` table by the provided address.
  /// If a matching record is found, returns `Success(true)`, otherwise `Success(false)`.
  ///
  /// If the operation fails, returns a [Failure] containing the exception.
  Future<Result<bool>> doesServerExist(String url) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.transaction<bool>((txn) async {
        final res = await txn.query(
          'servers',
          columns: ['count(address) as quantity'],
          where: 'address = ?',
          whereArgs: [url],
        );

        if (res[0]['quantity'] == 0) {
          return false;
        } else {
          return true;
        }
      });
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
  /// Also deletes deprecated basic auth keys unconditionally.
  ///
  /// Returns [Success.unit()] if cleanup succeeds, or a [Failure] if an error occurs.
  Future<Result<void>> deleteUnusedServerSecrets() async {
    try {
      final servers = await fetchServers();
      final serverAddresses =
          servers.getOrThrow().map((e) => e.address).toList();
      final keys = await _secureStorage.readAll();

      if (keys.isError()) {
        logger
            .e('Failed to read secure storage keys: ${keys.exceptionOrNull()}');
        return Failure(Exception('Failed to read secure storage keys'));
      }

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

        // TODO: Delete all basic auth keys (Will be removed after a certain period)
        if (key.endsWith('_basicAuthUser') ||
            key.endsWith('_basicAuthPassword')) {
          keysToDelete.add(key);
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
}
