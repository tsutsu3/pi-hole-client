import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/conversions.dart';

class DatabaseRepository {
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

  DatabaseRepository(this._secureStorage);

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

    Database db = await openDatabase(
      path ?? 'pi_hole_client.db',
      version: 1,
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
              oneColumnLegend NUMERIC NOT NULL,
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
              oneColumnLegend,
              reducedDataCharts,
              logsPerQuery,
              useBiometricAuth,
              importantInfoReaden,
              hideZeroValues,
              statisticsVisualizationMode,
              sendCrashReports
            ) VALUES (5, 0, 'en', 0, 0, 0, 2, 0, 0, 0, 0, 0)
          ''');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {},
      onDowngrade: (Database db, int oldVersion, int newVersion) async {},
      onOpen: (Database db) async {
        await db.transaction((txn) async {
          final serverRows = await txn.rawQuery('SELECT * FROM servers');
          servers = serverRows.map((row) => ServerDbData.fromMap(row)).toList();
        });
        await db.transaction((txn) async {
          final appConfigRows = await txn.rawQuery('SELECT * FROM appConfig');
          appConfig = AppDbData.fromMap(appConfigRows[0]);
        });

        // Load sensitive data from secure storage
        final passCode = await _secureStorage.getValue('passCode');
        appConfig = AppDbData.withSecrets(appConfig!, passCode);

        // _secureStorage.readAll()
        logger.d((await _secureStorage.readAll()).toString());

        if (servers != null && servers!.isNotEmpty) {
          for (int i = 0; i < servers!.length; i++) {
            final server = servers![i];
            final token =
                await _secureStorage.getValue('${server.address}_token');
            final basicAuthUser = await _secureStorage
                .getValue('${server.address}_basicAuthUser');
            final basicAuthPassword = await _secureStorage
                .getValue('${server.address}_basicAuthPassword');
            final sid = await _secureStorage.getValue('${server.address}_sid');

            servers![i] = ServerDbData.withSecrets(
              server,
              token,
              basicAuthUser,
              basicAuthPassword,
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
  /// - [db]: The database instance where the server entry will be stored.
  /// - [server]: The server object containing the details to be saved.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the save operation is successful.
  /// - Returns `null` or an appropriate error response if the operation fails.
  Future<bool?> saveServerQuery(Server server) async {
    try {
      if (server.token != null) {
        await _secureStorage.saveValue(
          '${server.address}_token',
          server.token!,
        );
      }
      if (server.basicAuthUser != null) {
        await _secureStorage.saveValue(
          '${server.address}_basicAuthUser',
          server.basicAuthUser!,
        );
      }
      if (server.basicAuthPassword != null) {
        await _secureStorage.saveValue(
          '${server.address}_basicAuthPassword',
          server.basicAuthPassword!,
        );
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
  /// - [db]: The [Database] instance where the transaction is performed.
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
      if (server.token != null) {
        await _secureStorage.saveValue(
          '${server.address}_token',
          server.token!,
        );
      }
      if (server.basicAuthUser != null) {
        await _secureStorage.saveValue(
          '${server.address}_basicAuthUser',
          server.basicAuthUser!,
        );
      }
      if (server.basicAuthPassword != null) {
        await _secureStorage.saveValue(
          '${server.address}_basicAuthPassword',
          server.basicAuthPassword!,
        );
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
  /// - [db]: The [Database] instance to perform the transaction.
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

  /// Updates the token for a specific server in the database.
  ///
  /// This method updates the `token` field of the server identified by
  /// [address] in the `servers` table.
  ///
  /// Parameters:
  /// - [db]: The [Database] instance to perform the transaction.
  /// - [token]: The new token value for the server. If `null`, an empty string
  ///   will be saved.
  /// - [address]: The address of the server to update.
  ///
  /// Returns:
  /// - A `Future` that resolves to `null` on success, or the error if the
  ///   operation fails.
  // Future<dynamic> setServerTokenQuery(String? token, String address) async {
  //   try {
  //     if (token != null) {
  //       await _secureStorage.saveValue('${address}_token', token);
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

  /// Updates the basic authentication credentials for a server in the database.
  ///
  /// This method updates the `password` field of the server identified by
  /// [address] in the `servers` table.
  ///
  /// Parameters:
  /// - [password]: The new password value for the server. If `null`, an empty
  /// - [address]: The address of the server to update.
  // Future<dynamic> setPsswordQuery(String? password, String address) async {
  //   try {
  //     if (password != null) {
  //       await _secureStorage.saveValue('${address}_password', password);
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

  /// Removes a server from the database.
  ///
  /// This method deletes the server identified by [address] from the `servers`
  /// table.
  ///
  /// Parameters:
  /// - [db]: The [Database] instance to perform the transaction.
  /// - [address]: The address of the server to remove.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///   `false` if it fails.
  Future<bool> removeServerQuery(String address) async {
    try {
      await _secureStorage.deleteValue('${address}_token');
      await _secureStorage.deleteValue('${address}_basicAuthUser');
      await _secureStorage.deleteValue('${address}_basicAuthPassword');
      await _secureStorage.deleteValue('${address}_password');
      await _secureStorage.deleteValue('${address}_sid');
      logger.d((await _secureStorage.readAll()).toString());

      return await _dbInstance.transaction((txn) async {
        await txn.delete('servers', where: 'address = ?', whereArgs: [address]);
        return true;
      });
    } catch (e) {
      return false;
    }
  }

  /// Deletes all data in the `servers` table.
  ///
  /// This method clears the `servers` table, removing all server entries.
  ///
  /// Parameters:
  /// - [db]: The [Database] instance to perform the transaction.
  ///
  /// Returns:
  /// - A `Future` that resolves to `true` if the operation is successful, or
  ///   `false` if it fails.
  Future<bool> deleteServersDataQuery() async {
    try {
      await _secureStorage.clearAll();
      return await _dbInstance.transaction((txn) async {
        await txn.delete(
          'servers',
        );
        return true;
      });
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
  /// - [db]: The [Database] instance to perform the query.
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
  /// - [db]: The [Database] instance to perform the transaction.
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
  /// Parameters:
  /// - [db]: The [Database] instance to perform the transaction.
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
            'overrideSslCheck': 0,
            'oneColumnLegend': 0,
            'reducedDataCharts': 0,
            'logsPerQuery': 2,
            'useBiometricAuth': 0,
            'sendCrashReports': 0,
          },
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }
}
