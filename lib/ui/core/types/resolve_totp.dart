/// Why the TOTP prompt is being shown again after a rejected code.
enum TotpPromptError {
  /// The code was wrong (server: `Invalid 2FA token`).
  invalid,

  /// The code was correct but already used; the user must wait for a new one
  /// (server: `Reused 2FA token`).
  reused,
}

/// Prompts the user for a 6-digit TOTP (2FA) code, returning the entered code
/// or `null` when the user cancels.
///
/// [error] is set on a re-prompt after the server rejected a code, so the
/// dialog can show the right localized message. The dialog lives in the widget;
/// callers only decide what to do with the result.
typedef ResolveTotp = Future<String?> Function({TotpPromptError? error});
