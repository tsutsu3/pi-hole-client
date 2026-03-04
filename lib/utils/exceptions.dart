import 'dart:io';

/// Exception indicating that a feature is not supported.
class NotSupportedException implements Exception {
  /// Creates a NotSupportedException with an optional [message].
  NotSupportedException([this.message = 'This operation is not supported.']);
  final String message;

  @override
  String toString() => 'NotSupportedException: $message';
}

class TokenNotFoundException implements Exception {
  /// Creates a TokenNotFoundException with an optional [message].
  TokenNotFoundException([this.message = 'Token not found.']);
  final String message;

  @override
  String toString() => 'TokenNotFoundException: $message';
}

class SidNotFoundException implements Exception {
  /// Creates a SidNotFoundException with an optional [message].
  SidNotFoundException([this.message = 'SID not found.']);
  final String message;

  @override
  String toString() => 'SidNotFoundException: $message';
}

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
