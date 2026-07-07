import 'dart:convert';
import 'dart:io';

/// Minimal in-process Pi-hole **v6** API stand-in, for state-transition tests
/// (TOTP flows, session lifecycle) that are impractical to drive
/// deterministically against a real Pi-hole.
///
/// This is **not** a faithful API reimplementation — see
/// `integration_test/COVERAGE.md`'s "Fake server" notes. It only implements
/// what `postAuth`/`getAuth`/`deleteAuth` and the blocking-status probe used
/// during connect need: `POST/GET/DELETE /api/auth` and `GET/POST
/// /api/dns/blocking`. Everything else responds `200 {}` so unimplemented
/// polling (stats, over-time data, metrics) doesn't hang or crash the app.
///
/// One instance == one fake Pi-hole == one session at a time. Configure the
/// scenario via the public fields *before* driving the app, then call
/// [start] and point `RepositoryBundleFactory`/the UI at the returned URL.
class FakePiholeServer {
  FakePiholeServer({this.password = 'fake-pw'});

  /// The password `POST /api/auth` must match to succeed.
  String password;

  /// When true, a correct password alone isn't enough — the request must
  /// also include a `totp` matching [totpCode].
  bool totpRequired = false;

  /// The accepted TOTP code while [totpRequired] is true.
  int totpCode = 123456;

  /// When true, the *next* `POST /api/auth` that would otherwise succeed (or
  /// fail on an invalid code) instead returns 429 rate-limiting once, then
  /// this resets itself to false.
  bool rateLimitNextAuth = false;

  bool blockingEnabled = true;

  /// When true, the *next* `GET /api/dns/blocking` returns 503 once (even
  /// with a valid sid), then this resets itself to false. Used to force a
  /// post-login connection check to fail.
  bool failNextBlockingCheck = false;

  String? _sid;
  int _sidCounter = 0;
  final Set<int> _usedTotpCodes = {};

  HttpServer? _server;

