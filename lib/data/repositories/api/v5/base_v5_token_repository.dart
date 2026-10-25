import 'dart:async';

import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

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
       _givenToken = token;

  final SessionCredentialService _creds;

  /// The token passed to the constructor. Used instead of the stored token.
  final String? _givenToken;

  String? _token;
  Future<String>? _loadingToken;

  /// Retrieves the current V5 token, fetching it from the credential service if necessary.
  ///
  /// This method implements caching and request deduplication:
  /// - If a token was passed to the constructor, it is always returned.
  /// - If a token is already cached in [_token], it is returned immediately.
  /// - If a token retrieval is already in progress, the same pending [Future] stored in
  ///   [_loadingToken] is returned to avoid duplicate requests.
  /// - Otherwise, a new request is made to [_creds] to obtain the token.
  Future<String> getToken() async {
    if (_givenToken != null) return _givenToken;
    if (_token != null) return _token!;
    if (_loadingToken != null) return _loadingToken!;

    final c = Completer<String>();
    _loadingToken = c.future;
    c.future.ignore();

    try {
      final r = await _creds.token;
      if (r.isError()) {
        throw TokenNotFoundException('Token not found: ${r.exceptionOrNull()}');
      }
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

  /// Clears the cached V5 token. A token passed to the constructor is kept.
  Future<void> clearToken() async {
    _token = null;
  }
}
