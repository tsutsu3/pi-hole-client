/// The password (v6) or token (v5) entered on the edit server screen.
sealed class SecretInput {
  const SecretInput(this.value);

  final String value;
}

/// The value already stored for the server.
final class UnchangedSecret extends SecretInput {
  const UnchangedSecret(super.value);
}

/// A value that is not stored yet. It is saved after the connection check.
final class NewSecret extends SecretInput {
  const NewSecret(super.value);
}
