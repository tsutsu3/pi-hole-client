import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:pi_hole_client/utils/database_utils.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';

/// Provides access to gravity-related data stored in the local database.
///
/// This repository manages CRUD operations for gravity updates, logs,
/// and messages. It encapsulates all persistence logic related to
/// gravity execution results per server.
class GravityRepository {
  GravityRepository(
    DatabaseService database,
  ) : _database = database;

  final DatabaseService _database;

  /// Fetches the gravity update status for the specified [address].
  ///
  /// If a matching record exists in the `gravity_updates` table, it returns the
  /// corresponding [GravityUpdateData]. Otherwise, it returns a default entry
  /// with an empty address, zero timestamps, and an idle status.
  ///
  /// Returns a [Success] with the result or a [Failure] if the query fails.
  Future<Result<GravityUpdateData>> fetchGravityUpdate(
    String address,
  ) async {
    try {
      await openDbIfNeeded(_database);

      final rows = await _database.query(
        'gravity_updates',
        where: 'address = ?',
        whereArgs: [address],
      );

      if (rows.getOrThrow().isNotEmpty) {
        return Success(GravityUpdateData.fromMap(rows.getOrThrow()[0]));
      }

      // If not entry found, return a fake entry with default values
      return Success(
        GravityUpdateData(
          address: '',
          startTime: DateTime.fromMillisecondsSinceEpoch(0),
          endTime: DateTime.fromMillisecondsSinceEpoch(0),
          status: GravityStatus.idle.index, // TODO: enum
        ),
      );
    } catch (e, st) {
      logger.e('Failed to get gravity update: $e\n$st');
      return Failure(Exception('Failed to get gravity update: $e\n$st'));
    }
  }

  /// Inserts or updates a gravity update entry.
  ///
  /// If a record with the same `address` already exists in the
  /// `gravity_updates` table, it will be replaced with the new values.
  /// Otherwise, a new entry is inserted.
  ///
  /// Returns the number of affected rows or a [Failure] if the operation fails.
  Future<Result<int>> upsertGravityUpdate(
    GravityUpdateData gravityUpdateData,
  ) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.insert(
        'gravity_updates',
        {
          'address': gravityUpdateData.address,
          'start_time': gravityUpdateData.startTime.toUtc().toIso8601String(),
          'end_time': gravityUpdateData.endTime.toUtc().toIso8601String(),
          'status': gravityUpdateData.status,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e, st) {
      logger.e('Failed to upsert gravity update: $e\n$st');
      return Failure(Exception('Failed to upsert gravity update: $e\n$st'));
    }
  }

