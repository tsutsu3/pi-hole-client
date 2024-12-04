import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepository {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Save a value securely
  Future<void> saveValue(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  // Retrieve a value securely
  Future<String?> getValue(String key) async {
    return await _secureStorage.read(key: key);
  }

  // Delete a value
  Future<void> deleteValue(String key) async {
    await _secureStorage.delete(key: key);
  }

  // Clear all values
  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }

  Future<Map<String, String>> readAll() async {
    Map<String, String> allValues = await _secureStorage.readAll();
    return allValues;
  }
}
