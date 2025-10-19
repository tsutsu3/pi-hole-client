import 'package:pi_hole_client/utils/logger.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';

/// A service class for managing SQLite database operations.
///
/// Provides methods to open, close, and perform basic CRUD operations
/// on the database, as well as execute raw SQL queries and transactions.
/// All operations return a [Result] type for error handling.
///
/// Usage:
///   - Call [open] to initialize the database.
///   - Use [rawQuery], [insert], [update], [delete], and [transaction]
///     for database operations.
///   - Call [close] to properly dispose of the database connection.
///
/// Throws:
///   - Throws an [Exception] if the database is not initialized when
///     attempting to access [instance].
class DatabaseService {
  DatabaseService({String? path}) : _path = path ?? 'pi_hole_client.db';

  final String _path;
  Database? _db;

  bool get isOpen => _db != null;

  /// Returns the initialized [Database] instance.
  ///
  /// Throws an [Exception] if the database has not been initialized.
  Database get instance {
    if (_db == null) throw Exception('Database is not initialized');
    return _db!;
  }

  /// Opens the SQLite database at the specified [_path], optionally using a specific schema [latestVersion].
  ///
  /// This method wraps [openDatabase] and sets up internal lifecycle callbacks for
  /// [_onCreate], [_onUpgrade], [_onDowngrade], and [_onOpen] as defined within this service.
  ///
  /// You can optionally provide a [latestVersion] to simulate opening the database
  /// at a specific version. This is especially useful for testing schema upgrades and migrations.
  ///
  /// Returns:
  /// - [Success] containing the opened [Database] instance if successful.
  /// - [Failure] containing an [Exception] if an error occurs during opening.
  Future<Result<Database>> open({int? latestVersion = 8}) async {
    try {
      _db = await openDatabase(
        _path,
        version: latestVersion,
        onConfigure: _onConfigure,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade,
        onOpen: _onOpen,
      );
      logger.d('Database opened successfully at $_path');
      return Success(_db!);
    } catch (e, st) {
      return Failure(Exception('Database open failed: $e\n$st'));
    }
  }

  /// Closes the database connection if it is open.
  ///
  /// Returns a [Result] indicating success or failure.
  /// - [Success] if the database was closed successfully.
  /// - [Failure] with an [Exception] if an error occurred during the close operation.
  Future<Result<void>> close() async {
    try {
      await _db?.close();
      _db = null;
      logger.d('Database closed successfully');
      return Success.unit();
    } catch (e, st) {
      return Failure(Exception('Database close failed: $e\n$st'));
    }
  }

  // ==========================================================================
  // Basic DB Operations
  // ==========================================================================
  /// Executes a raw SQL query and returns the result as a list of maps.
  ///
  /// [sql] is the raw SQL query string to be executed.
  /// [args] is an optional list of arguments to be used in the query.
  ///
  /// Returns a [Result] containing a list of maps, where each map represents a row from the query result.
  Future<Result<List<Map<String, dynamic>>>> rawQuery(
    String sql, [
    List<dynamic>? args,
  ]) async {
    try {
      final result = await instance.rawQuery(sql, args);
      logger.d('Query success: ${result.length} rows returned');
      return Success(result);
    } catch (e, st) {
      logger.e('Raw query failed: $e\n$st');
      return Failure(Exception('Raw query failed: $e\n$st'));
    }
  }

