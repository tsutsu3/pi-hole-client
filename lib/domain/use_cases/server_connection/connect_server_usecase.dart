import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/server/server_auth.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/resolve_totp.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

/// How [ConnectServerUseCase.connect] sets up a v6 session.
enum SessionPolicy {
  /// New host or changed password. Always create a fresh session.
  forceNew,

  /// Try the existing session. Create a new one only on 401 / missing SID.
  reuseIfValid,
}

sealed class ConnectOutcome {
  const ConnectOutcome();
}

final class ConnectSuccess extends ConnectOutcome {
  const ConnectSuccess(this.blocking, {required this.sessionCreated});

  final Blocking blocking;

  /// Whether this call created a new session on the server.
  final bool sessionCreated;
}

/// The user dismissed the TOTP prompt.
final class ConnectCancelled extends ConnectOutcome {
  const ConnectCancelled();
}

final class ConnectFailed extends ConnectOutcome {
  const ConnectFailed(this.error, {required this.sessionCreated});

  final Exception error;

  /// Whether this call created a new session before it failed.
  final bool sessionCreated;
}

/// Sets up the session for a server and checks its blocking status.
///
/// Holds the session rules shared by the connect flow and the add / edit
/// server flow.
class ConnectServerUseCase {
  ConnectServerUseCase({
    required AuthRepository auth,
    required DnsRepository dns,
  }) : _auth = auth,
       _dns = dns;

  final AuthRepository _auth;
  final DnsRepository _dns;

  Future<ConnectOutcome> connect({
    required ServerAuth auth,
    required SessionPolicy policy,
    required ResolveTotp resolveTotp,
  }) async {
    switch ((auth, policy)) {
      // v5 uses a token, so there is no session.
      // Passwordless v6, keeping the current state.
      case (TokenAuth(), _):
      case (NoAuth(), SessionPolicy.reuseIfValid):
        return _fetchStatus(sessionCreated: false);

      // Passwordless v6, new host.
      case (NoAuth(), SessionPolicy.forceNew):
        return _login('', resolveTotp);

      // New host or changed password. Always create a new session.
      case (PasswordAuth(:final password), SessionPolicy.forceNew):
        return _login(password, resolveTotp);

      // Same host and password. Use the current session if it still works.
      case (PasswordAuth(:final password), SessionPolicy.reuseIfValid):
        final preCheck = await _dns.fetchBlockingStatus(skipRenewal: true);
        if (preCheck.isSuccess()) {
          return ConnectSuccess(preCheck.getOrThrow(), sessionCreated: false);
        }

        // Log in again only on 401 / missing SID. A new session on a
        // transient error (503/504/timeout) not created a new session.
        final error = preCheck.exceptionOrNull()!;
        if (!isReauthRequired(error)) {
          return ConnectFailed(error, sessionCreated: false);
        }

        return _login(password, resolveTotp);
    }
  }

  /// Login, then checks the status.
  ///
  /// The first login sends only the password.
  /// When the server needs 2FA, it returns [TotpRequiredException].
  /// Then [resolveTotp] asks the user for a code, and the login is tried again with the code.
  /// A wrong or reused code asks the user again. Any other error stops the login.
  Future<ConnectOutcome> _login(
    String password,
    ResolveTotp resolveTotp,
  ) async {
    var result = await _auth.createSession(password);
    if (result.exceptionOrNull() is TotpRequiredException) {
      TotpPromptError? promptError;
      do {
        final code = await resolveTotp(error: promptError);
        if (code == null) return const ConnectCancelled();

        result = await _auth.createSession(password, totp: code);
        promptError = switch (result.exceptionOrNull()) {
          TotpInvalidException() => TotpPromptError.invalid,
          TotpReusedException() => TotpPromptError.reused,
          _ => null,
        };
      } while (promptError != null);
    }

    final error = result.exceptionOrNull();
    if (error != null) return ConnectFailed(error, sessionCreated: false);

    return _fetchStatus(sessionCreated: true);
  }

  /// skipRenewal is true right after a login so a retry can't create a
  /// second session. Transient errors are still retried.
  Future<ConnectOutcome> _fetchStatus({required bool sessionCreated}) async {
    final result = await _dns.fetchBlockingStatus(skipRenewal: sessionCreated);

    return result.fold(
      (blocking) => ConnectSuccess(blocking, sessionCreated: sessionCreated),
      (error) => ConnectFailed(error, sessionCreated: sessionCreated),
    );
  }
}
