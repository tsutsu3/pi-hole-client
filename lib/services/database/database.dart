import 'package:sqflite/sqflite.dart';

Future<Map<String, dynamic>> loadDb() async {
  List<Map<String, Object?>>? servers;
  List<Map<String, Object?>>? appConfig;

  Database db = await openDatabase('pi_hole_client.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE servers (address TEXT PRIMARY KEY, alias TEXT, token TEXT, isDefaultServer NUMERIC, apiVersion TEXT, basicAuthUser TEXT, basicAuthPassword TEXT)");
        await db.execute(
            "CREATE TABLE appConfig (autoRefreshTime NUMERIC, theme NUMERIC, language TEXT, overrideSslCheck NUMERIC, oneColumnLegend NUMERIC, reducedDataCharts NUMERIC, logsPerQuery NUMERIC, passCode TEXT, useBiometricAuth NUMERIC, importantInfoReaden NUMERIC, hideZeroValues NUMERIC, statisticsVisualizationMode NUMERIC)");
        await db.execute(
            "INSERT INTO appConfig (autoRefreshTime, theme, language, overrideSslCheck, oneColumnLegend, reducedDataCharts, logsPerQuery, passCode, useBiometricAuth, importantInfoReaden, hideZeroValues, statisticsVisualizationMode) VALUES (5, 0, 'en', 0, 0, 0, 2, null, 0, 0, 0, 0)");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {},
      onDowngrade: (Database db, int oldVersion, int newVersion) async {},
      onOpen: (Database db) async {
        await db.transaction((txn) async {
          servers = await txn.rawQuery(
            'SELECT * FROM servers',
          );
        });
        await db.transaction((txn) async {
          appConfig = await txn.rawQuery(
            'SELECT * FROM appConfig',
          );
        });
      });

  return {
    "servers": servers,
    "appConfig": appConfig![0],
    "dbInstance": db,
  };
}
