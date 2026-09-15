import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';

/// Authentication configured for a Pi-hole server.
sealed class ServerAuth {
  const ServerAuth();

  factory ServerAuth.of(
    Server server,
    ({String password, String token}) credentials,
  ) {
    if (server.apiVersion == SupportedApiVersions.v6) {
      return V6ServerAuth.of(credentials.password);
    }

    return TokenAuth(credentials.token);
  }
}

/// Authentication variants supported by the Pi-hole v6 API.
sealed class V6ServerAuth extends ServerAuth {
  const V6ServerAuth();

  factory V6ServerAuth.of(String password) {
    return password.isEmpty ? const NoAuth() : PasswordAuth(password);
  }
}

/// A v6 server with no application password configured.
final class NoAuth extends V6ServerAuth {
  const NoAuth();
}

/// A v6 server authenticated with an application password.
final class PasswordAuth extends V6ServerAuth {
  const PasswordAuth(this.password);

  final String password;
}

/// A v5 server authenticated with an API token.
final class TokenAuth extends ServerAuth {
  const TokenAuth(this.token);

  final String token;
}
