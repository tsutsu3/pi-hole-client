import 'dart:async';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/local/session_credential_service.dart';

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
      return _sid!;
    } catch (e) {
      c.completeError(e);
      rethrow;
    } finally {
      _loadingSid = null;
    }
  }

  /// Clears the cached V6 SID.
  Future<void> clearSid() async {
    _sid = null;
  }
}
