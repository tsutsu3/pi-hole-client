import 'package:freezed_annotation/freezed_annotation.dart';

part 'system.freezed.dart';
part 'system.g.dart';

@freezed
sealed class InfoSystem with _$InfoSystem {
  @JsonSerializable(explicitToJson: true)
  const factory InfoSystem({
    required int uptime,
    required double ramUsage,
    required double cpuUsage,
    // v6-only fields
    int? procs,
    MemoryInfo? memory,
    CpuLoad? cpuLoad,
  }) = _InfoSystem;

  factory InfoSystem.fromJson(Map<String, dynamic> json) =>
      _$InfoSystemFromJson(json);
}

@freezed
sealed class MemoryInfo with _$MemoryInfo {
  @JsonSerializable(explicitToJson: true)
  const factory MemoryInfo({
    required MemoryDetail ram,
    required MemoryDetail swap,
  }) = _MemoryInfo;

  factory MemoryInfo.fromJson(Map<String, dynamic> json) =>
      _$MemoryInfoFromJson(json);
}

@freezed
sealed class MemoryDetail with _$MemoryDetail {
  const factory MemoryDetail({
    required double total,
    required double used,
    required double free,
  }) = _MemoryDetail;

  factory MemoryDetail.fromJson(Map<String, dynamic> json) =>
      _$MemoryDetailFromJson(json);
}

@freezed
sealed class CpuLoad with _$CpuLoad {
  const factory CpuLoad({
    required double avg1m,
    required double avg5m,
    required double avg15m,
  }) = _CpuLoad;

  factory CpuLoad.fromJson(Map<String, dynamic> json) =>
      _$CpuLoadFromJson(json);
}
