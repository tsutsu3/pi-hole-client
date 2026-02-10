// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtlInfo _$FtlInfoFromJson(Map<String, dynamic> json) => _FtlInfo(
  privacyLevel: (json['privacyLevel'] as num).toInt(),
  pid: (json['pid'] as num?)?.toInt(),
  uptime: (json['uptime'] as num?)?.toInt(),
  percentMem: (json['percentMem'] as num?)?.toDouble(),
  percentCpu: (json['percentCpu'] as num?)?.toDouble(),
  queryFrequency: (json['queryFrequency'] as num?)?.toDouble(),
  allowDestructive: json['allowDestructive'] as bool?,
  database: json['database'] == null
      ? null
      : FtlDatabase.fromJson(json['database'] as Map<String, dynamic>),
  clients: json['clients'] == null
      ? null
      : FtlClients.fromJson(json['clients'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FtlInfoToJson(_FtlInfo instance) => <String, dynamic>{
  'privacyLevel': instance.privacyLevel,
  'pid': instance.pid,
  'uptime': instance.uptime,
  'percentMem': instance.percentMem,
  'percentCpu': instance.percentCpu,
  'queryFrequency': instance.queryFrequency,
  'allowDestructive': instance.allowDestructive,
  'database': instance.database?.toJson(),
  'clients': instance.clients?.toJson(),
};

_FtlDatabase _$FtlDatabaseFromJson(Map<String, dynamic> json) => _FtlDatabase(
  gravityDomains: (json['gravityDomains'] as num).toInt(),
  allowedExact: (json['allowedExact'] as num).toInt(),
  allowedRegex: (json['allowedRegex'] as num).toInt(),
  deniedExact: (json['deniedExact'] as num).toInt(),
  deniedRegex: (json['deniedRegex'] as num).toInt(),
);

Map<String, dynamic> _$FtlDatabaseToJson(_FtlDatabase instance) =>
    <String, dynamic>{
      'gravityDomains': instance.gravityDomains,
      'allowedExact': instance.allowedExact,
      'allowedRegex': instance.allowedRegex,
      'deniedExact': instance.deniedExact,
      'deniedRegex': instance.deniedRegex,
    };

_FtlClients _$FtlClientsFromJson(Map<String, dynamic> json) => _FtlClients(
  total: (json['total'] as num).toInt(),
  active: (json['active'] as num).toInt(),
);

Map<String, dynamic> _$FtlClientsToJson(_FtlClients instance) =>
    <String, dynamic>{'total': instance.total, 'active': instance.active};
