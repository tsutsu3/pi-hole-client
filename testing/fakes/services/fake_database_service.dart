import 'package:pi_hole_client/data/services/database/database_service.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';

/// A test double for [DatabaseService] that provides fine-grained control
/// over error simulation in database operations.
///
/// This class is intended for unit testing of repositories or use cases
/// that depend on [DatabaseService]. It allows each type of database
/// operation to be selectively overridden to simulate errors such as query
/// failures, insertion errors, transaction rollbacks, etc.
///
/// Example usage:
/// ```dart
/// final db = FakeDatabaseService();
/// db.shouldFailInsert = true; // Simulate insert failure
///
/// final result = await repository.insertData(...);
/// expect(result.isError(), true);
/// ```
class FakeDatabaseService extends DatabaseService {
  FakeDatabaseService({String? path})
      : super(path: path ?? inMemoryDatabasePath);

  // Flags to control failure simulation
  // These can be set in tests to simulate specific error conditions
  bool shouldFailRawQuery = false;
  bool shouldFailQuery = false;
  bool shouldFailInsert = false;
  bool shouldFailUpdate = false;
  bool shouldFailDelete = false;
  bool shouldFailTransaction = false;

  // Flags to throw exceptions instead of returning failures
  // These can be set in tests to simulate unexpected exceptions
  bool shouldThrowOnRawQuery = false;
  bool shouldThrowOnQuery = false;
  bool shouldThrowOnInsert = false;
  bool shouldThrowOnUpdate = false;
  bool shouldThrowOnDelete = false;
  bool shouldThrowOnTransaction = false;

  @override
  Future<Result<List<Map<String, dynamic>>>> rawQuery(
    String sql, [
    List<dynamic>? args,
  ]) async {
    if (shouldFailRawQuery) {
      return Failure(Exception('Simulated rawQuery error'));
    }
    if (shouldThrowOnRawQuery) {
      throw Exception('Simulated rawQuery exception');
    }
    return super.rawQuery(sql, args);
  }

  @override
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
    if (shouldFailQuery) {
      return Failure(Exception('Simulated query error'));
    }
    if (shouldThrowOnQuery) {
      throw Exception('Simulated query exception');
    }
    return super.query(
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
  }

  @override
  Future<Result<int>> insert(
    String table,
    Map<String, dynamic> values, {
    String? nullColumnHack,
    ConflictAlgorithm? conflictAlgorithm,
  }) async {
    if (shouldFailInsert) {
      return Failure(Exception('Simulated insert error'));
    }
    if (shouldThrowOnInsert) {
      throw Exception('Simulated insert exception');
    }
    return super.insert(table, values, conflictAlgorithm: conflictAlgorithm);
  }

  @override
  Future<Result<int>> update(
    String table,
    Map<String, dynamic> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    if (shouldFailUpdate) {
      return Failure(Exception('Simulated update error'));
    }
    if (shouldThrowOnUpdate) {
      throw Exception('Simulated update exception');
    }
    return super.update(table, values, where: where, whereArgs: whereArgs);
  }

  @override
  Future<Result<int>> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    if (shouldFailDelete) {
      return Failure(Exception('Simulated delete error'));
    }
    if (shouldThrowOnDelete) {
      throw Exception('Simulated delete exception');
    }
    return super.delete(table, where: where, whereArgs: whereArgs);
  }

  @override
  Future<Result<T>> transaction<T extends Object>(
    Future<T> Function(Transaction txn) action,
  ) async {
    if (shouldFailTransaction) {
      return Failure(Exception('Simulated transaction error'));
    }
    if (shouldThrowOnTransaction) {
      throw Exception('Simulated transaction exception');
    }
    return super.transaction(action);
  }
}
