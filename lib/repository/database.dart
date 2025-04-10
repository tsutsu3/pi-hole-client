import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository {
  DatabaseRepository(this._secureStorage);

  late final List<ServerDbData>? _servers;
  late final AppDbData? _appConfig;
  late final Database _dbInstance;
  final SecureStorageRepository _secureStorage;

  List<ServerDbData> get servers {
    if (_servers == null) {
      throw Exception(
        'DatabaseRepository is not initialized. Call initialize() first.',
      );
    }
    return _servers!;
  }

  AppDbData get appConfig {
    if (_appConfig == null) {
      throw Exception(
        'DatabaseRepository is not initialized. Call initialize() first.',
      );
    }
    return _appConfig!;
  }

  Database get dbInstance {
    return _dbInstance;
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
  Future<void> initialize({String? path}) async {
    final piHoleClientData = await loadDb(path: path);
    _servers = piHoleClientData.servers;
    _appConfig = piHoleClientData.appConfig;
    _dbInstance = piHoleClientData.dbInstance;
    await cleanUpSecureStorage();
    logger.d('Secure storage: ${await _secureStorage.readAll()}');
  }

  Map<String, dynamic> toDict() {
    return PiHoleClientData(
      servers: _servers,
      appConfig: _appConfig!,
      dbInstance: _dbInstance,
    ).toDict();
  }

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
  Future<PiHoleClientData> loadDb({String? path}) async {
    List<ServerDbData>? servers;
    AppDbData? appConfig;

    final db = await openDatabase(
      path ?? 'pi_hole_client.db',
      version: 3,
      onCreate: (Database db, int version) async {
        await db.execute('''
            CREATE TABLE servers (
              address TEXT PRIMARY KEY NOT NULL,
              alias TEXT NOT NULL,
              isDefaultServer NUMERIC NOT NULL,
              apiVersion TEXT NOT NULL
            )
          ''');
        await db.execute('''
            CREATE TABLE appConfig (
              autoRefreshTime NUMERIC NOT NULL,
              theme NUMERIC NOT NULL,
              language TEXT NOT NULL,
              overrideSslCheck NUMERIC NOT NULL,
              reducedDataCharts NUMERIC NOT NULL,
              logsPerQuery NUMERIC NOT NULL,
              useBiometricAuth NUMERIC NOT NULL,
              importantInfoReaden NUMERIC NOT NULL,
              hideZeroValues NUMERIC NOT NULL,
              statisticsVisualizationMode NUMERIC NOT NULL,
              sendCrashReports NUMERIC NOT NULL
            )
          ''');
        await db.execute('''
            INSERT INTO appConfig (
              autoRefreshTime,
              theme,
              language,
              overrideSslCheck,
              reducedDataCharts,
              logsPerQuery,
              useBiometricAuth,
              importantInfoReaden,
              hideZeroValues,
              statisticsVisualizationMode,
              sendCrashReports
            ) VALUES (5, 0, 'en', 1, 0, 2, 0, 0, 0, 0, 0)
          ''');

        await db.execute('''
            CREATE TABLE gravity_updates (
              address TEXT PRIMARY KEY NOT NULL,
              start_time TEXT NOT NULL,
              end_time TEXT NOT NULL,
              status INTEGER NOT NULL
            )
          ''');

        await db.execute('''
            CREATE TABLE gravity_logs (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              address TEXT NOT NULL,
              line INTEGER NOT NULL,
              message TEXT NOT NULL,
              timestamp TEXT NOT NULL,
              FOREIGN KEY (address) REFERENCES gravity_updates(address) ON DELETE CASCADE
            )
          ''');

        await db.execute('''
            CREATE TABLE gravity_messages (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              address TEXT NOT NULL,
              message_id INTEGER NOT NULL,
              message TEXT NOT NULL,
              url TEXT NOT NULL,
              timestamp TEXT NOT NULL,
              FOREIGN KEY (address) REFERENCES gravity_updates(address) ON DELETE CASCADE
            )
          ''');
        logger.d('Database created');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion == 1) {
          await _upgradeToV2(db);
        } else if (oldVersion == 2) {
          await _upgradeToV3(db);
        }
      },
      onDowngrade: (Database db, int oldVersion, int newVersion) async {},
      onOpen: (Database db) async {
        await db.transaction((txn) async {
          final serverRows = await txn.rawQuery('SELECT * FROM servers');
          servers = serverRows.map(ServerDbData.fromMap).toList();
        });
        await db.transaction((txn) async {
          final appConfigRows = await txn.rawQuery('SELECT * FROM appConfig');
          appConfig = AppDbData.fromMap(appConfigRows[0]);
        });

        // Load sensitive data from secure storage
        final passCode = await _secureStorage.getValue('passCode');
        appConfig = AppDbData.withSecrets(appConfig!, passCode);

        if (servers != null && servers!.isNotEmpty) {
          for (var i = 0; i < servers!.length; i++) {
            final server = servers![i];
            final token =
                await _secureStorage.getValue('${server.address}_token');
            final sid = await _secureStorage.getValue('${server.address}_sid');

            servers![i] = ServerDbData.withSecrets(
              server,
              token,
              sid,
            );
          }
        }
      },
    );

    return PiHoleClientData(
      servers: servers,
      appConfig: appConfig!,
      dbInstance: db,
    );
  }

  /// Closes the database connection.
  ///
  /// This method closes the database connection and releases any resources
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful.
  Future<bool> closeDb() async {
    try {
      await _dbInstance.close();
      return true;
    } catch (e) {
      return false;
    }
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
  Future<bool?> saveServerQuery(Server server) async {
    try {
      final token = await server.sm.token;
      if (token != null) {
        await _secureStorage.saveValue('${server.address}_token', token);
      }

      final password = await server.sm.password;
      if (password != null) {
        await _secureStorage.saveValue('${server.address}_password', password);
      }
      if (server.sm.sid != null) {
        await _secureStorage.saveValue(
          '${server.address}_sid',
          server.sm.sid ?? '',
        );
      }

      await _dbInstance.transaction((txn) async {
        await txn.insert('servers', {
          'address': server.address,
          'alias': server.alias,
          'isDefaultServer': 0,
          'apiVersion': server.apiVersion,
        });
      });
      return true;
    } catch (e) {
      return null;
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
  Future<bool> editServerQuery(Server server) async {
    try {
      final token = await server.sm.token;
      if (token != null) {
        await _secureStorage.saveValue('${server.address}_token', token);
      }

      final password = await server.sm.password;
      if (password != null) {
        await _secureStorage.saveValue('${server.address}_password', password);
      }
      if (server.sm.sid != null) {
        await _secureStorage.saveValue('${server.address}_sid', server.sm.sid!);
      }

      return await _dbInstance.transaction((txn) async {
        await txn.update(
          'servers',
          {
            'alias': server.alias,
            'isDefaultServer': convertFromBoolToInt(server.defaultServer),
            'apiVersion': server.apiVersion,
          },
          where: 'address = ?',
          whereArgs: [server.address],
        );
        return true;
      });
    } catch (e, stackTrace) {
      logger.e('Error editing server', error: e, stackTrace: stackTrace);
      return false;
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
  Future<bool?> setDefaultServerQuery(String url) async {
    try {
      await _dbInstance.transaction((txn) async {
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
      return true;
    } catch (e) {
      return null;
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
  Future<bool> removeServerQuery(String address, {Transaction? txn}) async {
    try {
      await _secureStorage.deleteValue('${address}_token');
      await _secureStorage.deleteValue('${address}_password');
      await _secureStorage.deleteValue('${address}_sid');

      logger.d((await _secureStorage.readAll()).toString());

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
        await _dbInstance.transaction((innerTxn) async {
          await performDelete(innerTxn);
        });
      }

      return true;
    } catch (e) {
      return false;
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
  Future<bool> deleteServersDataQuery({Transaction? txn}) async {
    try {
      await _secureStorage.clearAll();

      if (txn != null) {
        await txn.delete('servers');
      } else {
        await _dbInstance.transaction((innerTxn) async {
          await innerTxn.delete('servers');
        });
      }
      return true;
    } catch (e) {
      return false;
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
  Future<Map<String, dynamic>> checkUrlExistsQuery(String url) async {
    try {
      return await _dbInstance.transaction((txn) async {
        final res = await txn.query(
          'servers',
          columns: ['count(address) as quantity'],
          where: 'address = ?',
          whereArgs: [url],
        );

        if (res[0]['quantity'] == 0) {
          return {'result': 'success', 'exists': false};
        } else {
          return {'result': 'success', 'exists': true};
        }
      });
    } catch (e) {
      return {'result': 'fail'};
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
  Future<bool> updateConfigQuery({
    required String column,
    required Object? value,
  }) async {
    try {
      if (column == 'passCode') {
        if (value == null) {
          await _secureStorage.deleteValue('passCode');
          return true;
        }

        await _secureStorage.saveValue('passCode', value.toString());
        return true;
      }

      return await _dbInstance.transaction((txn) async {
        await txn.update(
          'appConfig',
          {column: value},
        );
        return true;
      });
    } catch (e) {
      logger.e(e);
      return false;
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
  Future<bool> restoreAppConfigQuery() async {
    try {
      await _secureStorage.deleteValue('passCode');
      return await _dbInstance.transaction((txn) async {
        await txn.update(
          'appConfig',
          {
            'autoRefreshTime': 5,
            'theme': 0,
            'language': 'en',
            'overrideSslCheck': 1,
            'reducedDataCharts': 0,
            'logsPerQuery': 2,
            'useBiometricAuth': 0,
            'importantInfoReaden': 0,
            'hideZeroValues': 0,
            'statisticsVisualizationMode': 0,
            'sendCrashReports': 0,
          },
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }

  /// Delete and clean up unused secure storage data for servers not present in the database.
  /// This method is intended to be called during application startup.
  Future<void> cleanUpSecureStorage() async {
    final serverAddresses = servers.map((e) => e.address).toList();
    final keys = await _secureStorage.readAll();

    // Collect keys to be deleted
    final keysToDelete = <String>[];

    for (final key in keys.keys) {
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
  }

  /// Gets the gravity update status for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update to check.
  ///
  /// Returns:
  /// - A `Future` that resolves to a [GravityUpdateData] object if the
  Future<GravityUpdateData?> getGravityUpdateQuery(String address) async {
    try {
      final res = await _dbInstance.transaction((txn) async {
        final result = await txn.query(
          'gravity_updates',
          where: 'address = ?',
          whereArgs: [address],
        );
        if (result.isNotEmpty) {
          return GravityUpdateData.fromMap(result[0]);
        }
        return null;
      });
      return res;
    } catch (e) {
      return null;
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
  Future<bool> upsertGravityUpdateQuery(
    GravityUpdateData gravityUpdateData,
  ) async {
    try {
      return await _dbInstance.transaction((txn) async {
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
        return true;
      });
    } catch (e) {
      return false;
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
  Future<bool> removeGravityUpdateQuery(String address) async {
    try {
      return await _dbInstance.transaction((txn) async {
        await txn.delete(
          'gravity_updates',
          where: 'address = ?',
          whereArgs: [address],
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }

  /// Gets the gravity logs for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update to check.
  ///
  /// Returns:
  /// - A `Future` that resolves to a list of [GravityLogsData] objects if the
  Future<List<GravityLogsData>?> getGravityLogsQuery(String address) async {
    try {
      final res = await _dbInstance.transaction((txn) async {
        final result = await txn.query(
          'gravity_logs',
          where: 'address = ?',
          whereArgs: [address],
        );
        if (result.isNotEmpty) {
          return result.map(GravityLogsData.fromMap).toList();
        }
        return null;
      });
      return res;
    } catch (e) {
      return null;
    }
  }

  /// Inserts a gravity log entry into the database.
  ///
  /// Parameters:
  /// - [gravityLogsDataList]: A list of [GravityLogsData] objects to insert.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///  `false` if it fails.
  Future<bool> insertGravityLogQuery(
    List<GravityLogsData> gravityLogsDataList,
  ) async {
    try {
      await _dbInstance.transaction((txn) async {
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
      return true;
    } catch (e) {
      return false;
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
  Future<bool> clearGravityLogsQuery(String address) async {
    try {
      return await _dbInstance.transaction((txn) async {
        await txn.delete(
          'gravity_logs',
          where: 'address = ?',
          whereArgs: [address],
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }

  /// Gets the gravity messages for a specific address.
  ///
  /// Parameters:
  /// - [address]: The address of the gravity update to check.
  ///
  /// Returns:
  /// - A `Future` that resolves to a list of [GravityMessagesData] objects if the
  Future<List<GravityMessagesData>?> getGravityMessagesQuery(
    String address,
  ) async {
    try {
      final res = await _dbInstance.transaction((txn) async {
        final result = await txn.query(
          'gravity_messages',
          where: 'address = ?',
          whereArgs: [address],
        );
        if (result.isNotEmpty) {
          return result.map(GravityMessagesData.fromMap).toList();
        }
        return null;
      });
      return res;
    } catch (e) {
      return null;
    }
  }

  /// Inserts a gravity message entry into the database.
  ///
  /// Parameters:
  /// - [messagesList]: A list of [GravityMessagesData] objects to insert.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///  `false` if it fails.
  Future<bool> insertGravityMessageQuery(
    List<GravityMessagesData> messagesList,
  ) async {
    try {
      await _dbInstance.transaction((txn) async {
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
      return true;
    } catch (e) {
      return false;
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
  Future<bool> clearGravityMessagesQuery(String address) async {
    try {
      return await _dbInstance.transaction((txn) async {
        await txn.delete(
          'gravity_messages',
          where: 'address = ?',
          whereArgs: [address],
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }

  Future<GravityData?> getGravityDataQuery(String address) async {
    try {
      final gravityUpdateData = await getGravityUpdateQuery(address);
      final gravityLogsData = await getGravityLogsQuery(address);
      final gravityMessagesData = await getGravityMessagesQuery(address);

      return GravityData(
        gravityUpdate: gravityUpdateData,
        gravityLogs: gravityLogsData,
        gravityMessages: gravityMessagesData,
      );
    } catch (e) {
      return null;
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
  Future<bool> clearGravityDataQuery(String address, {Transaction? txn}) async {
    try {
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
        await _dbInstance.transaction((innerTxn) async {
          await performDelete(innerTxn);
        });
      }

      return true;
    } catch (e) {
      return false;
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
  Future<bool> clearAllGravityDataQuery({Transaction? txn}) async {
    try {
      if (txn != null) {
        await txn.delete('gravity_updates');
        await txn.delete('gravity_logs');
        await txn.delete('gravity_messages');
      } else {
        await _dbInstance.transaction((innerTxn) async {
          await innerTxn.delete('gravity_updates');
          await innerTxn.delete('gravity_logs');
          await innerTxn.delete('gravity_messages');
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteMessageQuery(String address, int id) async {
    try {
      return await _dbInstance.transaction((txn) async {
        await txn.delete(
          'gravity_messages',
          where: 'address = ? AND message_id = ?',
          whereArgs: [address, id],
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }
  // ==========================================================================
  // MIGRATION METHODS
  // ==========================================================================

  // Migration methods
  Future<dynamic> _upgradeToV2(Database db) async {
    // await db.execute('ALTER TABLE appConfig DROP COLUMN oneColumnLegend');

    // 1. Create a new table
    await db.execute('''
    CREATE TABLE appConfig_new (
      autoRefreshTime NUMERIC NOT NULL,
      theme NUMERIC NOT NULL,
      language TEXT NOT NULL,
      overrideSslCheck NUMERIC NOT NULL,
      reducedDataCharts NUMERIC NOT NULL,
      logsPerQuery NUMERIC NOT NULL,
      useBiometricAuth NUMERIC NOT NULL,
      importantInfoReaden NUMERIC NOT NULL,
      hideZeroValues NUMERIC NOT NULL,
      statisticsVisualizationMode NUMERIC NOT NULL,
      sendCrashReports NUMERIC NOT NULL
    )
    ''');

    // 2. Copy data from the old table to the new table
    await db.execute('''
    INSERT INTO appConfig_new (autoRefreshTime, theme, language,
      overrideSslCheck, reducedDataCharts, logsPerQuery, useBiometricAuth,
      importantInfoReaden, hideZeroValues, statisticsVisualizationMode,
      sendCrashReports)
    SELECT autoRefreshTime, theme, language, overrideSslCheck,
      reducedDataCharts, logsPerQuery, useBiometricAuth, importantInfoReaden,
      hideZeroValues, statisticsVisualizationMode, sendCrashReports
    FROM appConfig
    ''');

    // 3. Drop the old table
    await db.execute('DROP TABLE appConfig');

    // 4. Rename the new table to the old table
    await db.execute('ALTER TABLE appConfig_new RENAME TO appConfig');
  }

  Future<dynamic> _upgradeToV3(Database db) async {
    await db.execute('''
            CREATE TABLE gravity_updates (
              address TEXT PRIMARY KEY NOT NULL,
              start_time TEXT NOT NULL,
              end_time TEXT NOT NULL,
              status INTEGER NOT NULL
            )
          ''');

    await db.execute('''
            CREATE TABLE gravity_logs (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              address TEXT NOT NULL,
              line INTEGER NOT NULL,
              message TEXT NOT NULL,
              timestamp TEXT NOT NULL,
              FOREIGN KEY (address) REFERENCES gravity_updates(address) ON DELETE CASCADE
            )
          ''');

    await db.execute('''
            CREATE TABLE gravity_messages (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              address TEXT NOT NULL,
              message_id INTEGER NOT NULL,
              message TEXT NOT NULL,
              url TEXT NOT NULL,
              timestamp TEXT NOT NULL,
              FOREIGN KEY (address) REFERENCES gravity_updates(address) ON DELETE CASCADE
            )
          ''');

    logger.d('Database upgraded to version 3');
  }
}
