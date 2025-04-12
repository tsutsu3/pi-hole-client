import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class GroupsHandler {
  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      final mockResponse = {
        "groups": [
          {
            "name": "Default",
            "comment": null,
            "enabled": true,
            "id": 0,
            "date_added": 1730985973,
            "date_modified": 1730985973,
          },
          {
            "name": "Advertising",
            "comment": null,
            "enabled": true,
            "id": 1,
            "date_added": 1727635517,
            "date_modified": 1730985973,
          },
          {
            "name": "Tracking",
            "comment": null,
            "enabled": true,
            "id": 2,
            "date_added": 1727635540,
            "date_modified": 1730985973,
          },
          {
            "name": "Malicious",
            "comment": null,
            "enabled": true,
            "id": 5,
            "date_added": 1727635552,
            "date_modified": 1730985973,
          },
        ],
        "took": 0.0005083084106445312,
      };

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
