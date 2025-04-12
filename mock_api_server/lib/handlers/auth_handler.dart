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

    return router;
  }
}
