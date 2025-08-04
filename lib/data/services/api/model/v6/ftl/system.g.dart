// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoSystem _$InfoSystemFromJson(Map<String, dynamic> json) => _InfoSystem(
  system: SystemData.fromJson(json['system'] as Map<String, dynamic>),
  took: (json['took'] as num).toDouble(),
);

Map<String, dynamic> _$InfoSystemToJson(_InfoSystem instance) =>
    <String, dynamic>{
      'system': instance.system.toJson(),
      'took': instance.took,
    };

_SystemData _$SystemDataFromJson(Map<String, dynamic> json) => _SystemData(
  uptime: (json['uptime'] as num).toInt(),
  memory: Memory.fromJson(json['memory'] as Map<String, dynamic>),
  procs: (json['procs'] as num).toInt(),
  cpu: CPU.fromJson(json['cpu'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SystemDataToJson(_SystemData instance) =>
    <String, dynamic>{
      'uptime': instance.uptime,
      'memory': instance.memory.toJson(),
      'procs': instance.procs,
      'cpu': instance.cpu.toJson(),
    };

_Memory _$MemoryFromJson(Map<String, dynamic> json) => _Memory(
  ram: RAM.fromJson(json['ram'] as Map<String, dynamic>),
  swap: Swap.fromJson(json['swap'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MemoryToJson(_Memory instance) => <String, dynamic>{
  'ram': instance.ram.toJson(),
  'swap': instance.swap.toJson(),
};

_RAM _$RAMFromJson(Map<String, dynamic> json) => _RAM(
  total: (json['total'] as num).toInt(),
  free: (json['free'] as num).toInt(),
  used: (json['used'] as num).toInt(),
  available: (json['available'] as num).toInt(),
  percentUsed: (json['%used'] as num).toDouble(),
);

Map<String, dynamic> _$RAMToJson(_RAM instance) => <String, dynamic>{
  'total': instance.total,
  'free': instance.free,
  'used': instance.used,
  'available': instance.available,
  '%used': instance.percentUsed,
};

_Swap _$SwapFromJson(Map<String, dynamic> json) => _Swap(
  total: (json['total'] as num).toInt(),
  used: (json['used'] as num).toInt(),
  free: (json['free'] as num).toInt(),
  percentUsed: (json['%used'] as num).toDouble(),
);

Map<String, dynamic> _$SwapToJson(_Swap instance) => <String, dynamic>{
  'total': instance.total,
  'used': instance.used,
  'free': instance.free,
  '%used': instance.percentUsed,
};

_CPU _$CPUFromJson(Map<String, dynamic> json) => _CPU(
  nprocs: (json['nprocs'] as num).toInt(),
  load: Load.fromJson(json['load'] as Map<String, dynamic>),
  percentCpu: (json['%cpu'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CPUToJson(_CPU instance) => <String, dynamic>{
  'nprocs': instance.nprocs,
  'load': instance.load.toJson(),
  '%cpu': instance.percentCpu,
};

_Load _$LoadFromJson(Map<String, dynamic> json) => _Load(
  raw: (json['raw'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  percent: (json['percent'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$LoadToJson(_Load instance) => <String, dynamic>{
  'raw': instance.raw,
  'percent': instance.percent,
};
