import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data/services/api/model/v6/network/interfaces.dart';
import 'package:pi_hole_client/data/services/api/model/v6/network/routes.dart';

part 'gateway.freezed.dart';
part 'gateway.g.dart';

@freezed
sealed class Gateway with _$Gateway {
  const factory Gateway({
    required List<GatewayData> gateway,
    required double took,
    List<InterfaceData>? interfaces,
    List<RouteData>? routes,
  }) = _Gateway;

  factory Gateway.fromJson(Map<String, dynamic> json) =>
      _$GatewayFromJson(json);
}

@freezed
sealed class GatewayData with _$GatewayData {
  const factory GatewayData({
    required String family,
    required String interface,
    required String address,
    required List<String> local,
  }) = _GatewayData;

  factory GatewayData.fromJson(Map<String, dynamic> json) =>
      _$GatewayDataFromJson(json);
}
