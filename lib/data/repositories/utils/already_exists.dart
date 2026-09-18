import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

/// Whether a Pi-hole error text means the item already exists.
///
/// - 400, "The item is already present": FTL v6.7 and later
/// - 201, "UNIQUE constraint failed": before FTL v6.7
bool isDuplicateError(String text) {
  final lower = text.toLowerCase();
  return lower.contains('item is already present') ||
      lower.contains('unique constraint failed');
}

/// Turns a 4xx response whose body says the item already exists into an
/// [AlreadyExistsException]. Other results are returned as they are.
Result<T> mapDuplicateFailure<T extends Object>(Result<T> result) {
  final error = result.exceptionOrNull();
  if (error is HttpStatusCodeException &&
      error.statusCode >= 400 &&
      error.statusCode < 500 &&
      isDuplicateError(error.message)) {
    return Failure(AlreadyExistsException());
  }
  return result;
}

/// Checks the `processed.errors` texts of a successful response.
Result<T> checkProcessedErrors<T extends Object>(
  Iterable<String>? errors,
  T Function() onSuccess,
) {
  if (errors == null || errors.isEmpty) return Success(onSuccess());
  if (errors.any(isDuplicateError)) return Failure(AlreadyExistsException());
  return Failure(Exception(errors.join(', ')));
}
