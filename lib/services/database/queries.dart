import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/models/server.dart';

final logger = Logger();

Future<dynamic> saveServerQuery(Database db, Server server) async {
  try {
    await db.transaction((txn) async {
      await txn.insert('servers', {
        'address': server.address,
        'alias': server.alias,
        'token': server.token,
        'isDefaultServer': 0,
        'basicAuthUser': server.basicAuthUser,
        'basicAuthPassword': server.basicAuthPassword,
      });
    });
    return true;
  } catch (e) {
    return null;
  }
}

/// Edits the server details in the database.
///
/// This function performs a database transaction to update the server details
/// in the 'servers' table. It updates the server's alias, token, default server
/// status, basic authentication user, and basic authentication password based
/// on the provided [server] object.
///
/// If the update is successful, it returns `true`. If an error occurs during
/// the transaction, it logs the error and returns `false`.
///
/// Parameters:
/// - [db]: The database instance to perform the transaction on.
/// - [server]: The server object containing the updated details.
///
/// Returns:
/// - A `Future` that resolves to `true` if the update is successful, or `false`
/// if an error occurs.
Future<dynamic> editServerQuery(Database db, Server server) async {
  try {
    return await db.transaction((txn) async {
      await txn.update(
          'servers',
          {
            'alias': server.alias,
            'token': server.token,
            'isDefaultServer': convertFromBoolToInt(server.defaultServer),
            'basicAuthUser': server.basicAuthUser,
            'basicAuthPassword': server.basicAuthPassword,
          },
          where: 'address = ?',
          whereArgs: [server.address]);
      return true;
    });
  } catch (e, stackTrace) {
    logger.e('Error editing server', error: e, stackTrace: stackTrace);
    return false;
  }
}

Future<dynamic> setDefaultServerQuery(Database db, String url) async {
  try {
    await db.transaction((txn) async {
      await txn.update('servers', {'isDefaultServer': '0'},
          where: 'isDefaultServer = ?', whereArgs: [1]);
      await txn.update('servers', {'isDefaultServer': '1'},
          where: 'address = ?', whereArgs: [url]);
    });
    return true;
  } catch (e) {
    return null;
  }
}

Future<dynamic> setServerTokenQuery(
    Database db, String? token, String address) async {
  try {
    return await db.transaction((txn) async {
      await txn.update('servers', {'token': token ?? ''},
          where: 'address = ?', whereArgs: [address]);
      return null;
    });
  } catch (e) {
    return e;
  }
}

Future<bool> removeServerQuery(Database db, String address) async {
  try {
    return await db.transaction((txn) async {
      await txn.delete('servers', where: 'address = ?', whereArgs: [address]);
      return true;
    });
  } catch (e) {
    return false;
  }
}

Future<bool> deleteServersDataQuery(Database db) async {
  try {
    return await db.transaction((txn) async {
      await txn.delete(
        'servers',
      );
      return true;
    });
  } catch (e) {
    return false;
  }
}

Future<Map<String, dynamic>> checkUrlExistsQuery(
    Database db, String url) async {
  try {
    return await db.transaction((txn) async {
      final res = await txn.query("servers",
          columns: ["count(address) as quantity"],
          where: "address = ?",
          whereArgs: [url]);

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

Future<bool> updateConfigQuery(
    {required Database db,
    required String column,
    required dynamic value}) async {
  try {
    return await db.transaction((txn) async {
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

Future<bool> restoreAppConfigQuery(Database db) async {
  try {
    return await db.transaction((txn) async {
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
          'passCode': null,
          'useBiometricAuth': 0
        },
      );
      return true;
    });
  } catch (e) {
    return false;
  }
}
