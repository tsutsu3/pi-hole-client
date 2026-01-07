import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ClientsHandler {
  Map<String, dynamic> _buildClientsResponse() {
    return {
      'clients': [
        {
          'client': '127.0.0.1',
          'name': 'localhost',
          'comment': 'comment',
          'groups': [0],
          'id': 1,
          'date_added': 1604871899,
          'date_modified': 1604871899,
        },
        {
          'client': '00:11:22:33:44:66',
          'name': 'test-mac-device',
          'comment': null,
          'groups': [0],
          'id': 2,
          'date_added': 1611322675,
          'date_modified': 1611325497,
        },
      ],
      'took': 0.012,
      'processed': {
        'success': [
          {'item': '127.0.0.1'},
        ],
        'errors': [],
      },
    };
  }

  Map<String, dynamic> _buildClientResponse(String clientId) {
    final response = _buildClientsResponse();
    final clients = response["clients"] as List<dynamic>;
    final match = clients.firstWhere(
      (c) => c["client"] == clientId,
      orElse: () => null,
    );
    return {
      "clients": match != null ? [match] : [],
      "took": response["took"],
    };
  }

  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      return Response.ok(
        jsonEncode(_buildClientsResponse()),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/<client>', (Request request, String client) {
      return Response.ok(
        jsonEncode(_buildClientResponse(client)),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/', (Request request) async {
      final response = _buildClientsResponse();
      response["processed"] = {
        "success": [
          {"item": "127.0.0.1"},
        ],
        "errors": [],
      };
      return Response(
        201,
        body: jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.put('/<client>', (Request request, String client) async {
      final response = _buildClientResponse(client);
      response["processed"] = {
        "success": [
          {"item": client},
        ],
        "errors": [],
      };
      return Response.ok(
        jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.delete('/<client>', (Request request, String client) {
      return Response(204);
    });

    return router;
  }
}
