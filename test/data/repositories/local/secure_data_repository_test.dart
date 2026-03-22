import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/local/secure_data_repository.dart';

import '../../../../testing/fakes/services/fake_secure_storage_service.dart';

void main() {
  const address = 'http://pi.hole';

  group('sid getter', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should return Failure when sid has not been loaded', () {
      final result = repository.sid;
      expect(result.isError(), true);
      expect(result.exceptionOrNull().toString(), contains('SID not loaded'));
    });

    test('should return Success after saveSid is called', () async {
      await repository.saveSid('test-sid-123');
      final result = repository.sid;
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'test-sid-123');
    });

    test('should return Success after loadSid is called', () async {
      storage.store['${address}_sid'] = 'stored-sid';
      await repository.loadSid();
      final result = repository.sid;
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'stored-sid');
    });

    test('should return Failure after deleteSid is called', () async {
      await repository.saveSid('test-sid');
      await repository.deleteSid();
      final result = repository.sid;
      expect(result.isError(), true);
    });
  });

  group('password', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should return password when stored', () async {
      storage.store['${address}_password'] = 'secret123';
      final result = await repository.password;
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'secret123');
    });

    test('should return Failure when password is not stored', () async {
      final result = await repository.password;
      expect(result.isError(), true);
    });

    test('should return Failure when storage read fails', () async {
      storage.shouldFailRead = true;
      final result = await repository.password;
      expect(result.isError(), true);
    });
  });

  group('token', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should return token when stored', () async {
      storage.store['${address}_token'] = 'mytoken';
      final result = await repository.token;
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'mytoken');
    });

    test('should return Failure when token is not stored', () async {
      final result = await repository.token;
      expect(result.isError(), true);
    });

    test('should return Failure when storage read fails', () async {
      storage.shouldFailRead = true;
      final result = await repository.token;
      expect(result.isError(), true);
    });
  });

  group('saveSid', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should save sid to storage and update in-memory cache', () async {
      final result = await repository.saveSid('new-sid');
      expect(result.isSuccess(), true);
      expect(storage.store['${address}_sid'], 'new-sid');
      expect(repository.sid.getOrNull(), 'new-sid');
    });

    test(
      'should return Failure and not update cache when storage fails',
      () async {
        storage.shouldFailSave = true;
        final result = await repository.saveSid('new-sid');
        expect(result.isError(), true);
        expect(repository.sid.isError(), true);
      },
    );
  });

  group('loadSid', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should load sid from storage and cache it', () async {
      storage.store['${address}_sid'] = 'cached-sid';
      final result = await repository.loadSid();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'cached-sid');
      expect(repository.sid.getOrNull(), 'cached-sid');
    });

    test('should return Failure when sid is not stored', () async {
      final result = await repository.loadSid();
      expect(result.isError(), true);
    });

    test('should return Failure when storage read fails', () async {
      storage.shouldFailRead = true;
      final result = await repository.loadSid();
      expect(result.isError(), true);
    });
  });

  group('deleteSid', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should delete sid from storage and clear in-memory cache', () async {
      await repository.saveSid('to-delete');
      expect(repository.sid.isSuccess(), true);

      final result = await repository.deleteSid();
      expect(result.isSuccess(), true);
      expect(storage.store.containsKey('${address}_sid'), false);
      expect(repository.sid.isError(), true);
    });

    test(
      'should return Failure and preserve cache when delete fails',
      () async {
        await repository.saveSid('to-delete');
        storage.shouldFailDelete = true;

        final result = await repository.deleteSid();
        expect(result.isError(), true);
        expect(repository.sid.isSuccess(), true);
      },
    );
  });

  group('savePassword', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should save password to storage', () async {
      final result = await repository.savePassword('mypassword');
      expect(result.isSuccess(), true);
      expect(storage.store['${address}_password'], 'mypassword');
    });

    test('should return Failure when storage fails', () async {
      storage.shouldFailSave = true;
      final result = await repository.savePassword('mypassword');
      expect(result.isError(), true);
    });
  });

  group('saveToken', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should save token to storage', () async {
      final result = await repository.saveToken('mytoken');
      expect(result.isSuccess(), true);
      expect(storage.store['${address}_token'], 'mytoken');
    });

    test('should return Failure when storage fails', () async {
      storage.shouldFailSave = true;
      final result = await repository.saveToken('mytoken');
      expect(result.isError(), true);
    });
  });

  group('deletePassword', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should delete password from storage', () async {
      await repository.savePassword('to-delete');
      final result = await repository.deletePassword();
      expect(result.isSuccess(), true);
      expect(storage.store.containsKey('${address}_password'), false);
    });

    test('should return Failure when delete fails', () async {
      storage.shouldFailDelete = true;
      final result = await repository.deletePassword();
      expect(result.isError(), true);
    });
  });

  group('deleteToken', () {
    late SecureDataRepository repository;
    late FakeSecureStorageService storage;

    setUp(() {
      storage = FakeSecureStorageService();
      repository = SecureDataRepository(storage, address);
    });

    test('should delete token from storage', () async {
      await repository.saveToken('to-delete');
      final result = await repository.deleteToken();
      expect(result.isSuccess(), true);
      expect(storage.store.containsKey('${address}_token'), false);
    });

    test('should return Failure when delete fails', () async {
      storage.shouldFailDelete = true;
      final result = await repository.deleteToken();
      expect(result.isError(), true);
    });
  });
}
