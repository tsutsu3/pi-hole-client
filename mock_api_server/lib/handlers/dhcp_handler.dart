import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class DhcpHandler {
  static const _leases = [
    {
      'expires': 1894112391,
      'name': 'laptop',
      'hwaddr': 'AA:BB:CC:DD:EE:01',
      'ip': '192.168.1.100',
      'clientid': '01:AA:BB:CC:DD:EE:01',
    },
    {
      'expires': 1750003600,
      'name': 'phone',
      'hwaddr': 'AA:BB:CC:DD:EE:02',
      'ip': '192.168.1.101',
      'clientid': '01:AA:BB:CC:DD:EE:02',
    },
  ];

  Router get router {
    final router = Router();

    router.get('/leases', (Request request) {
      final mockResponse = {'leases': _leases, 'took': 0.001};

      return Response.ok(
        jsonEncode(mockResponse),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.delete('/leases/<ip>', (Request request, String ip) {
      final found = _leases.any((lease) => lease['ip'] == ip);
      if (!found) {
        return Response.notFound(
          jsonEncode({
            'error': {'message': 'Lease not found'},
          }),
          headers: {'Content-Type': 'application/json'},
        );
      }

      return Response(204);
    });

    return router;
  }
}
