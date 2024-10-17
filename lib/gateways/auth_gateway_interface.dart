import "../models/api/auth.dart";

abstract interface class AuthGateway {
  /// Checks if authentication is required.
  Future<AuthStatusResponse> checkAuthenticationRequired();

  /// Submits a password for login.
  Future<void> submitPassword(String password);

  /// Deletes the current session.
  Future<void> deleteSession();

  /// Creates a new application password.
  Future<AppPasswordResponse> createApplicationPassword();

  /// Deletes a session by ID.
  Future<void> deleteSessionById(String id);

  /// Retrieves a list of all current sessions.
  Future<SessionListResponse> getAllSessions();

  /// Suggests new TOTP credentials.
  Future<void> suggestTotpCredentials();
}
