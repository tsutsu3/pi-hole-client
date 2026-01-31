import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:result_dart/result_dart.dart';

class FakeSecureStorageService implements SecureStorageService {
  Map<String, String> store = {};

  bool shouldFailSave = false;
  bool shouldFailRead = false;
  bool shouldFailDelete = false;
  bool shouldFailClear = false;
  bool shouldFailReadAll = false;

  bool shouldThrowOnSave = false;
  bool shouldThrowOnRead = false;
  bool shouldThrowOnDelete = false;
  bool shouldThrowOnClear = false;
  bool shouldThrowOnReadAll = false;

  @override
  Future<Result<void>> saveValue(String key, String value) async {
    if (shouldFailSave) {
      return Failure(Exception('Forced save failure'));
    }
    if (shouldThrowOnSave) {
      throw Exception('Forced save exception');
    }
    store[key] = value;
    return Success.unit();
  }

  @override
  Future<Result<String>> getValue(String key) async {
    if (shouldFailRead) {
      return Failure(Exception('Forced read failure'));
    }
    if (shouldThrowOnRead) {
      throw Exception('Forced read exception');
    }
    final value = store[key];
    return value != null
        ? Success(value)
        : Failure(Exception('Value not found'));
  }

  @override
  Future<Result<void>> deleteValue(String key) async {
    if (shouldFailDelete) {
      return Failure(Exception('Forced delete failure'));
    }
    if (shouldThrowOnDelete) {
      throw Exception('Forced delete exception');
    }
    store.remove(key);
    return Success.unit();
  }

  @override
  Future<Result<void>> clearAll() async {
    if (shouldFailClear) {
      return Failure(Exception('Forced clear failure'));
    }
    if (shouldThrowOnClear) {
      throw Exception('Forced clear exception');
    }
    store.clear();
    return Success.unit();
  }

  @override
  Future<Result<Map<String, String>>> readAll() async {
    if (shouldFailReadAll) {
      return Failure(Exception('Forced read all failure'));
    }
    if (shouldThrowOnReadAll) {
      throw Exception('Forced read all exception');
    }
    return Success(Map.unmodifiable(store));
  }
}
