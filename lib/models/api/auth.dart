import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

/// Represents the response of an authentication status request.
///
/// Contains session status information and the time taken to process the request.
@freezed
class AuthStatusResponse with _$AuthStatusResponse {
  /// Creates an [AuthStatusResponse].
  const factory AuthStatusResponse({
    /// Information about the session status.
    required SessionStatus sessionstatus,

    /// Time taken for the authentication request in milliseconds.
    required int took,
  }) = _AuthStatusResponse;

  /// Converts JSON data to an [AuthStatusResponse].
  factory AuthStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthStatusResponseFromJson(json);
}

/// Represents the status of a user session in the Pi-hole API.
@freezed
class SessionStatus with _$SessionStatus {
  /// Creates a [SessionStatus].
  const factory SessionStatus({
    /// Indicates if the session is valid (client is authenticated).
    required bool valid,

    /// Indicates if two-factor authentication (TOTP) is enabled.
    required bool totp,

    /// The session ID.
    String? sid,

    /// The CSRF token.
    String? csrf,

    /// Remaining lifetime of the session in seconds, unless refreshed.
    required int validity,

    /// Human-readable message describing the session status.
    String? message,
  }) = _SessionStatus;

  /// Converts JSON data to a [SessionStatus].
  factory SessionStatus.fromJson(Map<String, dynamic> json) =>
      _$SessionStatusFromJson(json);
}

/// Represents a password in an authentication request.
@freezed
class Password with _$Password {
  /// Creates a [Password].
  const factory Password({
    /// The password string.
    required String password,
  }) = _Password;

  /// Converts JSON data to a [Password].
  factory Password.fromJson(Map<String, dynamic> json) =>
      _$PasswordFromJson(json);
}

/// Represents the response containing an application password.
@freezed
class AppPasswordResponse with _$AppPasswordResponse {
  /// Creates an [AppPasswordResponse].
  const factory AppPasswordResponse({
    /// Information about the application password.
    required App app,

    /// Time taken to process the request in milliseconds.
    required int took,
  }) = _AppPasswordResponse;

  /// Converts JSON data to an [AppPasswordResponse].
  factory AppPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$AppPasswordResponseFromJson(json);
}

/// Represents an application password with associated hash.
@freezed
class App with _$App {
  /// Creates an [App].
  const factory App({
    /// The application password.
    required String password,

    /// The hash of the application password.
    required String hash,
  }) = _App;

  /// Converts JSON data to an [App].
  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
}

/// Represents the response of a request to list all active sessions.
@freezed
class SessionListResponse with _$SessionListResponse {
  /// Creates a [SessionListResponse].
  const factory SessionListResponse({
    /// A list of active sessions.
    required List<Session> sessions,

    /// Time taken to process the request in seconds.
    required int took,
  }) = _SessionListResponse;

  /// Converts JSON data to a [SessionListResponse].
  factory SessionListResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionListResponseFromJson(json);
}

/// Represents an individual session object with properties.
@freezed
class Session with _$Session {
  /// Creates a [Session].
  const factory Session({
    /// Unique identifier for the session.
    required int id,

    /// Indicates if this is the current session.
    required bool currentSession,

    /// Indicates if the session is valid (may become invalid due to timeout).
    required bool valid,

    /// TLS encryption details for the session.
    required Tls tls,

    /// Indicates if this session was initiated using an application password.
    required bool app,

    /// Indicates if this session was initiated using the CLI.
    required bool cli,

    /// Timestamp of login, in seconds since epoch.
    required int loginAt,

    /// Timestamp of last activity, in seconds since epoch.
    required int lastActive,

    /// Timestamp of session expiration, in seconds since epoch.
    required int validUntil,

    /// Client's IP address that initiated the session.
    required String remoteAddr,

    /// Client's user agent (optional).
    String? userAgent,

    /// Client's IP address if behind a proxy (optional).
    String? xForwardedFor,
  }) = _Session;

  /// Converts JSON data to a [Session].
  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

/// Represents TLS (end-to-end encryption) settings for a session.
@freezed
class Tls with _$Tls {
  /// Creates a [Tls].
  const factory Tls({
    /// Indicates if TLS was used during login for this session.
    required bool login,

    /// Indicates if TLS is partially used in this session.
    required bool mixed,
  }) = _Tls;

  /// Converts JSON data to a [Tls].
  factory Tls.fromJson(Map<String, dynamic> json) => _$TlsFromJson(json);
}