  /// Executes a read query on the specified [table] with optional filtering and sorting.
  ///
  /// This method wraps [Database.query] and returns the result as a [Result] containing
  /// a list of map entries. You can provide optional parameters such as [where], [whereArgs],
  /// [columns], [groupBy], [having], [orderBy], [limit], and [offset] to customize the query.
  ///
  /// If the query is successful, returns [Success] with the result.
  /// If an error occurs, returns [Failure] with the exception.
  Future<Result<List<Map<String, dynamic>>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    try {
      final result = await instance.query(
        table,
        distinct: distinct,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );
      logger.d('Query success: ${result.length} rows returned');
      return Success(result);
    } catch (e, st) {
      logger.e('Query failed: $e\n$st');
      return Failure(Exception('Query failed: $e\n$st'));
    }
  }

  /// Inserts a new record into the specified [table] with the provided [values].
  ///
  /// Returns a [Result] containing the inserted record's ID on success,
  /// or a [Failure] with an [Exception] if the insert fails or throws an exception.
  Future<Result<int>> insert(
    String table,
    Map<String, dynamic> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    try {
      final id = await instance.insert(
        table,
        values,
        nullColumnHack: nullColumnHack,
        conflictAlgorithm: conflictAlgorithm,
      );
      if (id == 0) {
        logger.e('Insert failed: returned ID = $id');
        return Failure(Exception('Insert failed: returned ID = $id'));
      }
      logger.d('Insert success: ID = $id');
      return Success(id);
    } catch (e, st) {
      logger.e('Insert exception: $e\n$st');
      return Failure(Exception('Insert exception: $e\n$st'));
    }
  }

  /// Updates rows in the specified [table] with the provided [values].
  ///
  /// Optionally, a [where] clause and [whereArgs] can be provided to filter which rows to update.
  ///
  /// Returns a [Result] containing the number of rows affected on success,
  /// or a [Failure] with an [Exception] if the update fails or no rows are affected.
  Future<Result<int>> update(
    String table,
    Map<String, dynamic> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      final count = await instance.update(
        table,
        values,
        where: where,
        whereArgs: whereArgs,
      );
      if (count == 0) {
        logger.e('Update failed: no rows affected');
        return Failure(Exception('Update failed: no rows affected'));
      }
      logger.d('Update success: $count rows affected');
      return Success(count);
    } catch (e, st) {
      logger.e('Update exception: $e\n$st');
      return Failure(Exception('Update exception: $e\n$st'));
    }
  }

  /// Deletes rows from the specified [table] in the database.
  ///
  /// Optionally, a [where] clause and [whereArgs] can be provided to specify
  /// which rows to delete.
  ///
  /// Returns a [Result] containing the number of rows deleted on success,
  /// or a [Failure] with an [Exception] if no rows were affected or if an error occurs.
  Future<Result<int>> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      final count = await instance.delete(
        table,
        where: where,
        whereArgs: whereArgs,
      );
      if (count == 0) {
        return const Success(0);
      }
      logger.d('Delete success: $count rows affected');
      return Success(count);
    } catch (e, st) {
      logger.e('Delete exception: $e\n$st');
      return Failure(Exception('Delete exception: $e\n$st'));
    }
  }

  /// Executes a database [Transaction] and wraps the result in a [Result].
  ///
  /// Takes a function [action] that receives a [Transaction] and returns a [Future] of type [T].
  /// This method ensures the entire operation is executed atomically.
  ///
  /// Returns a [Result] containing the result of the transaction on success,
  /// or a [Failure] with an [Exception] if the transaction fails.
  Future<Result<T>> transaction<T extends Object>(
    Future<T> Function(Transaction txn) action,
  ) async {
    try {
      final result = await instance.transaction(action);
      logger.d('Transaction success: $result');
      return Success(result);
    } catch (e, st) {
      logger.e('Transaction failed: $e\n$st');
      return Failure(Exception('Transaction failed: $e\n$st'));
    }
  }

  // ==========================================================================
  // Lifecycle Hooks
  // ==========================================================================
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE servers (
        address TEXT PRIMARY KEY NOT NULL,
        alias TEXT NOT NULL,
        isDefaultServer NUMERIC NOT NULL,
        apiVersion TEXT NOT NULL,
        allowSelfSignedCert NUMERIC NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE appConfig (
        autoRefreshTime NUMERIC NOT NULL,
        theme NUMERIC NOT NULL,
        language TEXT NOT NULL,
        reducedDataCharts NUMERIC NOT NULL,
        logsPerQuery NUMERIC NOT NULL,
        logAutoRefreshTime NUMERIC NOT NULL,
        liveLog NUMERIC NOT NULL,
        isLivelogPaused NUMERIC NOT NULL,
        useBiometricAuth NUMERIC NOT NULL,
        importantInfoReaden NUMERIC NOT NULL,
        hideZeroValues NUMERIC NOT NULL,
        loadingAnimation NUMERIC NOT NULL,
        statisticsVisualizationMode NUMERIC NOT NULL,
        homeVisualizationMode NUMERIC NOT NULL,
        sendCrashReports NUMERIC NOT NULL
      )
    ''');

    await db.execute('''
      INSERT INTO appConfig (
        autoRefreshTime,
        theme,
        language,
        reducedDataCharts,
        logsPerQuery,
        logAutoRefreshTime,
        liveLog,
        isLivelogPaused,
        useBiometricAuth,
        importantInfoReaden,
        hideZeroValues,
        loadingAnimation,
        statisticsVisualizationMode,
        homeVisualizationMode,
        sendCrashReports
      ) VALUES (5, 0, 'en', 0, 2, 5, 1, 1, 0, 0, 0, 0, 0, 0, 0)
    ''');

    await db.execute('''
      CREATE TABLE gravity_updates (
        address TEXT PRIMARY KEY NOT NULL,
        start_time TEXT NOT NULL,
        end_time TEXT NOT NULL,
        status INTEGER NOT NULL,
        FOREIGN KEY (address) REFERENCES servers(address) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE gravity_logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        address TEXT NOT NULL,
        line INTEGER NOT NULL,
        message TEXT NOT NULL,
        timestamp TEXT NOT NULL,
        FOREIGN KEY (address) REFERENCES servers(address) ON DELETE CASCADE
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
        FOREIGN KEY (address) REFERENCES servers(address) ON DELETE CASCADE
      )
    ''');

    logger.d('Database created');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1) {
      await _upgradeToV2(db);
      await _upgradeToV3(db);
      await _upgradeToV4(db);
      await _upgradeToV5(db);
      await _upgradeToV6(db);
      await _upgradeToV7(db);
      await _upgradeToV8(db);
    } else if (oldVersion == 2) {
      await _upgradeToV3(db);
      await _upgradeToV4(db);
      await _upgradeToV5(db);
      await _upgradeToV6(db);
      await _upgradeToV7(db);
      await _upgradeToV8(db);
    } else if (oldVersion == 3) {
      await _upgradeToV4(db);
      await _upgradeToV5(db);
      await _upgradeToV6(db);
      await _upgradeToV7(db);
      await _upgradeToV8(db);
    } else if (oldVersion == 4) {
      await _upgradeToV5(db);
      await _upgradeToV6(db);
      await _upgradeToV7(db);
      await _upgradeToV8(db);
    } else if (oldVersion == 5) {
      await _upgradeToV6(db);
      await _upgradeToV7(db);
      await _upgradeToV8(db);
    } else if (oldVersion == 6) {
      await _upgradeToV7(db);
      await _upgradeToV8(db);
    } else if (oldVersion == 7) {
      await _upgradeToV8(db);
    } else {
      logger.w(
        'Database upgrade from version $oldVersion to $newVersion is not handled.',
      );
    }
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int newVersion) async {
    logger.w(
      'Database downgrade from version $oldVersion to $newVersion is not handled.',
    );
  }

  Future<void> _onOpen(Database db) async {
    logger.d('Database opened: ${db.path}');
  }

  // ==========================================================================
  // Migration Methods
  // ==========================================================================
  /// Migrates the database to version 2.
  ///
  /// Removes the obsolete `oneColumnLegend` column from the `appConfig` table.
  Future<dynamic> _upgradeToV2(Database db) async {
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

    await db.execute('DROP TABLE appConfig');

    await db.execute('ALTER TABLE appConfig_new RENAME TO appConfig');

    logger.d('Database upgraded to version 2');
  }

  /// Migrates the database to version 3.
  ///
  /// Adds new tables: `gravity_updates`, `gravity_logs`, and `gravity_messages`
  /// for tracking gravity update metadata and messages.
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

  /// Migrates the database to version 4.
  ///
  /// Adds a new `homeVisualizationMode` column to the `appConfig` table.
  Future<dynamic> _upgradeToV4(Database db) async {
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
      homeVisualizationMode NUMERIC NOT NULL,
      sendCrashReports NUMERIC NOT NULL
    )
    ''');

    await db.execute('''
    INSERT INTO appConfig_new (autoRefreshTime, theme, language,
      overrideSslCheck, reducedDataCharts, logsPerQuery, useBiometricAuth,
      importantInfoReaden, hideZeroValues, statisticsVisualizationMode,
      homeVisualizationMode, sendCrashReports)
    SELECT autoRefreshTime, theme, language, overrideSslCheck,
      reducedDataCharts, logsPerQuery, useBiometricAuth, importantInfoReaden,
      hideZeroValues, statisticsVisualizationMode, 0, sendCrashReports
    FROM appConfig
    ''');

    await db.execute('DROP TABLE appConfig');

    await db.execute('ALTER TABLE appConfig_new RENAME TO appConfig');

    logger.d('Database upgraded to version 4');
  }

  /// Migrates the database to version 5.
  ///
  /// Adds `allowSelfSignedCert` to the `servers` table and removes the
  /// deprecated `overrideSslCheck` from the `appConfig` table.
  Future<dynamic> _upgradeToV5(Database db) async {
    await db.execute('''
      CREATE TABLE servers_new (
        address TEXT PRIMARY KEY NOT NULL,
        alias TEXT NOT NULL,
        isDefaultServer NUMERIC NOT NULL,
        apiVersion TEXT NOT NULL,
        allowSelfSignedCert NUMERIC NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE appConfig_new (
        autoRefreshTime NUMERIC NOT NULL,
        theme NUMERIC NOT NULL,
        language TEXT NOT NULL,
        reducedDataCharts NUMERIC NOT NULL,
        logsPerQuery NUMERIC NOT NULL,
        useBiometricAuth NUMERIC NOT NULL,
        importantInfoReaden NUMERIC NOT NULL,
        hideZeroValues NUMERIC NOT NULL,
        statisticsVisualizationMode NUMERIC NOT NULL,
        homeVisualizationMode NUMERIC NOT NULL,
        sendCrashReports NUMERIC NOT NULL
      )
    ''');

    var appConfigRows = <Map<String, dynamic>>[];
    await db.transaction((txn) async {
      appConfigRows = await txn.rawQuery('SELECT * FROM appConfig');
    });
    final allowSelfSignedCert =
        (appConfigRows.isNotEmpty &&
            appConfigRows[0].containsKey('overrideSslCheck'))
        ? appConfigRows[0]['overrideSslCheck']
        : 1; // Default to 1 if the column doesn't exist

    await db.execute('''
      INSERT INTO servers_new (
        address, alias, isDefaultServer, apiVersion, allowSelfSignedCert)
      SELECT
        address, alias, isDefaultServer, apiVersion, $allowSelfSignedCert
      FROM servers
    ''');

    await db.execute('''
    INSERT INTO appConfig_new (autoRefreshTime, theme, language,
      reducedDataCharts, logsPerQuery, useBiometricAuth,
      importantInfoReaden, hideZeroValues, statisticsVisualizationMode,
      homeVisualizationMode, sendCrashReports)
    SELECT autoRefreshTime, theme, language,
      reducedDataCharts, logsPerQuery, useBiometricAuth, importantInfoReaden,
      hideZeroValues, statisticsVisualizationMode,
      homeVisualizationMode, sendCrashReports
    FROM appConfig
    ''');

    await db.execute('DROP TABLE servers');
    await db.execute('DROP TABLE appConfig');

    await db.execute('ALTER TABLE servers_new RENAME TO servers');
    await db.execute('ALTER TABLE appConfig_new RENAME TO appConfig');

    logger.d('Database upgraded to version 5');
  }

  /// Migrates the database to version 6.
  ///
  /// Adds a new `loadingAnimation` column to the `appConfig` table.
  Future<dynamic> _upgradeToV6(Database db) async {
    await db.execute('''
    CREATE TABLE appConfig_new (
      autoRefreshTime NUMERIC NOT NULL,
      theme NUMERIC NOT NULL,
      language TEXT NOT NULL,
      reducedDataCharts NUMERIC NOT NULL,
      logsPerQuery NUMERIC NOT NULL,
      useBiometricAuth NUMERIC NOT NULL,
      importantInfoReaden NUMERIC NOT NULL,
      hideZeroValues NUMERIC NOT NULL,
      loadingAnimation NUMERIC NOT NULL,
      statisticsVisualizationMode NUMERIC NOT NULL,
      homeVisualizationMode NUMERIC NOT NULL,
      sendCrashReports NUMERIC NOT NULL
    )
    ''');

    await db.execute('''
    INSERT INTO appConfig_new (autoRefreshTime, theme, language,
      reducedDataCharts, logsPerQuery, useBiometricAuth,
      importantInfoReaden, hideZeroValues, loadingAnimation,
      statisticsVisualizationMode, homeVisualizationMode, sendCrashReports)
    SELECT autoRefreshTime, theme, language,
      reducedDataCharts, logsPerQuery, useBiometricAuth, importantInfoReaden,
      hideZeroValues, 0, statisticsVisualizationMode,
      homeVisualizationMode, sendCrashReports
    FROM appConfig
    ''');

    await db.execute('DROP TABLE appConfig');

    await db.execute('ALTER TABLE appConfig_new RENAME TO appConfig');

    logger.d('Database upgraded to version 6');
  }

  /// Migrates the database to version 7.
  ///
  /// Add garvity_update table foreign key constraints.
  /// Change the foreign key constraints in gravity_logs and gravity_messages tables.
  Future<dynamic> _upgradeToV7(Database db) async {
    await db.execute('''
      CREATE TABLE gravity_updates_new (
        address TEXT PRIMARY KEY NOT NULL,
        start_time TEXT NOT NULL,
        end_time TEXT NOT NULL,
        status INTEGER NOT NULL,
        FOREIGN KEY (address) REFERENCES servers(address) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      INSERT INTO gravity_updates_new (address, start_time, end_time, status)
      SELECT address, start_time, end_time, status FROM gravity_updates
    ''');

    await db.execute('DROP TABLE gravity_updates');
    await db.execute(
      'ALTER TABLE gravity_updates_new RENAME TO gravity_updates',
    );

    await db.execute('''
      CREATE TABLE gravity_logs_new (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        address TEXT NOT NULL,
        line INTEGER NOT NULL,
        message TEXT NOT NULL,
        timestamp TEXT NOT NULL,
        FOREIGN KEY (address) REFERENCES servers(address) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      INSERT INTO gravity_logs_new (id, address, line, message, timestamp)
      SELECT id, address, line, message, timestamp FROM gravity_logs
    ''');

    await db.execute('DROP TABLE gravity_logs');
    await db.execute('ALTER TABLE gravity_logs_new RENAME TO gravity_logs');

    await db.execute('''
      CREATE TABLE gravity_messages_new (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        address TEXT NOT NULL,
        message_id INTEGER NOT NULL,
        message TEXT NOT NULL,
        url TEXT NOT NULL,
        timestamp TEXT NOT NULL,
        FOREIGN KEY (address) REFERENCES servers(address) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      INSERT INTO gravity_messages_new (id, address, message_id, message, url, timestamp)
      SELECT id, address, message_id, message, url, timestamp FROM gravity_messages
    ''');

    await db.execute('DROP TABLE gravity_messages');
    await db.execute(
      'ALTER TABLE gravity_messages_new RENAME TO gravity_messages',
    );

    logger.d('Database upgraded to version 7');
  }

  /// Migrates the database to version 8.
  ///
  /// Adds a new `logAutoRefreshTime`, `liveLog` column to the `appConfig` table.
  Future<dynamic> _upgradeToV8(Database db) async {
    await db.execute('''
    CREATE TABLE appConfig_new (
      autoRefreshTime NUMERIC NOT NULL,
      theme NUMERIC NOT NULL,
      language TEXT NOT NULL,
      reducedDataCharts NUMERIC NOT NULL,
      logsPerQuery NUMERIC NOT NULL,
      logAutoRefreshTime NUMERIC NOT NULL,
      liveLog NUMERIC NOT NULL,
      isLivelogPaused NUMERIC NOT NULL,
      useBiometricAuth NUMERIC NOT NULL,
      importantInfoReaden NUMERIC NOT NULL,
      hideZeroValues NUMERIC NOT NULL,
      loadingAnimation NUMERIC NOT NULL,
      statisticsVisualizationMode NUMERIC NOT NULL,
      homeVisualizationMode NUMERIC NOT NULL,
      sendCrashReports NUMERIC NOT NULL
    )
    ''');

    await db.execute('''
    INSERT INTO appConfig_new (autoRefreshTime, theme, language,
      reducedDataCharts, logsPerQuery, logAutoRefreshTime, liveLog, isLivelogPaused,
      useBiometricAuth, importantInfoReaden, hideZeroValues, loadingAnimation,
      statisticsVisualizationMode, homeVisualizationMode, sendCrashReports)
    SELECT autoRefreshTime, theme, language,
      reducedDataCharts, logsPerQuery, 5, 1, 1,
      useBiometricAuth, importantInfoReaden, hideZeroValues, loadingAnimation,
      statisticsVisualizationMode, homeVisualizationMode, sendCrashReports
    FROM appConfig
    ''');

    await db.execute('DROP TABLE appConfig');

    await db.execute('ALTER TABLE appConfig_new RENAME TO appConfig');

    logger.d('Database upgraded to version 8');
  }
}
