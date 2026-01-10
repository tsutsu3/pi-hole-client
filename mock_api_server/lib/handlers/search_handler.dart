import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class SearchHandler {
  Map<String, dynamic> _buildResponse() {
    return {
      "search": {
        "domains": [
          {
            "domain": "blockeddomain.com",
            "comment": "I needed to block this because of XYZ",
            "enabled": true,
            "type": "allow",
            "kind": "exact",
            "id": 7,
            "date_added": 1664624500,
            "date_modified": 1664624500,
            "groups": [0, 1, 2],
          },
        ],
        "gravity": [
          {
            "domain": "doubleclick.net",
            "address":
                "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
            "comment": "I needed to block this because of XYZ",
            "enabled": true,
            "id": 0,
            "type": "allow",
            "date_added": 1664624500,
            "date_modified": 1664624500,
            "date_updated": 1664624500,
            "number": 7,
            "invalid_domains": 0,
            "abp_entries": 0,
            "status": 1,
            "groups": [0, 1, 2],
          },
        ],
        "parameters": {
          "partial": false,
          "N": 20,
          "domain": "doubleclick.net",
          "debug": false,
        },
        "results": {
          "domains": {"exact": 1, "regex": 2},
          "gravity": {"allow": 0, "block": 1},
          "total": 4,
        },
      },
      "took": 0.003,
    };
  }

  Router get router {
    final router = Router();

    router.get('/<domain>', (Request request, String domain) {
      final response = _buildResponse();

      return Response.ok(
        jsonEncode(response),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
