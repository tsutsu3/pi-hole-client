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
/// - Clear the cached token to force a refresh on the next request
abstract class BaseV5TokenRepository {
  BaseV5TokenRepository({
    required SessionCredentialService creds,
    String? token,
  }) : _creds = creds,
       _token = token;

  final SessionCredentialService _creds;

  String? _token;
  Future<String>? _loadingToken;

  /// Retrieves the current V5 token, fetching it from the credential service if necessary.
  ///
  /// This method implements caching and request deduplication:
  /// - If a token is already cached in [_token], it is returned immediately.
  /// - If a token retrieval is already in progress, the same pending [Future] stored in
  ///   [_loadingToken] is returned to avoid duplicate requests.
  /// - Otherwise, a new request is made to [_creds] to obtain the token.
  Future<String> getToken() async {
    if (_token != null) return _token!;
    if (_loadingToken != null) return _loadingToken!;

    final c = Completer<String>();
    _loadingToken = c.future;
    try {
      final r = await _creds.token;
      if (r.isError()) throw TokenNotFoundException();
      _token = r.getOrThrow();
      c.complete(_token!);
      return _token!;
    } catch (e) {
      c.completeError(e);
      rethrow;
    } finally {
      _loadingToken = null;
    }
  }

  /// Clears the cached V5 token.
  Future<void> clearToken() async {
    _token = null;
  }
}
