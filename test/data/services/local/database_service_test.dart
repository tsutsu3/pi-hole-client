import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void sqfliteTestInit() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

void main() {
  const dbName = inMemoryDatabasePath;

  sqfliteTestInit();

  group('DatabaseService', () {
    late DatabaseService dbService;

    setUp(() async {
      dbService = DatabaseService(path: dbName);
      await dbService.open();
    });

    tearDown(() async {
      await dbService.close();
      if (await databaseExists(dbName)) {
        await deleteDatabase(dbName);
      }
    });

    test('Database opens and closes successfully', () async {
      expect(dbService.isOpen, isTrue);
      final closeResult = await dbService.close();
      expect(closeResult.isSuccess(), isTrue);
      expect(dbService.isOpen, isFalse);
    });

    test('Insert and query servers table', () async {
      final insertResult = await dbService.insert('servers', {
        'address': '127.0.0.1',
        'alias': 'Local',
        'isDefaultServer': 1,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
      });
      expect(insertResult.isSuccess(), isTrue);

      final queryResult = await dbService.query('servers');
      expect(queryResult.isSuccess(), isTrue);
      expect(queryResult.getOrNull()?.length, 1);
      expect(queryResult.getOrNull()?[0]['address'], '127.0.0.1');
      expect(queryResult.getOrNull()?[0]['alias'], 'Local');
      expect(queryResult.getOrNull()?[0]['isDefaultServer'], 1);
      expect(queryResult.getOrNull()?[0]['apiVersion'], 'v6');
      expect(queryResult.getOrNull()?[0]['allowUntrustedCert'], 1);
    });

    test('servers table stores usesTotp and defaults it to 0', () async {
      // Omits usesTotp → relies on the column default.
      await dbService.insert('servers', {
        'address': '127.0.0.1',
        'alias': 'Plain',
        'isDefaultServer': 1,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
      });
      await dbService.insert('servers', {
        'address': '127.0.0.2',
        'alias': 'Totp',
        'isDefaultServer': 0,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
        'usesTotp': 1,
      });

      final rows = (await dbService.query('servers')).getOrNull()!;
      final usesTotpByAddress = {
        for (final r in rows) r['address']: r['usesTotp'],
      };
      expect(usesTotpByAddress['127.0.0.1'], 0);
      expect(usesTotpByAddress['127.0.0.2'], 1);
    });

    test('v11 migration adds usesTotp to an existing v10 servers table', () async {
      final dir = await Directory.systemTemp.createTemp('pihole_db_test');
      addTearDown(() => dir.delete(recursive: true));
      final path = '${dir.path}/migrate_v11.db';

      // Build a v10-shaped servers table (no usesTotp column) with one row.
      final v10 = await databaseFactory.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: 10,
          onCreate: (db, _) async {
            await db.execute('''
              CREATE TABLE servers (
                address TEXT PRIMARY KEY NOT NULL,
                alias TEXT NOT NULL,
                isDefaultServer NUMERIC NOT NULL,
                apiVersion TEXT NOT NULL,
                allowUntrustedCert NUMERIC NOT NULL,
                ignoreCertificateErrors NUMERIC NOT NULL,
                pinnedCertificateSha256 TEXT
              )
            ''');
          },
        ),
      );
      await v10.insert('servers', {
        'address': '127.0.0.1',
        'alias': 'Local',
        'isDefaultServer': 1,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
      });
      await v10.close();

      // Reopen at v11 → _upgradeToV11 runs the ADD COLUMN migration.
      final svc = DatabaseService(path: path);
      final opened = await svc.open(latestVersion: 11);
      expect(opened.isSuccess(), isTrue);

      final rows = (await svc.query('servers')).getOrNull()!;
      expect(rows.length, 1);
      expect(rows[0]['usesTotp'], 0);
      await svc.close();
    });

    test('Update servers table', () async {
      await dbService.insert('servers', {
        'address': '127.0.0.1',
        'alias': 'Local',
        'isDefaultServer': 1,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
      });
      final updateResult = await dbService.update(
        'servers',
        {'alias': 'Updated'},
        where: 'address = ?',
        whereArgs: ['127.0.0.1'],
      );
      expect(updateResult.isSuccess(), isTrue);
      expect(updateResult.getOrNull(), 1);

      final queryResult = await dbService.query('servers');
      expect(queryResult.getOrNull()?[0]['alias'], 'Updated');
    });

    test('Delete from servers table', () async {
      await dbService.insert('servers', {
        'address': '127.0.0.1',
        'alias': 'Local',
        'isDefaultServer': 1,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
      });
      final deleteResult = await dbService.delete(
        'servers',
        where: 'address = ?',
        whereArgs: ['127.0.0.1'],
      );
      expect(deleteResult.isSuccess(), isTrue);
      expect(deleteResult.getOrNull(), 1);

      final queryResult = await dbService.query('servers');
      expect(queryResult.getOrNull()?.isEmpty, isTrue);
    });

    test('Raw query returns expected result', () async {
      await dbService.insert('servers', {
        'address': '127.0.0.1',
        'alias': 'Local',
        'isDefaultServer': 1,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
      });
      final rawResult = await dbService.rawQuery('SELECT * FROM servers');
      expect(rawResult.isSuccess(), isTrue);
      expect(rawResult.getOrNull()?.length, 1);
      expect(rawResult.getOrNull()?[0]['address'], '127.0.0.1');
      expect(rawResult.getOrNull()?[0]['alias'], 'Local');
      expect(rawResult.getOrNull()?[0]['isDefaultServer'], 1);
      expect(rawResult.getOrNull()?[0]['apiVersion'], 'v6');
      expect(rawResult.getOrNull()?[0]['allowUntrustedCert'], 1);
    });

    test('Transaction works and returns result', () async {
      final result = await dbService.transaction<int>((txn) async {
        return txn.insert('servers', {
          'address': '127.0.0.2',
          'alias': 'Tx',
          'isDefaultServer': 0,
          'apiVersion': 'v6',
          'allowUntrustedCert': 1,
          'ignoreCertificateErrors': 0,
          'pinnedCertificateSha256': null,
        });
      });
      expect(result.isSuccess(), isTrue);

      final queryResult = await dbService.query(
        'servers',
        where: 'address = ?',
        whereArgs: ['127.0.0.2'],
      );
      expect(queryResult.getOrNull()?.length, 1);
      expect(queryResult.getOrNull()?[0]['alias'], 'Tx');
    });

    test('Insert returns Failure on duplicate primary key', () async {
      await dbService.insert('servers', {
        'address': '127.0.0.1',
        'alias': 'Local',
        'isDefaultServer': 1,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
      });
      final result = await dbService.insert('servers', {
        'address': '127.0.0.1',
        'alias': 'Duplicate',
        'isDefaultServer': 0,
        'apiVersion': 'v6',
        'allowUntrustedCert': 1,
        'ignoreCertificateErrors': 0,
        'pinnedCertificateSha256': null,
      });
      expect(result.isError(), isTrue);

      final queryResult = await dbService.query('servers');
      expect(queryResult.getOrNull()?.length, 1);
      expect(queryResult.getOrNull()?[0]['address'], '127.0.0.1');
      expect(queryResult.getOrNull()?[0]['alias'], 'Local');
      expect(queryResult.getOrNull()?[0]['isDefaultServer'], 1);
      expect(queryResult.getOrNull()?[0]['apiVersion'], 'v6');
      expect(queryResult.getOrNull()?[0]['allowUntrustedCert'], 1);
    });

    test(
      'Insert returns Succes with ConflictAlgorithm.replace on duplicate',
      () async {
        await dbService.insert('servers', {
          'address': '127.0.0.1',
          'alias': 'Local',
          'isDefaultServer': 1,
          'apiVersion': 'v6',
          'allowUntrustedCert': 1,
          'ignoreCertificateErrors': 0,
          'pinnedCertificateSha256': null,
        });
        final result = await dbService.insert('servers', {
          'address': '127.0.0.1',
          'alias': 'Duplicate',
          'isDefaultServer': 0,
          'apiVersion': 'v6',
          'allowUntrustedCert': 1,
          'ignoreCertificateErrors': 0,
          'pinnedCertificateSha256': null,
        }, conflictAlgorithm: ConflictAlgorithm.replace);
        expect(result.isSuccess(), isTrue);

        final queryResult = await dbService.query('servers');
        expect(queryResult.getOrNull()?.length, 1);
        expect(queryResult.getOrNull()?[0]['address'], '127.0.0.1');
        expect(queryResult.getOrNull()?[0]['alias'], 'Duplicate');
        expect(queryResult.getOrNull()?[0]['isDefaultServer'], 0);
        expect(queryResult.getOrNull()?[0]['apiVersion'], 'v6');
        expect(queryResult.getOrNull()?[0]['allowUntrustedCert'], 1);
      },
    );

    test('Update returns Failure when no rows affected', () async {
      final result = await dbService.update(
        'servers',
        {'alias': 'None'},
        where: 'address = ?',
        whereArgs: ['notfound'],
      );
      expect(result.isError(), isTrue);
    });

    test('Delete returns Failure when no rows affected', () async {
      final result = await dbService.delete(
        'servers',
        where: 'address = ?',
        whereArgs: ['notfound'],
      );
      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull(), 0);
    });
  });
}
