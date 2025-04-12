import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class DnsHandler {
  Router get router {
    final router = Router();

    router.get('/blocking', (Request request) {
      final mockResponse = {
        "blocking": "enabled",
        "timer": null,
        "took": 0.00003838539123535156,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
