import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ConfigHandler {
  Router get router {
    final router = Router();

    router.get('/<elem|.*>', (Request request, String elem) async {
      final decoded = Uri.decodeComponent(elem);
      if (decoded == 'dns/queryLogging') {
        return Response.ok(
          jsonEncode({
            'config': {
              'dns': {'queryLogging': true},
            },
            'took': 0.003,
          }),
          headers: {'Content-Type': 'application/json'},
        );
      }

      if (decoded == 'dns/hosts') {
        return Response.ok(
          jsonEncode({
            "config": {
              "dns": {
                "hosts": [
                  "192.168.1.3 Tablet01",
                  "192.168.1.5 FireHD",
                  "192.168.1.14 Alexa",
                  "192.168.1.21 Laptop01",
                ],
              },
            },
            "took": 0.0000934600830078125,
          }),
          headers: {'Content-Type': 'application/json'},
        );
      }

      return Response.ok(
        jsonEncode({'config': {}, 'took': 0.003}),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.patch('/', (Request request) async {
      final body = await request.readAsString();
      final data = jsonDecode(body);
      final response = {'config': data['config'] ?? {}, 'took': 0.003};

      return Response.ok(
        jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
