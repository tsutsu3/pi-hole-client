import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/secure_data_repository.dart';

import '../../../testing/fakes/services/fake_secure_storage_service.dart';

void main() {
  const address = 'http://localhost';
  late FakeSecureStorageService fakeStorage;
  late SecureDataRepository repository;

  group('SecureDataRepository', () {
    setUp(() {
      fakeStorage = FakeSecureStorageService();
      repository = SecureDataRepository(fakeStorage, address);
    });

    test('get password returns Failure if not found', () async {
      final result = await repository.password;
      expect(result.isError(), true);
    });

    test('get token returns Failure if not found', () async {
      final result = await repository.token;
      expect(result.isError(), true);
    });

    test('saveSid and sid getter', () async {
      final result = await repository.saveSid('sid123');
      expect(result.isSuccess(), true);
      expect(repository.sid.getOrNull(), 'sid123');
    });

    test('saveSid returns Failure', () async {
      fakeStorage.shouldFailSave = true;

      final result = await repository.saveSid('sid123');
      expect(result.isError(), true);
      expect(repository.sid.isError(), true);
    });

    test('loadSid caches sid', () async {
      await repository.saveSid('sid123');

      final result = await repository.loadSid();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'sid123');
      expect(repository.sid.getOrNull(), 'sid123');
    });

    test('loadSid returns Failure if not found', () async {
      fakeStorage.shouldFailRead = true;

      final result = await repository.loadSid();
      expect(result.isError(), true);
      expect(repository.sid.isError(), true);
    });

    test('deleteSid clears sid', () async {
      await repository.saveSid('sid123');

      final result = await repository.deleteSid();
      expect(result.isSuccess(), true);
      expect(repository.sid.isError(), true);
    });

    test('deleteSid returns Failure if delete fails', () async {
      await repository.saveSid('sid123');
      fakeStorage.shouldFailDelete = true;

      final result = await repository.deleteSid();
      expect(result.isError(), true);
      expect(repository.sid.getOrNull(), 'sid123');
    });

    test('savePassword and get password', () async {
      await repository.savePassword('pass123');

      final result = await repository.password;
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'pass123');
    });

    test('savePassword returns Failure if save fails', () async {
      fakeStorage.shouldFailSave = true;

      final result = await repository.savePassword('pass123');
      expect(result.isError(), true);
      final getResult = await repository.password;
      expect(getResult.isError(), true);
    });

    test('deletePassword removes password', () async {
      await repository.savePassword('pass123');

      final result = await repository.deletePassword();
      expect(result.isSuccess(), true);
      final getResult = await repository.password;
      expect(getResult.isError(), true);
    });

    test('deletePassword returns Failure if delete fails', () async {
      await repository.savePassword('pass123');
      fakeStorage.shouldFailDelete = true;

      final result = await repository.deletePassword();
      expect(result.isError(), true);
      final getResult = await repository.password;
      expect(getResult.isSuccess(), true);
      expect(getResult.getOrNull(), 'pass123');
    });

    test('saveToken and get token', () async {
      await repository.saveToken('token123');
      final result = await repository.token;
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'token123');
    });

    test('saveToken returns Failure if save fails', () async {
      fakeStorage.shouldFailSave = true;

      final result = await repository.saveToken('token123');
      expect(result.isError(), true);
      final getResult = await repository.token;
      expect(getResult.isError(), true);
    });

    test('deleteToken removes token', () async {
      await repository.saveToken('token123');

      final result = await repository.deleteToken();
      expect(result.isSuccess(), true);
      final getResult = await repository.token;
      expect(getResult.isError(), true);
    });

    test('deleteToken returns Failure if delete fails', () async {
      await repository.saveToken('token123');
      fakeStorage.shouldFailDelete = true;

      final result = await repository.deleteToken();
      expect(result.isError(), true);
      final getResult = await repository.token;
      expect(getResult.isSuccess(), true);
      expect(getResult.getOrNull(), 'token123');
    });
  });
}
