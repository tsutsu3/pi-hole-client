import 'package:pi_hole_client/data2/services/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/data2/services/gateways/shared/models/server.dart';
import 'package:pi_hole_client/data2/services/gateways/v5/api_gateway_v5.dart';
import 'package:pi_hole_client/data2/services/gateways/v6/api_gateway_v6.dart';

class ApiGatewayFactory {
  static ApiGateway create(Server server) {
    final version = server.apiVersion;
    if (version == 'v5') {
      return ApiGatewayV5(server);
    } else if (version == 'v6') {
      return ApiGatewayV6(server);
    } else {
      throw Exception('Unsupported server version: $version');
    }
  }
}
