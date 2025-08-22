import 'dart:convert';
import 'dart:io';
import 'package:mock_api_server/handlers/action_handler.dart';
import 'package:mock_api_server/handlers/config_handler.dart';
import 'package:mock_api_server/handlers/dns_handler.dart';
import 'package:mock_api_server/handlers/domains_handler.dart';
import 'package:mock_api_server/handlers/groups_handler.dart';
import 'package:mock_api_server/handlers/history_handler.dart';
import 'package:mock_api_server/handlers/info_handler.dart';
import 'package:mock_api_server/handlers/lists_handler.dart';
import 'package:mock_api_server/handlers/network_handler.dart';
import 'package:mock_api_server/handlers/pihole_v5_handler.dart';
import 'package:mock_api_server/handlers/queries_handler.dart';
import 'package:mock_api_server/handlers/stats_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'package:mock_api_server/handlers/auth_handler.dart';

Middleware sleepMiddleware({
  Duration delay = const Duration(milliseconds: 500),
}) {
  return (Handler innerHandler) {
    return (Request request) async {
      await Future.delayed(delay);
      return await innerHandler(request);
    };
  };
}

Middleware setCookieAlways() {
  return (Handler inner) {
    return (Request req) async {
      final res = await inner(req);

      final newHeaders = Map<String, String>.from(res.headers)
        ..['set-cookie'] =
            'PHPSESSID=xxxxxxxxx; Path=/; HttpOnly; SameSite=Strict';

      return res.change(headers: newHeaders);
    };
  };
}

Middleware requireFTLToken() {
  return (Handler innerHandler) {
    return (Request request) async {
      // exclude all v6 apis
      final path = request.url.path;
      if (!path.startsWith('admin')) {
        return innerHandler(request);
      }

      final protectedPrefixes = ['admin'];

      final needsAuth = protectedPrefixes.any(
        (prefix) => path.startsWith(prefix),
      );

      if (needsAuth) {
        final qp = request.url.queryParameters;
        if (!qp.containsKey('auth')) {
          return Response.ok(jsonEncode([]));
        }
      }

      return innerHandler(request);
    };
  };
}

Middleware requireFTLSid() {
  return (Handler innerHandler) {
    return (Request request) async {
      // exclude v5 api and v6 POST /api/auth/
      final path = request.url.path;
      if (path.startsWith('admin') ||
          (path.startsWith('api/auth') && request.method == 'POST')) {
        return innerHandler(request);
      }

      final protectedPrefixes = [
        'api/auth',
        'api/action',
        'api/dns',
        'api/domains',
        'api/groups',
        'api/history',
        'api/info',
        'api/lists',
        'api/queries',
        'api/stats',
        'api/network',
        'api/config',
      ];

      final needsAuth = protectedPrefixes.any(
        (prefix) => path.startsWith(prefix),
      );

      if (needsAuth) {
        final sid = request.headers['X-FTL-SID'];
        if (sid == null || sid.isEmpty) {
          return Response.unauthorized(
            jsonEncode({
              'error': {
                'key': 'unauthorized',
                'message': 'Unauthorized',
                'hint': null,
              },
              'took': 0.001,
            }),
            headers: {'content-type': 'application/json'},
          );
        }
      }

      return innerHandler(request);
    };
  };
}

void main(List<String> args) async {
  var delayMs = 500;
  var host = 'localhost';

  final delayArgIndex = args.indexOf('--delay');
  if (delayArgIndex != -1 && delayArgIndex + 1 < args.length) {
    final value = int.tryParse(args[delayArgIndex + 1]);
    if (value != null && value >= 0) {
      delayMs = value;
    }
  }

  final hostArgIndex = args.indexOf('--host');
  if (hostArgIndex != -1 && hostArgIndex + 1 < args.length) {
    host = args[hostArgIndex + 1];
  }

  final router = Router();

  // v5 api
  router.mount('/admin', PiholeV5Handler().router.call);

  // v6 api
  router.mount('/api/auth', AuthHandler().router.call);
  router.mount('/api/action', ActionHandler().router.call);
  router.mount('/api/dns', DnsHandler().router.call);
  router.mount('/api/domains', DomainsHandler().router.call);
  router.mount('/api/groups', GroupsHandler().router.call);
  router.mount('/api/history', HistoryHandler().router.call);
  router.mount('/api/info', InfoHandler().router.call);
  router.mount('/api/lists', ListsHandler().router.call);
  router.mount('/api/queries', QueriesHandler().router.call);
  router.mount('/api/stats', StatsHandler().router.call);
  router.mount('/api/network', NetworkHandler().router.call);
  router.mount('/api/config', ConfigHandler().router.call);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(setCookieAlways())
      .addMiddleware(requireFTLToken())
      .addMiddleware(requireFTLSid())
      .addMiddleware(sleepMiddleware(delay: Duration(milliseconds: delayMs)))
      .addHandler(router.call);

  final address =
      (host == '0.0.0.0')
          ? InternetAddress.anyIPv4
          : InternetAddress.loopbackIPv4;

  final server = await io.serve(handler, address, 8888);

  print('✅ Mock API server running at http://$host:${server.port}');
}
