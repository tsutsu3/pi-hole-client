import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage repository
///
/// This class is used to store and retrieve sensitive data securely.
///
/// Parameters:
/// - [secureStorage]: FlutterSecureStorage instance: Secure storage instance
/// - [address]: String: Server address. Default is 'http://localhost:80'
/// - [environment]: String: Environment name. Default is 'prd'
class SecureStorageRepository {
  final FlutterSecureStorage _secureStorage;
  final String _address;
  final String _environment;

  Future<String?> get sid async {
    return await _readValue(_sidKey);
  }

  Future<String?> get password async {
    return await _readValue(_passwordKey);
  }

  Future<String?> get token async {
    return await _readValue(_tokenKey);
  }

  Future<String?> get basicAuthUser async {
    return await _readValue(_basicAuthUserKey);
  }

  Future<String?> get basicAuthPassword async {
    return await _readValue(_basicAuthPasswordKey);
  }

  Future<String?> get passCode async {
    return await _readValue(_passCodeKey);
  }

  String get _sidKey => '${_environment}_${_address}_sid';
  String get _passwordKey => '${_environment}_${_address}_password';
  String get _tokenKey => '${_environment}_${_address}_token';
  String get _basicAuthUserKey => '${_environment}_${_address}_basicAuthUser';
  String get _basicAuthPasswordKey =>
      '${_environment}_${_address}_basicAuthPassword';
  String get _passCodeKey => '${_environment}_passCode';

  SecureStorageRepository({
    FlutterSecureStorage? secureStorage,
    String? address,
    String? environment,
  })  : _secureStorage = secureStorage ?? const FlutterSecureStorage(),
        _address = address ?? 'http://localhost',
        _environment = environment ?? 'prd';

  Future<bool> saveSid(String? sid) async {
    return await _writeValue(_sidKey, sid);
  }

  Future<bool> savePassword(String? password) async {
    return await _writeValue(_passwordKey, password);
  }

  Future<bool> saveToken(String? token) async {
    return await _writeValue(_tokenKey, token);
  }

  Future<bool> saveBasicAuthUser(String? basicAuthUser) async {
    return await _writeValue(_basicAuthUserKey, basicAuthUser);
  }

  Future<bool> saveBasicAuthPassword(String? basicAuthPassword) async {
    return await _writeValue(_basicAuthPasswordKey, basicAuthPassword);
  }

  Future<bool> savePassCode(String? passCode) async {
    return await _writeValue(_passCodeKey, passCode);
  }

  /// Read all environment data
  ///
  /// This method reads all values stored in the secure storage for a specific environment.
  Future<Map<String, String>> readEnvironmentData({String? environment}) async {
    try {
      final allData = await _secureStorage.readAll();
      final environmentData = Map<String, String>.fromEntries(
        allData.entries
            .where((entry) => entry.key.startsWith(environment ?? _environment))
            .map(
              (entry) => MapEntry(
                entry.key,
                entry.value,
              ),
            ),
      );
      return environmentData;
    } catch (e) {
      return {};
    }
  }

  /// Delete all environment data
  ///
  /// This method deletes all values stored in the secure storage for a specific environment.
  Future<bool> deleteEnvironmentData({String? environment}) async {
    try {
      final allData = await _secureStorage.readAll();
      final environmentKeys = allData.keys
          .where((key) => key.startsWith(environment ?? _environment))
          .toList();

      for (final key in environmentKeys) {
        await _secureStorage.delete(key: key);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Read all values
  ///
  /// This method reads all values stored in the secure storage.
  Future<Map<String, String>> readAll() async {
    Map<String, String> allValues = await _secureStorage.readAll();
    return allValues;
  }

  /// Delete all values
  ///
  /// This method deletes all values stored in the secure storage.
  Future<bool> deleteAll() async {
    try {
      await _secureStorage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Read a value, if the key does not exist, return null
  Future<String?> _readValue(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      return null;
    }
  }

  /// Write a value, if the value is null, delete the key
  Future<bool> _writeValue(String key, String? value) async {
    try {
      if (value == null) {
        return await _deleteValue(key);
      }
      await _secureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Delete a value
  Future<bool> _deleteValue(String key) async {
    try {
      await _secureStorage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }
}
