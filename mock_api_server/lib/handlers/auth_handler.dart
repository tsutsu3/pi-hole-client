import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AuthHandler {
  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      final mockGetResponse = {
        "session": {
          "valid": true,
          "totp": false,
          "sid": "8SYYASjFxEpe1iRWK+F7Xg=",
          "csrf": "OaqbMi1kzVeXc+ASzd0kAw=",
          "validity": 1800,
          "message": "correct password",
        },
        "took": 0.000024557113647460938,
      };

      return Response.ok(
        jsonEncode(mockGetResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/', (Request request) async {
      final mockPostResponse = {
        "session": {
          "valid": true,
          "totp": false,
          "sid": "8SYYASjFxEpe1iRWK+F7Xg=",
          "csrf": "OaqbMi1kzVeXc+ASzd0kAw=",
          "validity": 1800,
          "message": "password incorrect",
        },
        "took": 0.0378272533416748,
      };

      return Response.ok(
        jsonEncode(mockPostResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.delete('/', (Request request) {
      return Response(204);
    });

    router.get('/sessions', (Request request) {
      final mockResponse = {
        'sessions': [
          {
            'id': 0,
            'current_session': false,
            'valid': false,
            'tls': {'login': false, 'mixed': false},
            'app': false,
            'cli': false,
            'login_at': 1580000000,
            'last_active': 1580000000,
            'valid_until': 1580000300,
            'remote_addr': '192.168.0.30',
            'user_agent': 'Dart/3.7 (dart:io)',
            'x_forwarded_for': null,
          },
          {
            'id': 1,
            'current_session': true,
            'valid': true,
            'tls': {'login': true, 'mixed': false},
            'app': false,
            'cli': false,
            'login_at': 1580000000,
            'last_active': 1580000000,
            'valid_until': 1580000300,
            'remote_addr': '192.168.0.31',
            'user_agent':
                'Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101 Firefox/107.0',
            'x_forwarded_for': null,
          },
          {
            'id': 3,
            'current_session': false,
            'valid': false,
            'tls': {'login': false, 'mixed': true},
            'app': true,
            'cli': true,
            'login_at': 1580000000,
            'last_active': 1580000000,
            'valid_until': 1580000300,
            'remote_addr': '192.168.0.32',
            'user_agent': 'Dart/3.7 (dart:io)',
            'x_forwarded_for': null,
          },
        ],
        'took': 0.003,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.delete('/session/<id>', (Request request, String id) {
      return Response(204);
    });

    return router;
  }
}
