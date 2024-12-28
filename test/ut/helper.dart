import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final String _path;
  final SecureStorageRepository _secureStorage;
  late Database _db;

  DbHelper(String path)
      : _path = path,
        _secureStorage = SecureStorageRepository();

  Future<void> loadDb() async {
    _db = await openDatabase(
      _path,
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
      onOpen: (Database db) async {},
    );
  }

  Future<void> closeDb() async {
    _db.close();
  }

  Future<bool> saveDb(Server server) async {
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

      await _db.transaction((txn) async {
        await txn.insert('servers', {
          'address': server.address,
          'alias': server.alias,
          'isDefaultServer': 0,
          'apiVersion': server.apiVersion,
        });
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> readDb() async {
    final servers = await _db.query('servers', orderBy: 'address');
    final appConfig = await _db.query('appConfig');
    return {
      'servers':
          servers.toList().map((e) => Map<String, dynamic>.from(e)).toList(),
      'appConfig': appConfig.map((e) => Map<String, dynamic>.from(e)).toList(),
    };
  }

  Future<void> deleteDb() async {
    deleteDatabase(_path);
  }

  Future<bool> clearDb() async {
    try {
      await _secureStorage.clearAll();
      await _db.transaction((txn) async {
        await txn.delete('servers');
        await txn.delete('appConfig');
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