  /// Deletes the gravity update entry associated with the given [address].
  ///
  /// Removes the record from the `gravity_updates` table where the `address`
  /// matches the provided value.
  ///
  /// Returns the number of deleted rows or a [Failure] if the operation fails.
  Future<Result<int>> deleteGravityUpdate(String address) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.delete(
        'gravity_updates',
        where: 'address = ?',
        whereArgs: [address],
      );
    } catch (e, st) {
      logger.e('Failed to remove gravity update: $e\n$st');
      return Failure(Exception('Failed to remove gravity update: $e\n$st'));
    }
  }

  /// Fetches gravity logs for the specified [address].
  ///
  /// Queries the `gravity_logs` table and returns all matching entries as
  /// a list of [GravityLogData]. If no records are found, an empty list
  /// is returned.
  ///
  /// Returns a [Success] with the list of logs, or a [Failure] if the query fails.
  Future<Result<List<GravityLogData>>> fetchGravityLogs(
    String address,
  ) async {
    try {
      await openDbIfNeeded(_database);

      final rows = await _database.query(
        'gravity_logs',
        where: 'address = ?',
        whereArgs: [address],
      );

      if (rows.getOrThrow().isNotEmpty) {
        return Success(rows.getOrThrow().map(GravityLogData.fromMap).toList());
      }

      return const Success([]);
    } catch (e, st) {
      logger.e('Failed to get gravity logs: $e\n$st');
      return Failure(Exception('Failed to get gravity logs: $e\n$st'));
    }
  }

  /// Inserts multiple gravity log entries into the database.
  ///
  /// Executes a transaction that adds all [gravityLogsDataList] entries
  /// to the `gravity_logs` table. The logs are inserted one by one,
  /// and the total number of inserted rows is returned.
  ///
  /// Returns a [Success] with the number of inserted rows,
  /// or a [Failure] if the operation fails.
  Future<Result<int>> insertGravityLogs(
    List<GravityLogData> gravityLogsDataList,
  ) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.transaction<int>((txn) async {
        var total = 0;
        for (final log in gravityLogsDataList) {
          final count = await txn.insert(
            'gravity_logs',
            {
              'address': log.address,
              'line': log.line,
              'message': log.message,
              'timestamp': log.timestamp.toUtc().toIso8601String(),
            },
          );
          total += count;
        }
        return total;
      });
    } catch (e, st) {
      logger.e('Failed to insert gravity logs: $e\n$st');
      return Failure(Exception('Failed to insert gravity logs: $e\n$st'));
    }
  }

  /// Deletes all gravity log entries associated with the given [address].
  ///
  /// Removes every row from the `gravity_logs` table where the `address`
  /// column matches the provided value.
  ///
  /// Returns a [Success] with the number of deleted rows, or a [Failure]
  /// if the deletion fails.
  Future<Result<int>> deleteGravityLogs(String address) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.delete(
        'gravity_logs',
        where: 'address = ?',
        whereArgs: [address],
      );
    } catch (e, st) {
      logger.e('Failed to delete gravity logs: $e\n$st');
      return Failure(Exception('Failed to delete gravity logs: $e\n$st'));
    }
  }

  /// Fetches gravity messages for the given [address].
  ///
  /// Queries the `gravity_messages` table and returns all matching entries as a
  /// list of [GravityMessageData]. Returns an empty list if no records are found.
  ///
  /// Returns a [Success] with the list of messages, or a [Failure] if the query fails.
  Future<Result<List<GravityMessageData>>> fetchGravityMessages(
    String address,
  ) async {
    try {
      await openDbIfNeeded(_database);

      final rows = await _database.query(
        'gravity_messages',
        where: 'address = ?',
        whereArgs: [address],
      );

      if (rows.getOrThrow().isNotEmpty) {
        return Success(
          rows.getOrThrow().map(GravityMessageData.fromMap).toList(),
        );
      }
      return const Success([]);
    } catch (e, st) {
      logger.e('Failed to get gravity messages: $e\n$st');
      return Failure(Exception('Failed to get gravity messages: $e\n$st'));
    }
  }

  /// Inserts multiple gravity message records into the database.
  ///
  /// Runs a transaction to add all entries from [messagesList] into the
  /// `gravity_messages` table. Each entry is inserted one by one.
  ///
  /// Returns a [Success] with the number of inserted rows,
  /// or a [Failure] if the operation fails.
  Future<Result<int>> insertGravityMessages(
    List<GravityMessageData> messagesList,
  ) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.transaction<int>((txn) async {
        var total = 0;
        for (final msg in messagesList) {
          final count = await txn.insert(
            'gravity_messages',
            {
              'address': msg.address,
              'message_id': msg.id,
              'message': msg.message,
              'url': msg.url,
              'timestamp': msg.timestamp.toUtc().toIso8601String(),
            },
          );
          total += count;
        }
        return total;
      });
    } catch (e, st) {
      logger.e('Failed to insert gravity messages: $e\n$st');
      return Failure(Exception('Failed to insert gravity messages: $e\n$st'));
    }
  }

  /// Deletes all gravity messages associated with the given [address].
  ///
  /// Removes all entries from the `gravity_messages` table where the `address`
  /// column matches the provided value.
  ///
  /// Returns a [Success] with the number of deleted rows,
  /// or a [Failure] if the operation fails.
  Future<Result<int>> deleteGravityMessages(String address) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.delete(
        'gravity_messages',
        where: 'address = ?',
        whereArgs: [address],
      );
    } catch (e, st) {
      logger.e('Failed to delete gravity messages: $e\n$st');
      return Failure(Exception('Failed to delete gravity messages: $e\n$st'));
    }
  }

  /// Deletes a specific gravity message by [address] and [id].
  ///
  /// Removes the entry from the `gravity_messages` table that matches both
  /// the given server address and message ID.
  ///
  /// Returns a [Success] containing the number of rows deleted,
  /// or a [Failure] if the deletion fails.
  Future<Result<int>> deleteGravityMessage(String address, int id) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.delete(
        'gravity_messages',
        where: 'address = ? AND message_id = ?',
        whereArgs: [address, id],
      );
    } catch (e, st) {
      logger.e('Failed to delete gravity message: $e\n$st');
      return Failure(Exception('Failed to delete gravity message: $e\n$st'));
    }
  }

  /// Fetch all gravity-related data for the given [address].
  ///
  /// This retrieves the gravity update status, logs, and messages associated
  /// with the address by delegating to their respective query methods.
  ///
  /// Returns a [Success] containing the combined [GravityData], or a [Failure]
  /// if any of the underlying queries fail.
  Future<Result<GravityData>> fetchGravityData(String address) async {
    try {
      final gravityUpdateData = await fetchGravityUpdate(address);
      final gravityLogsData = await fetchGravityLogs(address);
      final gravityMessagesData = await fetchGravityMessages(address);

      return Success(
        GravityData(
          gravityUpdate: gravityUpdateData.getOrThrow(),
          gravityLogs: gravityLogsData.getOrThrow(),
          gravityMessages: gravityMessagesData.getOrThrow(),
        ),
      );
    } catch (e, st) {
      logger.e('Failed to get gravity data: $e\n$st');
      return Failure(Exception('Failed to get gravity data: $e\n$st'));
    }
  }

  /// Deletes all gravity data associated with the given [address].
  ///
  /// This includes data from `gravity_updates`, `gravity_logs`, and `gravity_messages`
  /// tables related to the specified address. Executes the deletions in a single transaction.
  ///
  /// Returns a [Success] with the total number of deleted rows,
  /// or a [Failure] if the operation fails.
  Future<Result<int>> deleteGravityData(String address) async {
    try {
      await openDbIfNeeded(_database);

      return await _database.transaction<int>((txn) async {
        final count1 = await txn.delete(
          'gravity_updates',
          where: 'address = ?',
          whereArgs: [address],
        );
        final count2 = await txn.delete(
          'gravity_logs',
          where: 'address = ?',
          whereArgs: [address],
        );
        final count3 = await txn.delete(
          'gravity_messages',
          where: 'address = ?',
          whereArgs: [address],
        );
        return count1 + count2 + count3;
      });
    } catch (e, st) {
      logger.e('Failed to delete gravity data: $e\n$st');
      return Failure(Exception('Failed to delete gravity data: $e\n$st'));
    }
  }

  /// Deletes all gravity data from all tables regardless of address.
  ///
  /// This clears all entries from `gravity_updates`, `gravity_logs`,
  /// and `gravity_messages` tables. Executes the operation in a single transaction.
  ///
  /// Returns a [Success] with the total number of deleted rows,
  /// or a [Failure] if the operation fails.
  Future<Result<int>> deleteAllGravityData() async {
    try {
      await openDbIfNeeded(_database);

      return await _database.transaction((txn) async {
        final count1 = await txn.delete('gravity_updates');
        final count2 = await txn.delete('gravity_logs');
        final count23 = await txn.delete('gravity_messages');
        return count1 + count2 + count23;
      });
    } catch (e) {
      return Failure(Exception('Failed to delete all gravity data: $e'));
    }
  }
}
