import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class GroupsHandler {
  Map<String, dynamic> _buildGroupsResponse() {
    return {
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
          "enabled": false,
          "id": 5,
          "date_added": 1727635552,
          "date_modified": 1730985973,
        },
      ],
      "took": 0.0005083084106445312,
    };
  }

  Map<String, dynamic> _buildGroupResponse(String name) {
    final response = _buildGroupsResponse();
    final groups = response["groups"] as List<dynamic>;
    final match = groups.firstWhere(
      (g) => g["name"] == name,
      orElse: () => null,
    );
    return {
      "groups": match != null ? [match] : [],
      "took": response["took"],
    };
  }

  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      return Response.ok(
        jsonEncode(_buildGroupsResponse()),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/<name>', (Request request, String name) {
      return Response.ok(
        jsonEncode(_buildGroupResponse(name)),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.post('/', (Request request) async {
      final response = _buildGroupsResponse();
      response["processed"] = {
        "success": [
          {"item": "New group"},
        ],
        "errors": [],
      };
      return Response(
        201,
        body: jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.put('/<name>', (Request request, String name) async {
      final response = _buildGroupResponse(name);
      response["processed"] = {
        "success": [
          {"item": name},
        ],
        "errors": [],
      };
      return Response.ok(
        jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.delete('/<name>', (Request request, String name) {
      return Response(204);
    });

    return router;
  }
}
