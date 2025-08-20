import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class PiholeV5Handler {
  Router get router {
    final router = Router();

    router.get('/api.php', (Request req) {
      final qp = req.url.queryParameters;

      // ------ enable / disable ------
      if (qp.containsKey('enable')) {
        // e.g. enable, enable=0
        final seconds = qp['enable'];
        return Response.ok(
          jsonEncode({
            'enable': seconds == null ? 'indefinite' : 'for_$seconds',
          }),
        );
      }
      if (qp.containsKey('disable')) {
        // e.g. disable=5
        final seconds = qp['disable'];
        return Response.ok(
          jsonEncode({
            'disable': seconds == null ? 'indefinite' : 'for_$seconds',
          }),
        );
      }

      // ------ summaryRaw only ------
      if (qp.containsKey('summaryRaw') &&
          !qp.containsKey('topItems') &&
          !qp.containsKey('getForwardDestinations') &&
          !qp.containsKey('getQuerySources') &&
          !qp.containsKey('topClientsBlocked') &&
          !qp.containsKey('getQueryTypes')) {
        // http://example.com/admin/api.php?auth=xxx123&summaryRaw
        return Response.ok(jsonEncode({'summaryRaw': 'dummy'}));
      }

      // ------ summaryRaw + combined flags ------
      if (qp.containsKey('summaryRaw') &&
          (qp.containsKey('topItems') ||
              qp.containsKey('getForwardDestinations') ||
              qp.containsKey('getQuerySources') ||
              qp.containsKey('topClientsBlocked') ||
              qp.containsKey('getQueryTypes'))) {
        // http://example.com/admin/api.php?auth=xxx123&summaryRaw&topItems&...
        return Response.ok(jsonEncode({'summaryRaw_combined': 'dummy'}));
      }

      // ------ overTime + clients + names ------
      if (qp.containsKey('overTimeData10mins') ||
          qp.containsKey('overTimeDataClients') ||
          qp.containsKey('getClientNames')) {
        // http://example.com/admin/api.php?auth=xxx123&overTimeData10mins&overTimeDataClients&getClientNames
        return Response.ok(jsonEncode({'overtime_clients_names': 'dummy'}));
      }

      // ------ getAllQueries (with from/until) ------
      if (qp.containsKey('getAllQueries')) {
        // http://example.com/admin/api.php?auth=xxx123&getAllQueries=&from=...&until=...
        final from = qp['from'];
        final until = qp['until'];
        return Response.ok(
          jsonEncode({
            'getAllQueries': 'dummy',
            if (from != null) 'from': from,
            if (until != null) 'until': until,
          }),
        );
      }

      // ------ list operations ------
      if (qp.containsKey('list')) {
        // e.g.
        //   ?list=white
        //   ?list=white&sub=google.com
        //   ?list=black&add=google.com
        final list = qp['list']; // white | regex_white | black | regex_black
        final add = qp['add'];
        final sub = qp['sub'];
        return Response.ok(
          jsonEncode({
            'list': list,
            if (add != null) 'add': add,
            if (sub != null) 'sub': sub,
            'result': 'dummy',
          }),
        );
      }

      // ------ versions ------
      if (qp.containsKey('versions')) {
        // http://example.com/admin/api.php?auth=xxx123&versions
        return Response.ok(jsonEncode({'versions': 'dummy'}));
      }

      // ------ default fallback ------
      return Response.ok(jsonEncode({'message': 'unknown request'}));
    });

    return router;
  }
}
