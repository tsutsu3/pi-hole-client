import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ConfigHandler {
  Router get router {
    final router = Router();

    router.get('/<elem|dns/queryLogging>', (
      Request request,
      String elem,
    ) async {
      final mockResponses = {
        'dns/queryLogging': {
          'config': {
            'dns': {'queryLogging': true},
          },
          'took': 0.003,
        },
        '': {'config': {}, 'took': 0.003},
      };

      return Response.ok(
        jsonEncode(mockResponses[elem] ?? mockResponses['']),
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
