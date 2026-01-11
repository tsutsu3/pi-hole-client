import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data/model/v6/ftl/version.dart';

part 'padd.freezed.dart';
part 'padd.g.dart';

@freezed
sealed class Padd with _$Padd {
  @JsonSerializable(explicitToJson: true)
  const factory Padd({
    @JsonKey(name: 'active_clients') required int activeClients,
    @JsonKey(name: 'gravity_size') required int gravitySize,
    required String blocking,
    required PaddQueries queries,
    required PaddCache cache,
    required PaddIface iface,
    @JsonKey(name: 'node_name') required String nodeName,
    required PaddConfig config,
    @JsonKey(name: '%cpu') required double cpuPercent,
    @JsonKey(name: '%mem') required double memPercent,
    required int pid,
    required PaddSensors sensors,
    required PaddSystem system,
    required VersionData version,
    required double took,
    @JsonKey(name: 'recent_blocked') String? recentBlocked,
    @JsonKey(name: 'top_domain') String? topDomain,
    @JsonKey(name: 'top_blocked') String? topBlocked,
    @JsonKey(name: 'top_client') String? topClient,
    @JsonKey(name: 'host_model') String? hostModel,
  }) = _Padd;

  factory Padd.fromJson(Map<String, dynamic> json) => _$PaddFromJson(json);
}

@freezed
sealed class PaddQueries with _$PaddQueries {
  const factory PaddQueries({
    required int total,
    required int blocked,
    @JsonKey(name: 'percent_blocked') required double percentBlocked,
  }) = _PaddQueries;

  factory PaddQueries.fromJson(Map<String, dynamic> json) =>
      _$PaddQueriesFromJson(json);
}

@freezed
sealed class PaddCache with _$PaddCache {
  const factory PaddCache({
    required int size,
    required int inserted,
    required int evicted,
  }) = _PaddCache;

  factory PaddCache.fromJson(Map<String, dynamic> json) =>
      _$PaddCacheFromJson(json);
}

@freezed
sealed class PaddIface with _$PaddIface {
  @JsonSerializable(explicitToJson: true)
  const factory PaddIface({required PaddIfaceV4 v4, required PaddIfaceV6 v6}) =
      _PaddIface;

  factory PaddIface.fromJson(Map<String, dynamic> json) =>
      _$PaddIfaceFromJson(json);
}

@freezed
sealed class PaddIfaceV4 with _$PaddIfaceV4 {
  @JsonSerializable(explicitToJson: true)
  const factory PaddIfaceV4({
    @JsonKey(name: 'rx_bytes') required PaddIfaceBytes rxBytes,
    @JsonKey(name: 'tx_bytes') required PaddIfaceBytes txBytes,
    @JsonKey(name: 'num_addrs') required int numAddrs,
    required String name,
    String? addr,
    @JsonKey(name: 'gw_addr') String? gwAddr,
  }) = _PaddIfaceV4;

  factory PaddIfaceV4.fromJson(Map<String, dynamic> json) =>
      _$PaddIfaceV4FromJson(json);
}

@freezed
sealed class PaddIfaceV6 with _$PaddIfaceV6 {
  const factory PaddIfaceV6({
    @JsonKey(name: 'num_addrs') required int numAddrs,
    required String name,
    String? addr,
    @JsonKey(name: 'gw_addr') String? gwAddr,
  }) = _PaddIfaceV6;

  factory PaddIfaceV6.fromJson(Map<String, dynamic> json) =>
      _$PaddIfaceV6FromJson(json);
}

@freezed
sealed class PaddIfaceBytes with _$PaddIfaceBytes {
  const factory PaddIfaceBytes({required double value, required String unit}) =
      _PaddIfaceBytes;

  factory PaddIfaceBytes.fromJson(Map<String, dynamic> json) =>
      _$PaddIfaceBytesFromJson(json);
}

