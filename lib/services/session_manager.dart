import 'package:pi_hole_client/repository/secure_storage.dart';

/// SessionManager is a class that manages the session of the user.
///
/// Parameters:
/// - `_storage`: SecureStorageRepository: The storage repository to store the session.
/// - `_address`: String: The address of the Pi-hole server.
class SessionManager {
  final SecureStorageRepository _storage;
  String? _sid;

  String? get sid => _sid;

  Future<String?>? get password async {
    return await _storage.password;
  }

  SessionManager(this._storage);

  Future<bool> save(String sid) async {
    return await _storage.saveSid(sid);
  }

  Future<bool> load() async {
    try {
      _sid = await _storage.sid;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete() async {
    try {
      await _storage.saveSid(null);
      _sid = null;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> savePassword(String password) async {
    return await _storage.savePassword(password);
  }
}
