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

/// Exception indicating the server requires a TOTP (2FA) code to complete
/// login. Pi-hole v6 returns this when the password is correct but no TOTP
/// token was sent (HTTP 400, error key `bad_request`).
class TotpRequiredException implements Exception {
  /// Creates a TotpRequiredException with an optional [message].
  TotpRequiredException([this.message = 'TOTP code required.']);
  final String message;

  @override
  String toString() => 'TotpRequiredException: $message';
}

/// Exception indicating the submitted TOTP (2FA) code was wrong. Pi-hole v6
/// returns this for an invalid token (HTTP 401, error key `unauthorized`,
/// message `Invalid 2FA token`).
class TotpInvalidException implements Exception {
  /// Creates a TotpInvalidException with an optional [message].
  TotpInvalidException([this.message = 'Invalid TOTP code.']);
  final String message;

  @override
  String toString() => 'TotpInvalidException: $message';
}

/// Exception indicating the submitted TOTP (2FA) code was correct but already
/// used. Pi-hole v6 returns this for a reused token (HTTP 401, error key
/// `unauthorized`, message `Reused 2FA token`). The user must wait for the
/// authenticator to roll to a new code before retrying.
class TotpReusedException implements Exception {
  /// Creates a TotpReusedException with an optional [message].
  TotpReusedException([this.message = 'TOTP code already used.']);
  final String message;

  @override
  String toString() => 'TotpReusedException: $message';
}

/// Exception indicating the server is throttling 2FA login attempts. Pi-hole v6
/// returns this when codes are submitted too quickly (HTTP 429, error key
/// `rate_limiting`). Retrying immediately keeps failing, so the login flow must
/// stop and ask the user to wait.
class TotpRateLimitException implements Exception {
  /// Creates a TotpRateLimitException with an optional [message].
  TotpRateLimitException([this.message = 'Too many 2FA attempts.']);
  final String message;

  @override
  String toString() => 'TotpRateLimitException: $message';
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

/// Returns true when [error] indicates an expired or missing session and
/// re-authentication via postAuth is appropriate.
///
/// Returns false for transient failures (503/504/timeout/500/495) where
/// calling postAuth would create a duplicate session on the Pi-hole side.
bool isReauthRequired(Object? error) {
  if (error is HttpStatusCodeException && error.statusCode == 401) return true;
  if (error is SidNotFoundException) return true;
  return false;
}