  /// Starts listening on an OS-assigned loopback port and returns the base
  /// URL (e.g. `http://127.0.0.1:54321`) to register as a server's address.
  Future<String> start() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    _server = server;
    server.listen(_handle);
    return 'http://127.0.0.1:${server.port}';
  }

  Future<void> close() async {
    await _server?.close(force: true);
  }

  /// The current live session id, if any (null after a delete or before the
  /// first successful auth). Tests can read this to assert against
  /// `AppHarness.sidOf(address)` (the app's locally *stored* copy) staying in
  /// sync with what this fake server considers valid.
  String? get currentSid => _sid;

  /// Simulates the current session expiring server-side (e.g. a Pi-hole
  /// restart) — the next request presenting the old sid is rejected as
  /// invalid, forcing the app to re-authenticate.
  void invalidateSession() => _sid = null;

  /// Marks [code] as already consumed, so a subsequent `POST /api/auth` with
  /// this code is rejected as "Reused 2FA token" even if it matches
  /// [totpCode] — simulates the code having been used elsewhere already.
  void markTotpCodeUsed(int code) => _usedTotpCodes.add(code);

  Future<void> _handle(HttpRequest request) async {
    try {
      final path = request.uri.path;
      final sid = request.headers.value('X-FTL-SID');
      final body = await utf8.decoder.bind(request).join();

      switch ((request.method, path)) {
        case ('POST', '/api/auth'):
          await _postAuth(request, body);
        case ('GET', '/api/auth'):
          await _getAuth(request, sid);
        case ('DELETE', '/api/auth'):
          await _deleteAuth(request, sid);
        case ('GET', '/api/dns/blocking'):
          await _getBlocking(request, sid);
        case ('POST', '/api/dns/blocking'):
          await _postBlocking(request, body, sid);
        default:
          // Not a faithful re-implementation of every v6 endpoint
          if (sid == null || sid != _sid) {
            await _respond(request, 401, {
              'error': {'key': 'unauthorized', 'message': 'Invalid session'},
            });
          } else {
            await _respond(request, 200, {});
          }
      }
    } catch (e) {
      await _respond(request, 500, {
        'error': {'key': 'internal', 'message': '$e'},
      });
    }
  }

  Future<void> _postAuth(HttpRequest request, String body) async {
    final json = body.isEmpty
        ? <String, dynamic>{}
        : jsonDecode(body) as Map<String, dynamic>;
    final suppliedPassword = json['password'] as String?;
    final suppliedTotp = json['totp'] as int?;

    if (suppliedPassword != password) {
      await _respond(request, 401, {
        'error': {'key': 'unauthorized', 'message': 'Invalid password'},
      });
      return;
    }

    if (totpRequired) {
      if (suppliedTotp == null) {
        await _respond(request, 400, {
          'error': {
            'key': 'bad_request',
            'message': 'No 2FA token found in JSON payload (2FA token)',
          },
        });
        return;
      }
      if (rateLimitNextAuth) {
        rateLimitNextAuth = false;
        await _respond(request, 429, {
          'error': {
            'key': 'rate_limiting',
            'message':
                'Rate limiting 2FA token requests, try again later (2FA token)',
          },
        });
        return;
      }
      if (_usedTotpCodes.contains(suppliedTotp)) {
        await _respond(request, 401, {
          'error': {'key': 'unauthorized', 'message': 'Reused 2FA token'},
        });
        return;
      }
      if (suppliedTotp != totpCode) {
        await _respond(request, 401, {
          'error': {'key': 'unauthorized', 'message': 'Invalid 2FA token'},
        });
        return;
      }
      _usedTotpCodes.add(suppliedTotp);
    }

    _sidCounter++;
    _sid = 'fake-sid-$_sidCounter';
    await _respond(request, 200, _sessionJson(valid: true, sid: _sid));
  }

  Future<void> _getAuth(HttpRequest request, String? sid) async {
    final valid = sid != null && sid == _sid;
    await _respond(
      request,
      200,
      _sessionJson(valid: valid, sid: valid ? sid : ''),
    );
  }

  Future<void> _deleteAuth(HttpRequest request, String? sid) async {
    if (sid != null && sid == _sid) {
      _sid = null;
      request.response.statusCode = 204;
      await request.response.close();
      return;
    }
    await _respond(request, 401, {
      'error': {'key': 'unauthorized', 'message': 'Invalid session'},
    });
  }

  Future<void> _getBlocking(HttpRequest request, String? sid) async {
    if (sid == null || sid != _sid) {
      await _respond(request, 401, {
        'error': {'key': 'unauthorized', 'message': 'Invalid session'},
      });
      return;
    }
    if (failNextBlockingCheck) {
      failNextBlockingCheck = false;
      await _respond(request, 503, {
        'error': {'key': 'unavailable', 'message': 'Service unavailable'},
      });
      return;
    }
    await _respond(request, 200, _blockingJson());
  }

  Future<void> _postBlocking(
    HttpRequest request,
    String body,
    String? sid,
  ) async {
    if (sid == null || sid != _sid) {
      await _respond(request, 401, {
        'error': {'key': 'unauthorized', 'message': 'Invalid session'},
      });
      return;
    }
    final json = body.isEmpty
        ? <String, dynamic>{}
        : jsonDecode(body) as Map<String, dynamic>;
    final enabled = json['blocking'] as bool?;
    if (enabled != null) blockingEnabled = enabled;
    await _respond(request, 200, _blockingJson());
  }

  Map<String, dynamic> _sessionJson({required bool valid, String? sid}) => {
    'session': {
      'valid': valid,
      'totp': totpRequired,
      'sid': sid ?? '',
      'csrf': 'fake-csrf',
      'validity': 1800,
      'message': valid ? 'session valid' : 'session invalid',
    },
    'took': 0.001,
  };

  Map<String, dynamic> _blockingJson() => {
    'blocking': blockingEnabled ? 'enabled' : 'disabled',
    'timer': null,
    'took': 0.001,
  };

  Future<void> _respond(
    HttpRequest request,
    int statusCode,
    Map<String, dynamic> json,
  ) async {
    request.response.statusCode = statusCode;
    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode(json));
    await request.response.close();
  }
}
