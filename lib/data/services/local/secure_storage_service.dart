import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:result_dart/result_dart.dart';

/// A service for securely managing key-value pairs using [FlutterSecureStorage].
///
/// This service provides a simple and consistent API for performing secure
/// storage operations such as saving, reading, deleting, and clearing data.
///
/// All methods return [Result] objects to encapsulate success or failure,
/// allowing robust error handling without throwing exceptions directly.
///
/// The underlying [FlutterSecureStorage] instance can be injected, which is
/// useful for testing or customization. If not provided, a default instance
/// is created internally.
class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  /// Saves a [value] securely associated with the given [key].
  ///
  /// Returns a [Result<void>] indicating the outcome:
  /// - [Success] containing no value if the operation succeeded.
  /// - [Failure] with [SecureStorageException] if the write fails.
  Future<Result<void>> saveValue(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
      logger.d('Value saved successfully: $key');

      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to save value: $e\n$st');

      return Failure(
        SecureStorageException('Failed to save value for $key', cause: e),
      );
    }
  }

  /// Retrieves a value securely for the given [key].
  ///
  /// Returns a [Result<String>] with:
  /// - [Success] containing the value if found.
  /// - [Failure] with [ValueNotFoundException] if not found.
  /// - [Failure] with [SecureStorageException] if the read fails.
  Future<Result<String>> getValue(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      if (value == null) {
        logger.w('No value found for key: $key');

        return Failure(ValueNotFoundException('No value found for key: $key'));
      }
      logger.d('Value retrieved successfully: $key');

      return Success(value);
    } catch (e, st) {
      logger.e('Failed to read value: $e\n$st');

      return Failure(
        SecureStorageException('Failed to read value for $key', cause: e),
      );
    }
  }

  /// Deletes the value associated with the given [key].
  ///
  /// Returns a [Result<void>] indicating the outcome:
  /// - [Success] containing no value if the operation succeeded.
  /// - [Failure] with [SecureStorageException] if the operation fails.
  Future<Result<void>> deleteValue(String key) async {
    try {
      await _secureStorage.delete(key: key);
      logger.d('Value deleted successfully: $key');

      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to delete value: $e\n$st');

      return Failure(
        SecureStorageException('Failed to delete value for $key', cause: e),
      );
    }
  }

  /// Clears all key-value pairs stored securely.
  ///
  /// Returns a [Result<void>] indicating the outcome:
  /// - [Success] containing no value if the operation succeeded.
  /// - [Failure] with [SecureStorageException] if the operation fails.
  Future<Result<void>> clearAll() async {
    try {
      await _secureStorage.deleteAll();
      logger.d('All values cleared successfully');

      return Success.unit();
    } catch (e, st) {
      logger.e('Failed to clear all values: $e\n$st');

      return Failure(
        SecureStorageException('Failed to clear all values', cause: e),
      );
    }
  }

  /// Reads all securely stored key-value pairs.
  ///
  /// Returns a [Result<Map<String, String>>] with:
  /// - [Success] containing a map of all key-value pairs.
  /// - [Failure] with [SecureStorageException] if the read fails.
  Future<Result<Map<String, String>>> readAll() async {
    try {
      final allValues = await _secureStorage.readAll();
      logger.d('All values read successfully: ${allValues.length} items');

      return Success(allValues);
    } catch (e, st) {
      logger.e('Failed to read all values: $e\n$st');

      return Failure(
        SecureStorageException('Failed to read all values', cause: e),
      );
    }
  }
}
