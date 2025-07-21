import 'package:pi_hole_client/data/services/storage/secure_storage_service.dart';
import 'package:result_dart/result_dart.dart';

/// A repository for securely storing, retrieving, and managing
/// sensitive session data (SID, password, token) associated with a server.
///
/// This class wraps [SecureStorageService] and introduces namespacing using
/// the provided [_address], allowing multiple server credentials to be handled safely.
///
/// It maintains an in-memory cache for the `sid` value and exposes a getter.
class SecureDataRepository {
  SecureDataRepository(SecureStorageService storage, String address)
      : _storage = storage,
        _address = address;

  final SecureStorageService _storage;
  final String _address;
  String? _sid;

  /// Returns the currently cached session ID (`sid`).
  String? get sid => _sid;

  /// Retrieves the stored password for the server (v6).
  ///
  /// Returns a [Success] with the password, or [Failure] if not found or an error occurs.
  Future<Result<String>> get password async {
    return _storage.getValue('${_address}_password');
  }

  /// Retrieves the stored token for the server (v5).
  ///
  /// Returns a [Success] with the token, or [Failure] if not found or an error occurs.
  Future<Result<String>> get token async {
    return _storage.getValue('${_address}_token');
  }

  /// Saves a [sid] securely and updates the in-memory cache (v6).
  ///
  /// Returns [Success] if successful, or [Failure] with the error.
  Future<Result<void>> saveSid(String sid) async {
    final result = await _storage.saveValue('${_address}_sid', sid);
    if (result.isSuccess()) {
      _sid = sid;
    }
    return result;
  }

  /// Loads a session ID from secure storage and caches it (v6).
  ///
  /// Returns a [Success] with the session ID, or [Failure] if not found or failed.
  Future<Result<String>> loadSid() async {
    final result = await _storage.getValue('${_address}_sid');
    if (result.isSuccess()) {
      _sid = result.getOrNull();
    }
    return result;
  }

  /// Deletes the stored session ID and clears the in-memory cache (v6).
  ///
  /// Returns [Success] if successful, or [Failure] with the error.
  Future<Result<void>> deleteSid() async {
    final result = await _storage.deleteValue('${_address}_sid');
    if (result.isSuccess()) {
      _sid = null;
    }
    return result;
  }

  /// Saves the given [password] securely for the current server (v6).
  ///
  /// Returns [Success] if successful, or [Failure] with the error.
  Future<Result<void>> savePassword(String password) async {
    return _storage.saveValue('${_address}_password', password);
  }

  /// Saves the given [token] securely for the current server (v5).
  ///
  /// Returns [Success] if successful, or [Failure] with the error.
  Future<Result<void>> saveToken(String token) async {
    return _storage.saveValue('${_address}_token', token);
  }

  /// Deletes the stored password for the current server (v6).
  ///
  /// Returns [Success] if successful, or [Failure] with the error.
  Future<Result<void>> deletePassword() async {
    return _storage.deleteValue('${_address}_password');
  }

  /// Deletes the stored token for the current server (v5).
  ///
  /// Returns [Success] if successful, or [Failure] with the error.
  Future<Result<void>> deleteToken() async {
    return _storage.deleteValue('${_address}_token');
  }
}
