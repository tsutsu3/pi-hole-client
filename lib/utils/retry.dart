import 'dart:async';

/// Executes an asynchronous [action] with retry logic.
///
/// This utility function is useful for operations that might fail transiently,
/// such as database queries or network requests. If the [action] throws an
/// exception, it will retry up to [maxRetries] times, waiting [delay] between attempts.
///
/// The retry loop stops as soon as [action] completes successfully. If the maximum
/// number of attempts is exceeded, the last exception will be rethrown.
///
/// Example:
/// ```dart
/// final result = await runWithRetry(
///   action: () => db.query('SELECT * FROM appConfig'),
///   maxRetries: 5,
///   delay: Duration(milliseconds: 200),
///   onRetry: (attempt, error, st) {
///     logger.w('Retry $attempt failed: $error');
///   },
/// );
/// ```
///
/// Type parameter:
/// - [T]: The return type of the asynchronous [action].
///
/// Parameters:
/// - [action]: The asynchronous operation to execute. It must return a [Future<T>] and may throw an exception.
/// - [maxRetries]: Maximum number of retry attempts before giving up. Defaults to 5.
/// - [delay]: Delay between retries. Defaults to 200 milliseconds.
/// - [onRetry]: Optional callback invoked on each failed attempt with the current attempt count, error, and [StackTrace].
///
/// Returns:
/// - A [Future<T>] that resolves to the result of [action] if it succeeds within the retry limit.
///
/// Throws:
/// - Rethrows the last exception if all retry attempts fail.
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
