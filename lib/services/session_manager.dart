import 'package:pi_hole_client/repository/secure_storage.dart';

class SessionManager {
  final SecureStorageRepository _storage;
  final String _address;
  String? _sid;

  SessionManager(this._storage, this._address);

  get sid => _sid;

  get password async {
    try {
      return await _storage.getValue('${_address}_password');
    } catch (e) {
      return null;
    }
  }

  Future<bool> save(String sid) async {
    try {
      await _storage.saveValue('${_address}_sid', sid);
      _sid = sid;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> load() async {
    try {
      _sid = await _storage.getValue('${_address}_sid');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete() async {
    try {
      await _storage.deleteValue('${_address}_sid');
      _sid = null;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> savePassword(String password) async {
    try {
      await _storage.saveValue('${_address}_password', password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
