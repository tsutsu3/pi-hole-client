import 'package:pi_hole_client/data/mapper/v6/auth_mapper.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';

/// Shared session manager for all v6 repositories scoped to the same server.
///
/// One instance is created per server in `RepositoryBundleFactory` and
/// injected into every v6 repository via `BaseV6SidRepository`. This ensures:
/// - A single in-memory SID cache shared across all repositories.
/// - Concurrent [getSid] calls share one pending storage read.
/// - Concurrent [clearAndRenewSid] calls trigger exactly one re-authentication.
class V6SessionCache {
  V6SessionCache({
    required SessionCredentialService creds,
    required PiholeV6ApiClient client,
  }) : _creds = creds,
       _client = client;

  final SessionCredentialService _creds;
  final PiholeV6ApiClient _client;

  String? _sid;
  Future<String>? _pendingLoad;
  Future<void>? _pendingRenewal;

  String get serverAddress => _creds.address;

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Returns the cached SID, loading from storage on a cache miss.
  /// Concurrent calls share one in-flight [Future].
  Future<String> getSid() => _getOrLoad(() async {
    final r = await _creds.sid;
    if (r.isError()) throw SidNotFoundException();
    final sid = r.getOrThrow();
    await WidgetChannel.sendSidUpdated(serverAddress: serverAddress, sid: sid);
    return sid;
  });

  /// Saves [sid] to the shared cache and persists it to secure storage.
  Future<void> saveSid(String sid) async {
    _set(sid);
    await _creds.saveSid(sid);
  }

  /// Clears the shared SID cache.
  void clearSid() => _clear();

  /// Clears the cache and triggers session renewal, deduplicating concurrent
  /// calls so that only one re-authentication request is made.
  Future<void> clearAndRenewSid() async {
    try {
      await _renewOnce();
    } catch (e) {
      logger.w('[V6SessionCache] Session renewal failed: $e');
      await WidgetChannel.sendSidInvalidated(serverAddress: _creds.address);
    }
  }

  // ---------------------------------------------------------------------------
  // Private cache internals
  // ---------------------------------------------------------------------------

  Future<String> _getOrLoad(Future<String> Function() loader) async {
    if (_sid != null) return _sid!;
    if (_pendingLoad != null) return _pendingLoad!;

    // Share the same Future across concurrent callers.
    // Using .then to update _sid avoids unhandled-error issues that arise
    // when a separate Completer future has no listener.
    final pending = loader().then((sid) {
      _sid = sid;
      return sid;
    });
    _pendingLoad = pending;

    try {
      return await pending;
    } finally {
      _pendingLoad = null;
    }
  }

  void _set(String sid) {
    _sid = sid;
  }

  void _clear() {
    _sid = null;
  }

  Future<void> _renew() async {
    final pw = (await _creds.password).getOrNull() ?? '';
    if (pw.isEmpty) {
      throw Exception('Cannot renew session: no password configured');
    }
    // Purge the stale SID from storage before POST /api/auth.
    // If postAuth succeeds, saveSid() restores it.
    // If postAuth fails (e.g. HTTPS response lost after Pi-hole creates the session),
    // storage stays empty → next getSid() throws SidNotFoundException → no retry loop.
    final deleteResult = await _creds.deleteSid();
    if (deleteResult.isError()) {
      logger.w(
        '[V6SessionCache] Failed to purge stale SID: ${deleteResult.exceptionOrNull()}',
      );
    }
    final result = await _client.postAuth(password: pw);
    final auth = result.getOrThrow().toDomain();
    if (!auth.valid) throw Exception('Session renewal failed');
    await saveSid(auth.sid);
    await WidgetChannel.sendSidUpdated(
      serverAddress: serverAddress,
      sid: auth.sid,
    );
  }

  Future<void> _renewOnce() async {
    if (_pendingRenewal != null) return _pendingRenewal!;

    logger.d('[V6SessionCache] Session expired, attempting renewal...');
    _clear();

    // Share the same Future so concurrent callers all wait for the same renewal.
    final pending = _renew();
    _pendingRenewal = pending;

    try {
      await pending;
      logger.d('[V6SessionCache] Session renewed successfully.');
    } finally {
      _pendingRenewal = null;
    }
  }
}
