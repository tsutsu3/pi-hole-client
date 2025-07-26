import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/database/database_service.dart';
import 'package:pi_hole_client/data/services/storage/secure_storage_service.dart';
import 'package:pi_hole_client/domain/models/database.dart';
import 'package:pi_hole_client/domain/models/server.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository {
  DatabaseRepository(
    DatabaseService databaseService,
    SecureStorageService secureStorageService, {
    String? path,
  })  : _databaseService = databaseService,
        _secureStorageService = secureStorageService,
        _path = path ?? 'pi_hole_client.db';

  final DatabaseService _databaseService;
  final SecureStorageService _secureStorageService;
  final String _path;

  late final List<ServerDbData>? _servers;
  late final AppDbData? _appConfig;
  late final Database? _dbInstance;

  /// Returns the list of servers stored in the database.
  List<ServerDbData> get servers {
    if (_servers == null) {
      throw Exception(
        'DatabaseRepository is not initialized. Call initialize() first.',
      );
    }
    return _servers!;
  }

  /// Returns the application configuration stored in the database.
  AppDbData get appConfig {
    if (_appConfig == null) {
      throw Exception(
        'DatabaseRepository is not initialized. Call initialize() first.',
      );
    }
    return _appConfig!;
  }

  /// Returns the current database instance.
  Database get dbInstance {
    if (_dbInstance == null) {
      throw Exception(
        'DatabaseRepository is not initialized. Call initialize() first.',
      );
    }
    return _dbInstance!;
  }

  /// Initializes the database repository.
  ///
  /// This method performs necessary setup operations to prepare the database
  /// for use, such as opening the database connection, ensuring tables exist,
  /// and loading initial data into memory if required.
  ///
  /// This method must be called before using any other methods or properties
  /// in the implementing class.
  ///
  /// Returns:
  /// - A `Future` that completes when the initialization is finished.
  ///
  /// Throws:
  /// - [Exception] if the initialization fails or the database cannot be accessed.
  Future<Result<void>> initialize() async {
    try {
      final piHoleClientData = await _loadDb(_path);
      _servers = piHoleClientData.servers;
      _appConfig = piHoleClientData.appConfig;
      _dbInstance = piHoleClientData.dbInstance;
      await cleanUpSecureStorage();
      logger.d('Secure storage: ${await _secureStorageService.readAll()}');
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to initialize DatabaseRepository. $e\n$st');
      return Failure(Exception('Database initialization failed: $e\n$st'));
    }
  }

  /// Closes the database connection.
  ///
  /// This method closes the database connection and releases any resources
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful.
  Future<bool> closeDb() async {
    try {
      await _dbInstance?.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Map<String, dynamic> toDict() {
  //   return PiHoleClientData(
  //     servers: _servers,
  //     appConfig: _appConfig!,
  //     dbInstance: _dbInstance!,
  //   ).toDict();
  // }

  /// Loads the database and retrieves its content.
  ///
  /// This method is responsible for initializing or opening the database,
  /// ensuring that necessary tables exist, and fetching the required data.
  ///
  /// Parameters:
  /// - [path]: The path to the database file. If not provided, the default
  ///  path 'pi_hole_client.db' will be used.
  ///
  /// Returns:
  /// - A `Future` that resolves to a [PiHoleClientData] object containing:
  ///   - `servers`: A list of server configurations from the database.
  ///   - `appConfig`: The application configuration.
  ///   - `dbInstance`: The active [Database] instance.
  ///
  /// Throws:
  /// - [Exception] if the database cannot be initialized or data cannot be retrieved.
  Future<PiHoleClientData> _loadDb(String path) async {
    List<ServerDbData>? servers;
    AppDbData? appConfig;

    final database = await _databaseService.open();
    if (database.isError()) {
      logger.e('Failed to open database: ${database.exceptionOrNull()}');
      throw database.exceptionOrNull()!;
    }

    final db = database.getOrThrow();

    const maxRetries = 5;
    const retryDelay = Duration(milliseconds: 200);
    var attempt = 0;

    // Retry logic: On some real devices, immediately accessing the database
    // after a migration can result in a race condition where data is not yet visible.
    // This loop retries the transaction a few times to ensure that the
    // appConfig and servers tables are accessible and populated.
    while (attempt < maxRetries) {
      try {
        await db.transaction((txn) async {
          final serverRows = await txn.rawQuery('SELECT * FROM servers');
          servers = serverRows.map(ServerDbData.fromMap).toList();

          final appConfigRows = await txn.rawQuery('SELECT * FROM appConfig');
          appConfig = AppDbData.fromMap(appConfigRows[0]);
        });
        break;
      } catch (e, stackTrace) {
        attempt++;
        logger.w('Attempt $attempt: Failed to read DB config - $e');
        if (attempt >= maxRetries) {
          logger.e(
            'Failed to read DB config after $maxRetries attempts - $e\n$stackTrace',
          );
          rethrow;
        }
        await Future.delayed(retryDelay);
      }
    }

    // Load sensitive data from secure storage
    final passCode = await _secureStorageService.getValue('passCode');
    appConfig = AppDbData.withSecrets(appConfig!, passCode.getOrNull());

    if (servers != null && servers!.isNotEmpty) {
      for (var i = 0; i < servers!.length; i++) {
        final server = servers![i];
        final token =
            await _secureStorageService.getValue('${server.address}_token');
        final sid =
            await _secureStorageService.getValue('${server.address}_sid');

        servers![i] = ServerDbData.withSecrets(
          server,
          token.getOrNull(),
          sid.getOrNull(),
        );
      }
    }

    return PiHoleClientData(
      servers: servers,
      appConfig: appConfig!,
      dbInstance: db,
    );
  }

  /// Saves a new server entry into the database.
  ///
  /// This method adds a new server record to the 'servers' table in the database.
  /// The record includes the server's address, alias, token, API version,
  /// and authentication details.
  ///
  /// Parameters:
  /// - [server]: The server object containing the details to be saved.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the save operation is successful.
  /// - Returns `null` or an appropriate error response if the operation fails.
  Future<Result<void>> saveServerQuery(Server server) async {
    try {
      final token = await server.sm.token;
      if (token.isSuccess()) {
        await _secureStorageService.saveValue(
          '${server.address}_token',
          token.getOrThrow(),
        );
      }

      final password = await server.sm.password;
      if (password.isSuccess()) {
        await _secureStorageService.saveValue(
          '${server.address}_password',
          password.getOrThrow(),
        );
      }
      if (server.sm.sid.isSuccess()) {
        await _secureStorageService.saveValue(
          '${server.address}_sid',
          server.sm.sid.getOrDefault(''),
        );
      }

      await _dbInstance?.transaction((txn) async {
        await txn.insert('servers', {
          'address': server.address,
          'alias': server.alias,
          'isDefaultServer': 0,
          'apiVersion': server.apiVersion,
          'allowSelfSignedCert': server.allowSelfSignedCert ? 1 : 0,
        });
      });
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to save server: $e\n$st');
      return Failure(Exception('Failed to save server: $e\n$st'));
    }
  }

  /// Updates an existing server entry in the database.
  ///
  /// This method performs a database transaction to update the details of an
  /// existing server record in the 'servers' table. The server is identified by
  /// its unique `address`. The method updates the server's alias, token, default
  /// server status, API version, and authentication credentials.
  ///
  /// Parameters:
  /// - [server]: The [Server] object containing the updated server details. The
  ///   `address` field is used to locate the record to be updated.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the update operation is successful.
  /// - Resolves to `false` if the transaction fails.
  ///
  /// Logs:
  /// - Logs an error message with a stack trace if the update operation fails.
  ///
  /// Throws:
  /// - [Exception] may be thrown if there is an issue with the database
  ///   transaction.
  Future<Result<void>> editServerQuery(Server server) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      final token = await server.sm.token;
      if (token.isSuccess()) {
        await _secureStorageService.saveValue(
          '${server.address}_token',
          token.getOrThrow(),
        );
      }

      final password = await server.sm.password;
      if (password.isSuccess()) {
        await _secureStorageService.saveValue(
          '${server.address}_password',
          password.getOrThrow(),
        );
      }
      if (server.sm.sid.isSuccess()) {
        await _secureStorageService.saveValue(
          '${server.address}_sid',
          server.sm.sid.getOrThrow(),
        );
      }

      return await _dbInstance!.transaction((txn) async {
        await txn.update(
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
        return Success.unit();
      });
    } catch (e, st) {
      logger.e('Failed to edit server: $e\n$st');
      return Failure(Exception('Failed to edit server: $e\n$st'));
    }
  }

  /// Sets the default server by updating the `isDefaultServer` field.
  ///
  /// This method clears the current default server and marks the server
  /// specified by [url] as the new default.
  ///
  /// Parameters:
  /// - [url]: The address of the server to be marked as default.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///   `null` if an error occurs.
  Future<Result<void>> setDefaultServerQuery(String url) async {
    try {
      await _dbInstance?.transaction((txn) async {
        await txn.update(
          'servers',
          {'isDefaultServer': '0'},
          where: 'isDefaultServer = ?',
          whereArgs: [1],
        );
        await txn.update(
          'servers',
          {'isDefaultServer': '1'},
          where: 'address = ?',
          whereArgs: [url],
        );
      });
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to set default server: $e\n$st');
      return Failure(Exception('Failed to set default server: $e\n$st'));
    }
  }

  /// Removes a server from the database.
  ///
  /// This method deletes the server identified by [address] from the `servers`
  /// table.
  ///
  /// Parameters:
  /// - [address]: The address of the server to remove.
  /// - [txn]: An optional [Transaction] object for executing the delete
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///   `false` if it fails.
  Future<Result<void>> removeServerQuery(
    String address, {
    Transaction? txn,
  }) async {
    try {
      await _secureStorageService.deleteValue('${address}_token');
      await _secureStorageService.deleteValue('${address}_password');
      await _secureStorageService.deleteValue('${address}_sid');

      logger.d((await _secureStorageService.readAll()).toString());

      Future<void> performDelete(DatabaseExecutor db) async {
        await db.delete(
          'servers',
          where: 'address = ?',
          whereArgs: [address],
        );
      }

      if (txn != null) {
        await performDelete(txn);
      } else {
        await _dbInstance?.transaction((innerTxn) async {
          await performDelete(innerTxn);
        });
      }

      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to remove server: $e\n$st');
      return Failure(Exception('Failed to remove server: $e\n$st'));
    }
  }

  /// Deletes all data in the `servers` table.
  ///
  /// This method clears the `servers` table, removing all server entries.
  ///
  /// Parameters:
  /// - [txn]: An optional [Transaction] object for executing the delete
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///   `false` if it fails.
  Future<Result<void>> deleteServersDataQuery({Transaction? txn}) async {
    try {
      await _secureStorageService.clearAll();

      if (txn != null) {
        await txn.delete('servers');
      } else {
        await _dbInstance?.transaction((innerTxn) async {
          await innerTxn.delete('servers');
        });
      }
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to delete servers data: $e\n$st');
      return Failure(Exception('Failed to delete servers data: $e\n$st'));
    }
  }

  /// Checks if a server with a specific URL exists in the database.
  ///
  /// This method queries the `servers` table to determine if a server with the
  /// given [url] exists.
  ///
  /// Parameters:
  /// - [url]: The URL of the server to check.
  ///
  /// Returns:
  /// - A `Future` that resolves to a map:
  ///   - `result`: Indicates if the query was successful (`'success'` or `'fail'`).
  ///   - `exists`: A boolean indicating whether the server exists (`true` or `false`).
  Future<Result<bool>> checkUrlExistsQuery(String url) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      return await _dbInstance!.transaction((txn) async {
        final res = await txn.query(
          'servers',
          columns: ['count(address) as quantity'],
          where: 'address = ?',
          whereArgs: [url],
        );

        if (res[0]['quantity'] == 0) {
          return const Success(false);
        } else {
          return const Success(true);
        }
      });
    } catch (e, st) {
      logger.e('Failed to check if URL exists: $e\n$st');
      return Failure(Exception('Failed to check if URL exists: $e\n$st'));
    }
  }

  /// Updates a specific configuration field in the `appConfig` table.
  ///
  /// This method updates a single field in the `appConfig` table with the
  /// specified [value].
  ///
  /// Parameters:
  /// - [column]: The name of the column to update.
  /// - [value]: The new value for the specified column.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///   `false` if it fails.
  Future<Result<void>> updateConfigQuery({
    required String column,
    required Object? value,
  }) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      if (column == 'passCode') {
        if (value == null) {
          await _secureStorageService.deleteValue('passCode');
          return Success.unit();
        }

        await _secureStorageService.saveValue('passCode', value.toString());
        return Success.unit();
      }

      return await _dbInstance!.transaction((txn) async {
        await txn.update(
          'appConfig',
          {column: value},
        );
        return Success.unit();
      });
    } catch (e, st) {
      logger.e('Failed to update config: $e\n$st');
      return Failure(Exception('Failed to update config: $e\n$st'));
    }
  }

  /// Restores the default application configuration.
  ///
  /// This method resets all fields in the `appConfig` table to their default
  /// values.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///   `false` if it fails.
  Future<Result<void>> restoreAppConfigQuery() async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      await _secureStorageService.deleteValue('passCode');
      return await _dbInstance!.transaction((txn) async {
        await txn.update(
          'appConfig',
          {
            'autoRefreshTime': 5,
            'theme': 0,
            'language': 'en',
            'reducedDataCharts': 0,
            'logsPerQuery': 2,
            'useBiometricAuth': 0,
            'importantInfoReaden': 0,
            'hideZeroValues': 0,
            'loadingAnimation': 0,
            'statisticsVisualizationMode': 0,
            'homeVisualizationMode': 0,
            'sendCrashReports': 0,
          },
        );
        return Success.unit();
      });
    } catch (e, st) {
      logger.e('Failed to restore app config: $e\n$st');
      return Failure(Exception('Failed to restore app config: $e\n$st'));
    }
  }

  /// Delete and clean up unused secure storage data for servers not present in the database.
  /// This method is intended to be called during application startup.
  Future<Result<void>> cleanUpSecureStorage() async {
    final serverAddresses = servers.map((e) => e.address).toList();
    final keys = await _secureStorageService.readAll();

    if (keys.isError()) {
      logger.e('Failed to read secure storage keys: ${keys.exceptionOrNull()}');
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
      await _secureStorageService.deleteValue(key);
    }

    return Success.unit();
  }

  /// Gets the gravity update status for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update to check.
  ///
  /// Returns:
  /// - A `Future` that resolves to a [GravityUpdateData] object if the
  Future<Result<GravityUpdateData>> getGravityUpdateQuery(
    String address,
  ) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      final res = await _dbInstance!.transaction((txn) async {
        final result = await txn.query(
          'gravity_updates',
          where: 'address = ?',
          whereArgs: [address],
        );
        if (result.isNotEmpty) {
          return GravityUpdateData.fromMap(result[0]);
        }
        // If not entry found, return a fake entry with default values
        return GravityUpdateData(
          address: '',
          startTime: DateTime.fromMillisecondsSinceEpoch(0),
          endTime: DateTime.fromMillisecondsSinceEpoch(0),
          status: GravityStatus.idle.index, // TODO: enum
        );
      });

      return Success(res);
    } catch (e, st) {
      logger.e('Failed to get gravity update: $e\n$st');
      return Failure(Exception('Failed to get gravity update: $e\n$st'));
    }
  }

  /// Inserts or updates a gravity update entry in the database.
  ///
  /// This method performs an upsert operation, inserting a new entry or
  /// updating an existing one based on the provided address.
  ///
  /// Parameters:
  /// - [gravityUpdateData]: The [GravityUpdateData] object containing the
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///  `false` if it fails.
  Future<Result<void>> upsertGravityUpdateQuery(
    GravityUpdateData gravityUpdateData,
  ) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      return await _dbInstance!.transaction((txn) async {
        await txn.insert(
          'gravity_updates',
          {
            'address': gravityUpdateData.address,
            'start_time': gravityUpdateData.startTime.toUtc().toIso8601String(),
            'end_time': gravityUpdateData.endTime.toUtc().toIso8601String(),
            'status': gravityUpdateData.status,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        return Success.unit();
      });
    } catch (e, st) {
      logger.e('Failed to upsert gravity update: $e\n$st');
      return Failure(Exception('Failed to upsert gravity update: $e\n$st'));
    }
  }

  /// Removes a gravity update entry from the database.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update to remove.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///  `false` if it fails.
  Future<Result<void>> removeGravityUpdateQuery(String address) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      return await _dbInstance!.transaction((txn) async {
        await txn.delete(
          'gravity_updates',
          where: 'address = ?',
          whereArgs: [address],
        );
        return Success.unit();
      });
    } catch (e, st) {
      logger.e('Failed to remove gravity update: $e\n$st');
      return Failure(Exception('Failed to remove gravity update: $e\n$st'));
    }
  }

  /// Gets the gravity logs for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update to check.
  ///
  /// Returns:
  /// - A `Future` that resolves to a list of [GravityLogData] objects if the
  Future<Result<List<GravityLogData>>> getGravityLogsQuery(
    String address,
  ) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      final res = await _dbInstance!.transaction((txn) async {
        final result = await txn.query(
          'gravity_logs',
          where: 'address = ?',
          whereArgs: [address],
        );
        if (result.isNotEmpty) {
          return result.map(GravityLogData.fromMap).toList();
        }
        return null;
      });
      return Success(res ?? []);
    } catch (e, st) {
      logger.e('Failed to get gravity logs: $e\n$st');
      return Failure(Exception('Failed to get gravity logs: $e\n$st'));
    }
  }

  /// Inserts a gravity log entry into the database.
  ///
  /// Parameters:
  /// - [gravityLogsDataList]: A list of [GravityLogData] objects to insert.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///  `false` if it fails.
  Future<Result<void>> insertGravityLogQuery(
    List<GravityLogData> gravityLogsDataList,
  ) async {
    try {
      await _dbInstance?.transaction((txn) async {
        for (final log in gravityLogsDataList) {
          await txn.insert(
            'gravity_logs',
            {
              'address': log.address,
              'line': log.line,
              'message': log.message,
              'timestamp': log.timestamp.toUtc().toIso8601String(),
            },
          );
        }
      });
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to insert gravity log: $e\n$st');
      return Failure(Exception('Failed to insert gravity log: $e\n$st'));
    }
  }

  /// Removes all gravity log entries for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  /// `false` if it fails.
  Future<Result<void>> clearGravityLogsQuery(String address) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      return await _dbInstance!.transaction((txn) async {
        await txn.delete(
          'gravity_logs',
          where: 'address = ?',
          whereArgs: [address],
        );
        return Success.unit();
      });
    } catch (e, st) {
      logger.e('Failed to clear gravity logs: $e\n$st');
      return Failure(Exception('Failed to clear gravity logs: $e\n$st'));
    }
  }

  /// Gets the gravity messages for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update to check.
  ///
  /// Returns:
  /// - A `Future` that resolves to a list of [GravityMessageData] objects if the
  Future<Result<List<GravityMessageData>>> getGravityMessagesQuery(
    String address,
  ) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      final res = await _dbInstance!.transaction((txn) async {
        final result = await txn.query(
          'gravity_messages',
          where: 'address = ?',
          whereArgs: [address],
        );
        if (result.isNotEmpty) {
          return result.map(GravityMessageData.fromMap).toList();
        }
        return null;
      });
      return Success(res ?? []);
    } catch (e, st) {
      logger.e('Failed to get gravity messages: $e\n$st');
      return Failure(Exception('Failed to get gravity messages: $e\n$st'));
    }
  }

  /// Inserts a gravity message entry into the database.
  ///
  /// Parameters:
  /// - [messagesList]: A list of [GravityMessageData] objects to insert.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///  `false` if it fails.
  Future<Result<void>> insertGravityMessageQuery(
    List<GravityMessageData> messagesList,
  ) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      await _dbInstance!.transaction((txn) async {
        for (final msg in messagesList) {
          await txn.insert(
            'gravity_messages',
            {
              'address': msg.address,
              'message_id': msg.id,
              'message': msg.message,
              'url': msg.url,
              'timestamp': msg.timestamp.toUtc().toIso8601String(),
            },
          );
        }
      });
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to insert gravity message: $e\n$st');
      return Failure(Exception('Failed to insert gravity message: $e\n$st'));
    }
  }

  /// Removes all gravity message entries for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///  `false` if it fails.
  Future<Result<void>> clearGravityMessagesQuery(String address) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      return await _dbInstance!.transaction((txn) async {
        await txn.delete(
          'gravity_messages',
          where: 'address = ?',
          whereArgs: [address],
        );
        return Success.unit();
      });
    } catch (e, st) {
      logger.e('Failed to clear gravity messages: $e\n$st');
      return Failure(Exception('Failed to clear gravity messages: $e\n$st'));
    }
  }

  Future<Result<GravityData>> getGravityDataQuery(String address) async {
    try {
      final gravityUpdateData = await getGravityUpdateQuery(address);
      final gravityLogsData = await getGravityLogsQuery(address);
      final gravityMessagesData = await getGravityMessagesQuery(address);

      return Success(
        GravityData(
          gravityUpdate: gravityUpdateData.getOrNull(),
          gravityLogs: gravityLogsData.getOrNull(),
          gravityMessages: gravityMessagesData.getOrNull(),
        ),
      );
    } catch (e, st) {
      logger.e('Failed to get gravity data: $e\n$st');
      return Failure(Exception('Failed to get gravity data: $e\n$st'));
    }
  }

  /// Removes all gravity data (status, logs and messages) for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update.
  /// - [txn]: An optional [Transaction] object for executing the delete
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  /// `false` if it fails.
  Future<Result<void>> clearGravityDataQuery(
    String address, {
    Transaction? txn,
  }) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      Future<void> performDelete(DatabaseExecutor db) async {
        await db.delete(
          'gravity_updates',
          where: 'address = ?',
          whereArgs: [address],
        );
        await db.delete(
          'gravity_logs',
          where: 'address = ?',
          whereArgs: [address],
        );
        await db.delete(
          'gravity_messages',
          where: 'address = ?',
          whereArgs: [address],
        );
      }

      if (txn != null) {
        await performDelete(txn);
      } else {
        await _dbInstance!.transaction((innerTxn) async {
          await performDelete(innerTxn);
        });
      }

      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to clear gravity data: $e\n$st');
      return Failure(Exception('Failed to clear gravity data: $e\n$st'));
    }
  }

  /// Removes all gravity data (status, logs and messages) from the database.
  ///
  /// Parameters:
  /// - [txn]: An optional [Transaction] object for executing the delete
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  /// `false` if it fails.
  Future<Result<void>> clearAllGravityDataQuery({Transaction? txn}) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      if (txn != null) {
        await txn.delete('gravity_updates');
        await txn.delete('gravity_logs');
        await txn.delete('gravity_messages');
      } else {
        await _dbInstance!.transaction((innerTxn) async {
          await innerTxn.delete('gravity_updates');
          await innerTxn.delete('gravity_logs');
          await innerTxn.delete('gravity_messages');
        });
      }

      return Success.unit();
    } catch (e) {
      return Failure(Exception('Failed to clear all gravity data: $e'));
    }
  }

  Future<Result<void>> deleteMessageQuery(String address, int id) async {
    try {
      if (_dbInstance == null) {
        throw Exception('Database instance is not initialized.');
      }

      return await _dbInstance!.transaction((txn) async {
        await txn.delete(
          'gravity_messages',
          where: 'address = ? AND message_id = ?',
          whereArgs: [address, id],
        );
        return Success.unit();
      });
    } catch (e, st) {
      logger.e('Failed to delete message: $e\n$st');
      return Failure(Exception('Failed to delete message: $e\n$st'));
    }
  }
}
