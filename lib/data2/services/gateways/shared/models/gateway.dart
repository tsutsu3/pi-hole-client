import 'package:pi_hole_client/data2/services/gateways/v6/models/network/gateway.dart';
import 'package:pi_hole_client/data2/services/gateways/v6/models/network/interfaces.dart';
import 'package:pi_hole_client/data2/services/gateways/v6/models/network/routes.dart';

class GatewayInfo {
  GatewayInfo({
    required this.gateway,
    this.interfaces,
    this.routes,
  });

  factory GatewayInfo.fromV6(Gateway gateway) {
    return GatewayInfo(
      gateway: gateway.gateway,
      interfaces: gateway.interfaces,
      routes: gateway.routes,
    );
  }

  final List<GatewayData> gateway;
  final List<InterfaceData>? interfaces;
  final List<RouteData>? routes;

  Map<String, dynamic> toJson() {
    return {
      'gateway': gateway.map((e) => e.toJson()).toList(),
      'interfaces': interfaces?.map((e) => e.toJson()).toList(),
      'routes': routes?.map((e) => e.toJson()).toList(),
    };
  }
}
