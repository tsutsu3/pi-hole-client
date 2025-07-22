import 'package:pi_hole_client/data/services/storage/secure_storage_service.dart';
import 'package:pi_hole_client/domain/models/server.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper(String path)
      : _path = path,
        _secureStorage = SecureStorageService();

  final String _path;
  final SecureStorageService _secureStorage;
  late Database _db;

  Future<Database> loadDb() async {
    return _db = await openDatabase(
      _path,
      version: 6,
      onCreate: (Database db, int version) async {
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
              useBiometricAuth,
              importantInfoReaden,
              hideZeroValues,
              loadingAnimation,
              statisticsVisualizationMode,
              homeVisualizationMode,
              sendCrashReports
            ) VALUES (5, 0, 'en', 0, 2, 0, 0, 0, 0, 0, 0, 0)
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
      },
      onOpen: (Database db) async {},
    );
  }

  Future<void> closeDb() async {
    await _db.close();
  }

  Future<bool> saveDb(Server server) async {
    try {
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
      if (server.sm.sid.isSuccess()) {
        await _secureStorage.saveValue(
          '${server.address}_sid',
          server.sm.sid.getOrDefault(''),
        );
      }

      await _db.transaction((txn) async {
        await txn.insert('servers', {
          'address': server.address,
          'alias': server.alias,
          'isDefaultServer': 0,
          'apiVersion': server.apiVersion,
          'allowSelfSignedCert': server.allowSelfSignedCert ? 1 : 0,
        });
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateConfigQuery({
    required String column,
    required Object? value,
  }) async {
    try {
      return await _db.transaction((txn) async {
        await txn.update(
          'appConfig',
          {column: value},
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> readDb() async {
    final servers = await _db.query('servers', orderBy: 'address');
    final appConfig = await _db.query('appConfig');
    final gravityUpdates = await _db.query('gravity_updates');
    final gravityLogs = await _db.query('gravity_logs');
    final gravityMessages = await _db.query('gravity_messages');
    return {
      'servers': servers.toList().map(Map<String, dynamic>.from).toList(),
      'appConfig': appConfig.map(Map<String, dynamic>.from).toList(),
      'gravity_updates': gravityUpdates.map(Map<String, dynamic>.from).toList(),
      'gravity_logs': gravityLogs.map(Map<String, dynamic>.from).toList(),
      'gravity_messages':
          gravityMessages.map(Map<String, dynamic>.from).toList(),
    };
  }

  Future<void> deleteDb() async {
    await deleteDatabase(_path);
  }

  Future<bool> clearDb() async {
    try {
      await _secureStorage.clearAll();
      await _db.transaction((txn) async {
        await txn.delete('servers');
        await txn.delete('appConfig');
        await txn.delete('gravity_updates');
        await txn.delete('gravity_logs');
        await txn.delete('gravity_messages');
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertGravityUpdateQuery(
    String address,
    DateTime startTime,
    DateTime endTime,
    int status,
  ) async {
    try {
      return await _db.transaction((txn) async {
        await txn.insert(
          'gravity_updates',
          {
            'address': address,
            'start_time': startTime.toUtc().toIso8601String(),
            'end_time': endTime.toUtc().toIso8601String(),
            'status': status,
          },
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertGravityLogsQuery(
    String address,
    int line,
    String message,
    DateTime timestamp,
  ) async {
    try {
      return await _db.transaction((txn) async {
        await txn.insert(
          'gravity_logs',
          {
            'address': address,
            'line': line,
            'message': message,
            'timestamp': timestamp.toUtc().toIso8601String(),
          },
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertGravityMessagesQuery(
    String address,
    int messageId,
    String message,
    String url,
    DateTime timestamp,
  ) async {
    try {
      return await _db.transaction((txn) async {
        await txn.insert(
          'gravity_messages',
          {
            'address': address,
            'message_id': messageId,
            'message': message,
            'url': url,
            'timestamp': timestamp.toUtc().toIso8601String(),
          },
        );
        return true;
      });
    } catch (e) {
      return false;
    }
  }
}
