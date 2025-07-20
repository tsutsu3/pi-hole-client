import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data2/services/gateways/v6/models/network/common.dart';

part 'interfaces.freezed.dart';
part 'interfaces.g.dart';

@freezed
sealed class Interfaces with _$Interfaces {
  const factory Interfaces({
    required List<InterfaceData> interfaces,
    required double took,
  }) = _Interfaces;

  factory Interfaces.fromJson(Map<String, dynamic> json) =>
      _$InterfacesFromJson(json);
}

@freezed
sealed class InterfaceData with _$InterfaceData {
  const factory InterfaceData({
    required String name,
    required String type,
    required List<String> flags,
    required String state,
    @JsonKey(name: 'proto_down') required bool protoDown,
    required String address,
    required String broadcast,
    required bool carrier,
    required InterfaceStats stats,
    required List<InterfaceAddress> addresses,
    int? index,
    String? family,
    int? speed,
    @JsonKey(name: 'perm_address') String? permAddress,
    String? ifname,
    int? txqlen,
    int? linkmode,
    int? mtu,
    @JsonKey(name: 'min_mtu') int? minMtu,
    @JsonKey(name: 'max_mtu') int? maxMtu,
    int? group,
    int? promiscuity,
    List<int>? unknown,
    @JsonKey(name: 'num_tx_queues') int? numTxQueues,
    @JsonKey(name: 'num_rx_queues') int? numRxQueues,
    @JsonKey(name: 'gso_max_segs') int? gsoMaxSegs,
    @JsonKey(name: 'gso_max_size') int? gsoMaxSize,
    int? map,
    @JsonKey(name: 'carrier_changes') int? carrierChanges,
    @JsonKey(name: 'carrier_up_count') int? carrierUpCount,
    @JsonKey(name: 'carrier_down_count') int? carrierDownCount,
    @JsonKey(name: 'link_kind') String? linkKind,
    String? qdisc,
    @JsonKey(name: 'parent_dev_name') String? parentDevName,
    @JsonKey(name: 'parent_dev_bus_name') String? parentDevBusName,
  }) = _InterfaceData;

  factory InterfaceData.fromJson(Map<String, dynamic> json) =>
      _$InterfaceDataFromJson(json);
}

@freezed
sealed class InterfaceStats with _$InterfaceStats {
  const factory InterfaceStats({
    @JsonKey(name: 'rx_bytes') required ByteValue rxBytes,
    @JsonKey(name: 'tx_bytes') required ByteValue txBytes,
    required int bits,
    @JsonKey(name: 'rx_packets') required int rxPackets,
    @JsonKey(name: 'tx_packets') required int txPackets,
    @JsonKey(name: 'rx_errors') required int rxErrors,
    @JsonKey(name: 'tx_errors') required int txErrors,
    @JsonKey(name: 'rx_dropped') required int rxDropped,
    @JsonKey(name: 'tx_dropped') required int txDropped,
    required int multicast,
    required int collisions,
    @JsonKey(name: 'rx_length_errors') required int rxLengthErrors,
    @JsonKey(name: 'rx_over_errors') required int rxOverErrors,
    @JsonKey(name: 'rx_crc_errors') required int rxCrcErrors,
    @JsonKey(name: 'rx_frame_errors') required int rxFrameErrors,
    @JsonKey(name: 'rx_fifo_errors') required int rxFifoErrors,
    @JsonKey(name: 'rx_missed_errors') required int rxMissedErrors,
    @JsonKey(name: 'tx_aborted_errors') required int txAbortedErrors,
    @JsonKey(name: 'tx_carrier_errors') required int txCarrierErrors,
    @JsonKey(name: 'tx_fifo_errors') required int txFifoErrors,
    @JsonKey(name: 'tx_heartbeat_errors') required int txHeartbeatErrors,
    @JsonKey(name: 'tx_window_errors') required int txWindowErrors,
    @JsonKey(name: 'rx_compressed') required int rxCompressed,
    @JsonKey(name: 'tx_compressed') required int txCompressed,
    @JsonKey(name: 'rx_nohandler') required int rxNohandler,
  }) = _InterfaceStats;

  factory InterfaceStats.fromJson(Map<String, dynamic> json) =>
      _$InterfaceStatsFromJson(json);
}

@freezed
sealed class ByteValue with _$ByteValue {
  const factory ByteValue({
    required double value,
    required String unit,
  }) = _ByteValue;

  factory ByteValue.fromJson(Map<String, dynamic> json) =>
      _$ByteValueFromJson(json);
}

@freezed
sealed class InterfaceAddress with _$InterfaceAddress {
  const factory InterfaceAddress({
    required String address,
    @JsonKey(name: 'address_type') required String addressType,
    required int index,
    required RouteFamily family,
    required String scope,
    required List<String> flags,
    required int prefixlen,
    required int prefered,
    required int valid,
    required double cstamp,
    required double tstamp,
    String? label,
    String? local,
    @JsonKey(name: 'local_type') String? localType,
    String? broadcast,
    @JsonKey(name: 'broadcast_type') String? broadcastType,
    List<int>? unknown,
  }) = _InterfaceAddress;

  factory InterfaceAddress.fromJson(Map<String, dynamic> json) =>
      _$InterfaceAddressFromJson(json);
}
