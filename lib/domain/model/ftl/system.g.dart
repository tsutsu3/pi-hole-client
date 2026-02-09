// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtlSystem _$FtlSystemFromJson(Map<String, dynamic> json) => _FtlSystem(
  uptime: (json['uptime'] as num).toInt(),
  ramUsage: (json['ramUsage'] as num).toDouble(),
  cpuUsage: (json['cpuUsage'] as num).toDouble(),
  procs: (json['procs'] as num?)?.toInt(),
  memory: json['memory'] == null
      ? null
      : MemoryInfo.fromJson(json['memory'] as Map<String, dynamic>),
  cpuLoad: json['cpuLoad'] == null
      ? null
      : CpuLoad.fromJson(json['cpuLoad'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FtlSystemToJson(_FtlSystem instance) =>
    <String, dynamic>{
      'uptime': instance.uptime,
      'ramUsage': instance.ramUsage,
      'cpuUsage': instance.cpuUsage,
      'procs': instance.procs,
      'memory': instance.memory?.toJson(),
      'cpuLoad': instance.cpuLoad?.toJson(),
    };

_MemoryInfo _$MemoryInfoFromJson(Map<String, dynamic> json) => _MemoryInfo(
  ram: MemoryDetail.fromJson(json['ram'] as Map<String, dynamic>),
  swap: MemoryDetail.fromJson(json['swap'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MemoryInfoToJson(_MemoryInfo instance) =>
    <String, dynamic>{
      'ram': instance.ram.toJson(),
      'swap': instance.swap.toJson(),
    };

_MemoryDetail _$MemoryDetailFromJson(Map<String, dynamic> json) =>
    _MemoryDetail(
      total: (json['total'] as num).toDouble(),
      used: (json['used'] as num).toDouble(),
      free: (json['free'] as num).toDouble(),
    );

Map<String, dynamic> _$MemoryDetailToJson(_MemoryDetail instance) =>
    <String, dynamic>{
      'total': instance.total,
      'used': instance.used,
      'free': instance.free,
    };

_CpuLoad _$CpuLoadFromJson(Map<String, dynamic> json) => _CpuLoad(
  avg1m: (json['avg1m'] as num).toDouble(),
  avg5m: (json['avg5m'] as num).toDouble(),
  avg15m: (json['avg15m'] as num).toDouble(),
);

Map<String, dynamic> _$CpuLoadToJson(_CpuLoad instance) => <String, dynamic>{
  'avg1m': instance.avg1m,
  'avg5m': instance.avg5m,
  'avg15m': instance.avg15m,
};
