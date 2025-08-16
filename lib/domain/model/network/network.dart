import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';

part 'network.freezed.dart';
part 'network.g.dart';

@freezed
sealed class Gateways with _$Gateways {
  @JsonSerializable(explicitToJson: true)
  const factory Gateways({
    required List<Gateway> gateway,
    List<NetInterface>? interfaces,
    List<Route>? routes,
  }) = _Gateways;

  factory Gateways.fromJson(Map<String, dynamic> json) =>
      _$GatewaysFromJson(json);
}

@freezed
sealed class Gateway with _$Gateway {
  const factory Gateway({
    required String family,
    required String interface,
    required String address,
    required List<String> local,
  }) = _Gateway;

  factory Gateway.fromJson(Map<String, dynamic> json) =>
      _$GatewayFromJson(json);
}

@freezed
sealed class NetInterface with _$NetInterface {
  const factory NetInterface({
    required String name,
    required String type,
    required List<String> flags,
    required String state,
    required bool protoDown,
    required String address,
    required String broadcast,
    required bool carrier,
    required InterfaceStats stats,
    required List<InterfaceAddress> addresses,
    int? index,
    String? family,
    int? speed,
    String? permAddress,
    String? ifname,
    int? txqlen,
    int? linkmode,
    int? mtu,
    int? minMtu,
    int? maxMtu,
    int? group,
    int? promiscuity,
    List<int>? unknown,
    int? numTxQueues,
    int? numRxQueues,
    int? gsoMaxSegs,
    int? gsoMaxSize,
    int? map,
    int? carrierChanges,
    int? carrierUpCount,
    int? carrierDownCount,
    String? linkKind,
    String? qdisc,
    String? parentDevName,
    String? parentDevBusName,
  }) = _NetInterface;

  factory NetInterface.fromJson(Map<String, dynamic> json) =>
      _$NetInterfaceFromJson(json);
}

@freezed
sealed class InterfaceStats with _$InterfaceStats {
  const factory InterfaceStats({
    required ByteValue rxBytes,
    required ByteValue txBytes,
    required int bits,
    required int rxPackets,
    required int txPackets,
    required int rxErrors,
    required int txErrors,
    required int rxDropped,
    required int txDropped,
    required int multicast,
    required int collisions,
    required int rxLengthErrors,
    required int rxOverErrors,
    required int rxCrcErrors,
    required int rxFrameErrors,
    required int rxFifoErrors,
    required int rxMissedErrors,
    required int txAbortedErrors,
    required int txCarrierErrors,
    required int txFifoErrors,
    required int txHeartbeatErrors,
    required int txWindowErrors,
    required int rxCompressed,
    required int txCompressed,
    required int rxNohandler,
  }) = _InterfaceStats;

  factory InterfaceStats.fromJson(Map<String, dynamic> json) =>
      _$InterfaceStatsFromJson(json);
}

@freezed
sealed class ByteValue with _$ByteValue {
  const factory ByteValue({required double value, required String unit}) =
      _ByteValue;

  factory ByteValue.fromJson(Map<String, dynamic> json) =>
      _$ByteValueFromJson(json);
}

@freezed
sealed class InterfaceAddress with _$InterfaceAddress {
  const factory InterfaceAddress({
    required String address,
    required String addressType,
    required int index,
    required RouteFamilyType family,
    required String scope,
    required List<String> flags,
    required int prefixlen,
    required int prefered,
    required int valid,
    required double cstamp,
    required double tstamp,
    String? label,
    String? local,
    String? localType,
    String? broadcast,
    String? broadcastType,
    List<int>? unknown,
  }) = _InterfaceAddress;

  factory InterfaceAddress.fromJson(Map<String, dynamic> json) =>
      _$InterfaceAddressFromJson(json);
}

@freezed
sealed class Device with _$Device {
  @JsonSerializable(explicitToJson: true)
  const factory Device({
    required int id,
    required String hwaddr,
    required String interface,
    required DateTime firstSeen,
    required DateTime lastQuery,
    required int numQueries,
    required List<DeviceIp> ips,
    String? macVendor,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

@freezed
sealed class DeviceIp with _$DeviceIp {
  const factory DeviceIp({
    required String ip,
    required DateTime lastSeen,
    required DateTime nameUpdated,
    String? name,
  }) = _DeviceIp;

  factory DeviceIp.fromJson(Map<String, dynamic> json) =>
      _$DeviceIpFromJson(json);
}

@freezed
sealed class Route with _$Route {
  const factory Route({
    required int table,
    required RouteFamilyType family,
    required String protocol,
    required String scope,
    required String type,
    required List<String> flags,
    required String dst,
    int? iflags,
    String? gateway,
    String? oif,
    String? iif,
    String? src,
    String? prefsrc,
    int? priority,
    int? pref,
    double? cstamp,
    double? tstamp,
    int? expires,
    int? error,
    int? used,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}
