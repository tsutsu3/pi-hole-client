import 'dart:async';
import 'package:result_dart/result_dart.dart';

/// Executes an asynchronous [action] with retry logic until it succeeds or the retry limit is reached.
///
/// This utility is useful for transient failures such as network calls or database operations
/// where a retry can often succeed. The loop stops immediately if [action] completes successfully.
/// If the maximum retry count is reached, the last exception is rethrown.
///
/// Example:
/// ```dart
/// final data = await runWithRetry(
///   action: () => api.fetchData(),
///   maxRetries: 3,
///   delay: Duration(seconds: 1),
///   onRetry: (attempt, error, st) {
///     logger.w('Retry #$attempt failed: $error');
///   },
/// );
/// ```
///
/// Type parameter:
/// - [T]: The return type of the asynchronous [action].
///
/// Parameters:
/// - [action]: The asynchronous operation to execute. Must return a [Future<T>] and may throw an exception.
/// - [maxRetries]: Maximum number of retry attempts before giving up. Defaults to 5.
/// - [delay]: Delay between retry attempts. Defaults to 200 milliseconds.
/// - [onRetry]: Optional callback invoked after each failed attempt, with the current attempt count, the thrown error, and its [StackTrace].
///
/// Returns:
/// - A [Future<T>] that resolves to the successful result of [action].
///
/// Throws:
/// - The last caught exception if all retry attempts fail.
Future<T> runWithRetry<T>({
  required Future<T> Function() action,
  int maxRetries = 5,
  Duration delay = const Duration(milliseconds: 200),
  void Function(int attempt, Object error, StackTrace st)? onRetry,
}) async {
  var attempt = 0;
  while (true) {
    try {
      return await action();
    } catch (e, st) {
      attempt++;
      if (attempt >= maxRetries) rethrow;

      onRetry?.call(attempt, e, st);
      await Future.delayed(delay);
    }
  }
}

/// Executes an asynchronous [action] returning a [Result] with retry logic.
///
/// Similar to [runWithRetry], but specialized for functions that return a [Result] type
/// (such as from the `result_dart` package). Retries are only performed if the result is a [Failure].
/// If [action] throws an exception, the retry loop stops and returns a [Failure] containing the exception.
///
/// This is useful when the operation itself already captures domain-specific failures in [Result]
/// but still may need retrying for transient errors.
///
/// Example:
/// ```dart
/// final result = await runWithResultRetry(
///   action: () => repository.fetchData(),
///   maxRetries: 2,
///   delay: Duration(milliseconds: 100),
///   onRetry: (attempt) => repository.clearCache(),
/// );
/// if (result.isError()) {
///   logger.e('Operation failed: ${result.asError().error}');
/// }
/// ```
///
/// Type parameter:
/// - [T]: The value type inside the [Result].
///
/// Parameters:
/// - [action]: The asynchronous operation to execute. Must return a [Future<Result<T>>].
/// - [maxRetries]: Maximum number of retry attempts before giving up. Defaults to 1.
/// - [delay]: Delay between retry attempts. Defaults to 10 milliseconds.
/// - [onRetry]: Optional callback invoked after each failed attempt, with the current attempt count.
///
/// Returns:
/// - A [Future<Result<T>>] that resolves to the first [Success] returned by [action],
///   or the last [Failure] if all retry attempts fail.
///
/// Exceptions:
/// - If [action] throws, returns a [Failure] containing the thrown exception without further retries.
Future<Result<T>> runWithResultRetry<T extends Object>({
  required Future<Result<T>> Function() action,
  int maxRetries = 1,
  Duration delay = const Duration(milliseconds: 10),
  Future<void> Function(int attempt)? onRetry,
}) async {
  var attempt = 0;
  Result<T>? lastFailure;

  while (attempt <= maxRetries) {
    try {
      final result = await action();
      if (result.isSuccess()) {
        return result;
      }
      lastFailure = result;
    } catch (e, st) {
      return Failure(Exception('Exception on attempt $attempt: $e\n$st'));
    }

    attempt++;
    if (attempt <= maxRetries) {
      if (onRetry != null) {
        try {
          await onRetry(attempt);
        } catch (e, st) {
          return Failure(Exception('Exception on onRetry $attempt: $e\n$st'));
        }
      }
      await Future.delayed(delay);
    }
  }

  return lastFailure ??
      Failure(Exception('Failed after $maxRetries retries with no result'));
}
