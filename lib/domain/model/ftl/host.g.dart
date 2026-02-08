// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoHost _$InfoHostFromJson(Map<String, dynamic> json) => _InfoHost(
  domainName: json['domainName'] as String,
  arch: json['arch'] as String,
  hostName: json['hostName'] as String,
  release: json['release'] as String,
  sysName: json['sysName'] as String,
  version: json['version'] as String,
  model: json['model'] as String?,
  dmi: json['dmi'] == null
      ? null
      : DmiInfo.fromJson(json['dmi'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InfoHostToJson(_InfoHost instance) => <String, dynamic>{
  'domainName': instance.domainName,
  'arch': instance.arch,
  'hostName': instance.hostName,
  'release': instance.release,
  'sysName': instance.sysName,
  'version': instance.version,
  'model': instance.model,
  'dmi': instance.dmi?.toJson(),
};

_DmiInfo _$DmiInfoFromJson(Map<String, dynamic> json) => _DmiInfo(
  bios: json['bios'] == null
      ? null
      : DmiBios.fromJson(json['bios'] as Map<String, dynamic>),
  board: json['board'] == null
      ? null
      : DmiBoard.fromJson(json['board'] as Map<String, dynamic>),
  product: json['product'] == null
      ? null
      : DmiProduct.fromJson(json['product'] as Map<String, dynamic>),
  sys: json['sys'] == null
      ? null
      : DmiSys.fromJson(json['sys'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DmiInfoToJson(_DmiInfo instance) => <String, dynamic>{
  'bios': instance.bios?.toJson(),
  'board': instance.board?.toJson(),
  'product': instance.product?.toJson(),
  'sys': instance.sys?.toJson(),
};

_DmiBios _$DmiBiosFromJson(Map<String, dynamic> json) => _DmiBios(
  vendor: json['vendor'] as String?,
  version: json['version'] as String?,
  date: json['date'] as String?,
);

Map<String, dynamic> _$DmiBiosToJson(_DmiBios instance) => <String, dynamic>{
  'vendor': instance.vendor,
  'version': instance.version,
  'date': instance.date,
};

_DmiBoard _$DmiBoardFromJson(Map<String, dynamic> json) => _DmiBoard(
  name: json['name'] as String?,
  vendor: json['vendor'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$DmiBoardToJson(_DmiBoard instance) => <String, dynamic>{
  'name': instance.name,
  'vendor': instance.vendor,
  'version': instance.version,
};

_DmiProduct _$DmiProductFromJson(Map<String, dynamic> json) => _DmiProduct(
  name: json['name'] as String?,
  family: json['family'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$DmiProductToJson(_DmiProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'family': instance.family,
      'version': instance.version,
    };

_DmiSys _$DmiSysFromJson(Map<String, dynamic> json) => _DmiSys(
  vendor: json['vendor'] as String?,
  version: json['version'] as String?,
);

Map<String, dynamic> _$DmiSysToJson(_DmiSys instance) => <String, dynamic>{
  'vendor': instance.vendor,
  'version': instance.version,
};