@freezed
sealed class PaddConfig with _$PaddConfig {
  const factory PaddConfig({
    @JsonKey(name: 'dhcp_active') required bool dhcpActive,
    @JsonKey(name: 'dhcp_start') required String dhcpStart,
    @JsonKey(name: 'dhcp_end') required String dhcpEnd,
    @JsonKey(name: 'dhcp_ipv6') required bool dhcpIpv6,
    @JsonKey(name: 'dns_domain') required String dnsDomain,
    @JsonKey(name: 'dns_port') required int dnsPort,
    @JsonKey(name: 'dns_num_upstreams') required int dnsNumUpstreams,
    @JsonKey(name: 'dns_dnssec') required bool dnsDnssec,
    @JsonKey(name: 'dns_revServer_active') required bool dnsRevServerActive,
    @JsonKey(name: 'privacy_level') required int privacyLevel,
  }) = _PaddConfig;

  factory PaddConfig.fromJson(Map<String, dynamic> json) =>
      _$PaddConfigFromJson(json);
}

@freezed
sealed class PaddSensors with _$PaddSensors {
  const factory PaddSensors({
    @JsonKey(name: 'hot_limit') required double hotLimit,
    required String unit,
    @JsonKey(name: 'cpu_temp') double? cpuTemp,
  }) = _PaddSensors;

  factory PaddSensors.fromJson(Map<String, dynamic> json) =>
      _$PaddSensorsFromJson(json);
}

@freezed
sealed class PaddSystem with _$PaddSystem {
  @JsonSerializable(explicitToJson: true)
  const factory PaddSystem({
    required int uptime,
    required PaddSystemMemory memory,
    required int procs,
    required PaddSystemCpu cpu,
    required PaddSystemFtl ftl,
  }) = _PaddSystem;

  factory PaddSystem.fromJson(Map<String, dynamic> json) =>
      _$PaddSystemFromJson(json);
}

@freezed
sealed class PaddSystemMemory with _$PaddSystemMemory {
  @JsonSerializable(explicitToJson: true)
  const factory PaddSystemMemory({
    required PaddSystemRam ram,
    required PaddSystemSwap swap,
  }) = _PaddSystemMemory;

  factory PaddSystemMemory.fromJson(Map<String, dynamic> json) =>
      _$PaddSystemMemoryFromJson(json);
}

@freezed
sealed class PaddSystemRam with _$PaddSystemRam {
  const factory PaddSystemRam({
    required int total,
    required int free,
    required int used,
    required int available,
    @JsonKey(name: '%used') required double percentUsed,
  }) = _PaddSystemRam;

  factory PaddSystemRam.fromJson(Map<String, dynamic> json) =>
      _$PaddSystemRamFromJson(json);
}

@freezed
sealed class PaddSystemSwap with _$PaddSystemSwap {
  const factory PaddSystemSwap({
    required int total,
    required int used,
    required int free,
    @JsonKey(name: '%used') required double percentUsed,
  }) = _PaddSystemSwap;

  factory PaddSystemSwap.fromJson(Map<String, dynamic> json) =>
      _$PaddSystemSwapFromJson(json);
}

@freezed
sealed class PaddSystemCpu with _$PaddSystemCpu {
  @JsonSerializable(explicitToJson: true)
  const factory PaddSystemCpu({
    required int nprocs,
    required PaddSystemLoad load,
    @JsonKey(name: '%cpu') double? percentCpu,
  }) = _PaddSystemCpu;

  factory PaddSystemCpu.fromJson(Map<String, dynamic> json) =>
      _$PaddSystemCpuFromJson(json);
}

@freezed
sealed class PaddSystemLoad with _$PaddSystemLoad {
  const factory PaddSystemLoad({
    required List<double> raw,
    required List<double> percent,
  }) = _PaddSystemLoad;

  factory PaddSystemLoad.fromJson(Map<String, dynamic> json) =>
      _$PaddSystemLoadFromJson(json);
}

@freezed
sealed class PaddSystemFtl with _$PaddSystemFtl {
  const factory PaddSystemFtl({
    @JsonKey(name: '%mem') required double percentMem,
    @JsonKey(name: '%cpu') required double percentCpu,
  }) = _PaddSystemFtl;

  factory PaddSystemFtl.fromJson(Map<String, dynamic> json) =>
      _$PaddSystemFtlFromJson(json);
}
