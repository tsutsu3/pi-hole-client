import 'dart:io';

/// Exception representing an HTTP error with status code and message.
///
/// Typically thrown when an HTTP request returns a non-2xx status code
/// or when an HTTP-related failure occurs during API calls.
///
/// The [statusCode] holds the HTTP status (e.g., 401, 503),
/// and the optional [message] provides additional context.
class HttpStatusCodeException extends HttpException {
  /// Creates an HTTP exception with a [statusCode] and optional [message].
  HttpStatusCodeException(this.statusCode, [String? message])
    : super(message ?? 'HTTP error: $statusCode');

  final int statusCode;
}
