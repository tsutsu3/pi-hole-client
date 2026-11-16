import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache.dart';
import 'package:pi_hole_client/data/repositories/api/v6/v6_session_cache_store.dart';

/// Decides whether automatic paths (auto refresh, app resume) may show the
/// TOTP prompt for a server.
///
/// The state lives in the server's [V6SessionCache]. A server with no cache
/// has no state, so the methods do nothing for it.
class TotpPromptGuard {
  TotpPromptGuard(this._store);

  final V6SessionCacheStore _store;

  /// Whether the user cancelled the TOTP prompt for [address].
  bool isDeclined(String address) =>
      _store.find(address)?.reauthState == ReauthState.declined;

  /// Records that the user cancelled the TOTP prompt for [address].
  void decline(String address) => _store.find(address)?.declineReauth();

  /// Lets the TOTP prompt show again for [address]. Call it when the user
  /// asks for a refresh.
  void allowPrompt(String address) => _store.find(address)?.allowReauthPrompt();

  /// Removes the cancelled mark for [address].
  // A cancelled mark means the server still needs a TOTP code, so the cache
  // goes back to totpRequired, the same as [allowPrompt].
  void clear(String address) => _store.find(address)?.allowReauthPrompt();
}
