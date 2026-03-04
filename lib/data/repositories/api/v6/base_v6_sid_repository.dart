import 'dart:async';

import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';

/// An abstract base class that manages retrieval and caching of a V5 token
/// using a [SessionCredentialService].
///
/// This repository provides a common mechanism to:
/// - Retrieve a token from the provided [SessionCredentialService]
/// - Cache the token for subsequent calls to avoid redundant network requests
/// - Prevent concurrent token requests by sharing the same pending [Future]
/// - Clear the cached token to force a refresh on the nex
abstract class BaseV6SidRepository {
  BaseV6SidRepository({required SessionCredentialService creds, String? sid})
    : _creds = creds,
      _sid = sid;

  final SessionCredentialService _creds;

  /// The server address this repository is scoped to.
  String get serverAddress => _creds.address;

  String? _sid;
  Future<String>? _loadingSid;

  /// Retrieves the current V6 SID, fetching it from the credential service if necessary.
  ///
  /// This method implements caching and request deduplication:
  /// - If a SID is already cached in [_sid], it is returned immediately.
  /// - If a SID retrieval is already in progress, the same pending [Future] stored in
  ///   [_loadingSid] is returned to avoid duplicate requests.
  /// - Otherwise, a new request is made to [_creds] to obtain the SID.
  Future<String> getSid() async {
    if (_sid != null) return _sid!;
    if (_loadingSid != null) return _loadingSid!;

    final c = Completer<String>();
    _loadingSid = c.future;
    try {
      final r = await _creds.sid;
      if (r.isError()) throw SidNotFoundException();
      _sid = r.getOrThrow();
      c.complete(_sid!);
      // Notify the home widget that a valid SID is available.
      // This covers the case where the app reconnects using a cached SID
      // (createSession is skipped), preventing a permanent AUTH_REQUIRED state.
      await WidgetChannel.sendSidUpdated(
        serverAddress: serverAddress,
        sid: _sid!,
      );
      return _sid!;
    } catch (e) {
      c.completeError(e);
      rethrow;
    } finally {
      _loadingSid = null;
    }
  }

  /// Saves a new SID to secure storage and updates the in-memory cache.
  Future<void> saveSid(String sid) async {
    _sid = sid;
    await _creds.saveSid(sid);
  }

  /// Clears the cached V6 SID.
  Future<void> clearSid() async {
    _sid = null;
  }

  /// Clears the cached SID and triggers session renewal.
  ///
  /// Used as the `onRetry` callback in repositories so that an expired or
  /// invalid session causes automatic re-authentication before the next
  /// attempt. Renewal errors are silently swallowed so the calling retry
  /// loop can surface the original failure instead.
  Future<void> clearAndRenewSid() async {
    _sid = null;
    logger.d('[$runtimeType] Session expired, attempting renewal...');
    try {
      await _creds.renewSession();
      logger.d('[$runtimeType] Session renewed successfully.');
    } catch (e) {
      logger.w('[$runtimeType] Session renewal failed: $e');
      await WidgetChannel.sendSidInvalidated(serverAddress: _creds.address);
    }
  }
}
