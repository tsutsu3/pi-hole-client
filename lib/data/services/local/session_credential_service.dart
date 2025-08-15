import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:result_dart/result_dart.dart';

/// A service for securely storing, retrieving, and managing
/// sensitive session credentials (SID, password, token) for a specific server.
///
/// This service wraps [SecureStorageService] to provide a higher-level
/// API for working with authentication-related values.
/// It automatically namespaces keys using the provided `address`,
/// allowing multiple server credentials to be stored without conflict.
///
/// Additionally, it maintains an in-memory cache for the `sid` value
/// to avoid repeated secure storage reads.
class SessionCredentialService {
  SessionCredentialService(SecureStorageService storage, String address)
    : _storage = storage,
      _address = address;

  final SecureStorageService _storage;
  final String _address;

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

  /// Retrieves the current session ID from secure storage (v6).
  ///
  /// Returns a [Success] with the session ID, or [Failure] if not found or failed.
  Future<Result<String>> get sid async {
    return _storage.getValue('${_address}_sid');
  }

  /// Saves a [sid] securely and updates the in-memory cache (v6).
  ///
  /// Returns [Success] if successful, or [Failure] with the error.
  Future<Result<void>> saveSid(String sid) async {
    return _storage.saveValue('${_address}_sid', sid);
  }

  /// Deletes the stored session ID and clears the in-memory cache (v6).
  ///
  /// Returns [Success] if successful, or [Failure] with the error.
  Future<Result<void>> deleteSid() async {
    return _storage.deleteValue('${_address}_sid');
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
