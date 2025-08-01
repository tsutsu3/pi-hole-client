import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import '../local/secure_storage_service_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage mockStorage;
  late SecureStorageService service;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    service = SecureStorageService(secureStorage: mockStorage);
  });

  group('SecureStorageService', () {
    test('saveValue returns Success on write', () async {
      when(mockStorage.write(key: anyNamed('key'), value: anyNamed('value')))
          .thenAnswer((_) async => {});
      final result = await service.saveValue('testKey', 'testValue');
      expect(result.isSuccess(), true);
    });

    test('saveValue returns Failure on exception', () async {
      when(mockStorage.write(key: anyNamed('key'), value: anyNamed('value')))
          .thenThrow(Exception('write error'));
      final result = await service.saveValue('testKey', 'testValue');
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Failed to save value: Exception: write error'),
      );
    });

    test('getValue returns Success when value exists', () async {
      when(mockStorage.read(key: anyNamed('key')))
          .thenAnswer((_) async => 'storedValue');
      final result = await service.getValue('testKey');
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'storedValue');
    });

    test('getValue returns Failure when value is null', () async {
      when(mockStorage.read(key: anyNamed('key')))
          .thenAnswer((_) async => null);
      final result = await service.getValue('testKey');
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('No value found for key: testKey'),
      );
    });

    test('getValue returns Failure on exception', () async {
      when(mockStorage.read(key: anyNamed('key')))
          .thenThrow(Exception('read error'));
      final result = await service.getValue('testKey');
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Failed to read value: Exception: read error'),
      );
    });

    test('deleteValue returns Success on delete', () async {
      when(mockStorage.delete(key: anyNamed('key')))
          .thenAnswer((_) async => {});
      final result = await service.deleteValue('testKey');
      expect(result.isSuccess(), true);
    });

    test('deleteValue returns Failure on exception', () async {
      when(mockStorage.delete(key: anyNamed('key')))
          .thenThrow(Exception('delete error'));
      final result = await service.deleteValue('testKey');
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Failed to delete value: Exception: delete error'),
      );
    });

    test('clearAll returns Success on deleteAll', () async {
      when(mockStorage.deleteAll()).thenAnswer((_) async => {});
      final result = await service.clearAll();
      expect(result.isSuccess(), true);
    });

    test('clearAll returns Failure on exception', () async {
      when(mockStorage.deleteAll()).thenThrow(Exception('deleteAll error'));
      final result = await service.clearAll();
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Failed to clear all values: Exception: deleteAll error'),
      );
    });

    test('readAll returns Success with values', () async {
      final values = {'key1': 'value1', 'key2': 'value2'};
      when(mockStorage.readAll()).thenAnswer((_) async => values);
      final result = await service.readAll();
      expect(result.isSuccess(), true);
      expect(result.getOrNull(), values);
    });

    test('readAll returns Failure on exception', () async {
      when(mockStorage.readAll()).thenThrow(Exception('readAll error'));
      final result = await service.readAll();
      expect(result.isError(), true);
      expect(
        result.exceptionOrNull()?.toString(),
        contains('Failed to read all values: Exception: readAll error'),
      );
    });
  });
}
