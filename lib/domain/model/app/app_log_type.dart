/// What kind of problem an app log entry is about.
enum AppLogType {
  /// The app could not reach the server.
  connection,

  /// The server did not accept the password, token or TOTP code.
  auth,

  /// A Pi-hole v6 session could not be restored or renewed.
  session,

  /// Reading or writing the secure storage failed.
  storage,
}
