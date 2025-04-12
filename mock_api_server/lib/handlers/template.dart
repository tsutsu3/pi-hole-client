import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class XxxxHandler {
  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      final mockResponse = {};

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
