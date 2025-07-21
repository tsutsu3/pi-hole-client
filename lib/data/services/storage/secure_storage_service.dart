import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:result_dart/result_dart.dart';

/// A service for securely storing, retrieving, and managing key-value pairs
/// using [FlutterSecureStorage].
///
/// This service abstracts secure storage access and provides convenient methods
/// to save, read, delete, and clear values, all wrapped in [Result] objects for
/// robust error handling without relying on exceptions directly.
class SecureStorageService {
  SecureStorageService() : _secureStorage = const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  /// Saves a [value] securely associated with the given [key].
  ///
  /// Returns a [Result<void>] indicating the outcome:
  /// - [Success] containing no value if the operation succeeded.
  /// - [Failure] if an exception occurred.
  Future<Result<void>> saveValue(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
      logger.d('Value saved successfully: $key');
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to save value: $e\n$st');
      return Failure(Exception('Failed to save value: $e\n$st'));
    }
  }

  /// Retrieves a value securely for the given [key].
  ///
  /// Returns a [Result<String>] with:
  /// - [Success] containing the value if found.
  /// - [Failure] if not found or an error occurs.
  Future<Result<String>> getValue(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      if (value == null) {
        logger.w('No value found for key: $key');
        return Failure(Exception('No value found for key: $key'));
      }
      logger.d('Value retrieved successfully: $key');
      return Success(value);
    } catch (e, st) {
      logger.e('Failed to read value: $e\n$st');
      return Failure(Exception('Failed to read value: $e\n$st'));
    }
  }

  /// Deletes the value associated with the given [key].
  ///
  /// Returns a [Result<void>] indicating the outcome:
  /// - [Success] containing no value if the operation succeeded.
  /// - [Failure] if an error occurred.
  Future<Result<void>> deleteValue(String key) async {
    try {
      await _secureStorage.delete(key: key);
      logger.d('Value deleted successfully: $key');
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to delete value: $e\n$st');
      return Failure(Exception('Failed to delete value: $e\n$st'));
    }
  }

  /// Clears all key-value pairs stored securely.
  ///
  /// Returns a [Result<void>] indicating the outcome:
  /// - [Success] containing no value if the operation succeeded.
  /// - [Failure] if an error occurred.
  Future<Result<void>> clearAll() async {
    try {
      await _secureStorage.deleteAll();
      logger.d('All values cleared successfully');
      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to clear all values: $e\n$st');
      return Failure(Exception('Failed to clear all values: $e\n$st'));
    }
  }

  /// Reads all securely stored key-value pairs.
  ///
  /// Returns a [Result<Map<String, String>>] with:
  /// - [Success] containing a map of all key-value pairs.
  /// - [Failure] if an error occurs.
  Future<Result<Map<String, String>>> readAll() async {
    try {
      final allValues = await _secureStorage.readAll();
      logger.d('All values read successfully: ${allValues.length} items');
      return Success(allValues);
    } catch (e, st) {
      logger.e('Failed to read all values: $e\n$st');
      return Failure(Exception('Failed to read all values: $e\n$st'));
    }
  }
}
