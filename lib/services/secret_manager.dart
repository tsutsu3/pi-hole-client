import 'package:pi_hole_client/repository/secure_storage.dart';

class SecretManager {
  final SecureStorageRepository _storage;
  final String _address;
  String? _sid;

  String? get sid => _sid;

  Future<String?>? get password async {
    try {
      return await _storage.getValue('${_address}_password');
    } catch (e) {
      return null;
    }
  }

  Future<String?>? get token async {
    try {
      return await _storage.getValue('${_address}_token');
    } catch (e) {
      return null;
    }
  }

  SecretManager(this._storage, this._address);

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

  Future<bool> saveToken(String token) async {
    try {
      await _storage.saveValue('${_address}_token', token);
      return true;
    } catch (e) {
      return false;
    }
  }
}
