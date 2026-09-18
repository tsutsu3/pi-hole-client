import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/utils/already_exists.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

const _itemAlreadyPresent =
    '{"error":{"key":"bad_request","message":"Item already present", '
    '"hint":"Uniqueness of items is enforced"},"took":0.0002}';
const _itemIsAlreadyPresent =
    '{"error":{"key":"database_error","message":"Could not add to gravity '
    'database","hint":"The item is already present"},"took":0.0002}';
const _uniqueConstraint =
    '{"error":{"key":"database_error","message":"Could not add to gravity '
    'database","hint":"UNIQUE constraint failed: domainlist.domain, '
    'domainlist.type"},"took":0.0002}';

void main() {
  group('mapDuplicateFailure', () {
    test('turns a 400 "Item already present" into AlreadyExists', () {
      final result = mapDuplicateFailure<Unit>(
        Failure(HttpStatusCodeException(400, _itemAlreadyPresent)),
      );

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
    });

    test('turns a 400 "The item is already present" into AlreadyExists', () {
      final result = mapDuplicateFailure<Unit>(
        Failure(HttpStatusCodeException(400, _itemIsAlreadyPresent)),
      );

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
    });

    test('turns a 400 "UNIQUE constraint failed" into AlreadyExists', () {
      final result = mapDuplicateFailure<Unit>(
        Failure(HttpStatusCodeException(400, _uniqueConstraint)),
      );

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
    });

    test('keeps other 400 errors', () {
      final error = HttpStatusCodeException(400, '{"error":{"key":"x"}}');

      final result = mapDuplicateFailure<Unit>(Failure(error));

      expect(result.exceptionOrNull(), error);
    });

    test('keeps 5xx errors even with a duplicate text', () {
      final error = HttpStatusCodeException(500, _itemAlreadyPresent);

      final result = mapDuplicateFailure<Unit>(Failure(error));

      expect(result.exceptionOrNull(), error);
    });

    test('keeps a success', () {
      final result = mapDuplicateFailure<Unit>(const Success(unit));

      expect(result.isSuccess(), isTrue);
    });
  });

  group('checkProcessedErrors', () {
    test('builds the value when there are no errors', () {
      expect(checkProcessedErrors(null, () => 1).getOrNull(), 1);
      expect(checkProcessedErrors(const [], () => 1).getOrNull(), 1);
    });

    test('returns AlreadyExists for a duplicate error', () {
      final result = checkProcessedErrors(const [
        'UNIQUE constraint failed: domainlist.domain, domainlist.type',
      ], () => 1);

      expect(result.exceptionOrNull(), isA<AlreadyExistsException>());
    });

    test('keeps the server text for other errors', () {
      final result = checkProcessedErrors(const ['Invalid domain'], () => 1);

      final error = result.exceptionOrNull();
      expect(error, isNot(isA<AlreadyExistsException>()));
      expect(error.toString(), contains('Invalid domain'));
    });
  });
}
