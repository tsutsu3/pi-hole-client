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

void main(List<String> args) async {
  var delayMs = 500;
  final delayArgIndex = args.indexOf('--delay');
  if (delayArgIndex != -1 && delayArgIndex + 1 < args.length) {
    final value = int.tryParse(args[delayArgIndex + 1]);
    if (value != null && value >= 0) {
      delayMs = value;
    }
  }

  final router = Router();

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
      .addMiddleware(sleepMiddleware(delay: Duration(milliseconds: delayMs)))
      .addHandler(router.call);

  final server = await io.serve(handler, InternetAddress.anyIPv4, 8888);

  print('✅ Mock API server running at http://localhost:${server.port}');
}
