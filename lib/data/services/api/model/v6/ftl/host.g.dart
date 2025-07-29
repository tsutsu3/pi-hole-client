// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoHost _$InfoHostFromJson(Map<String, dynamic> json) => _InfoHost(
      host: HostData.fromJson(json['host'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$InfoHostToJson(_InfoHost instance) => <String, dynamic>{
      'host': instance.host.toJson(),
      'took': instance.took,
    };

_HostData _$HostDataFromJson(Map<String, dynamic> json) => _HostData(
      uname: HostUname.fromJson(json['uname'] as Map<String, dynamic>),
      model: json['model'] as String?,
      dmi: HostDmi.fromJson(json['dmi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HostDataToJson(_HostData instance) => <String, dynamic>{
      'uname': instance.uname.toJson(),
      'model': instance.model,
      'dmi': instance.dmi.toJson(),
    };

_HostUname _$HostUnameFromJson(Map<String, dynamic> json) => _HostUname(
      domainname: json['domainname'] as String,
      machine: json['machine'] as String,
      nodename: json['nodename'] as String,
      release: json['release'] as String,
      sysname: json['sysname'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$HostUnameToJson(_HostUname instance) =>
    <String, dynamic>{
      'domainname': instance.domainname,
      'machine': instance.machine,
      'nodename': instance.nodename,
      'release': instance.release,
      'sysname': instance.sysname,
      'version': instance.version,
    };

_HostDmi _$HostDmiFromJson(Map<String, dynamic> json) => _HostDmi(
      bios: BiosInfo.fromJson(json['bios'] as Map<String, dynamic>),
      board: BoardInfo.fromJson(json['board'] as Map<String, dynamic>),
      product: ProductInfo.fromJson(json['product'] as Map<String, dynamic>),
      sys: SystemInfo.fromJson(json['sys'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HostDmiToJson(_HostDmi instance) => <String, dynamic>{
      'bios': instance.bios.toJson(),
      'board': instance.board.toJson(),
      'product': instance.product.toJson(),
      'sys': instance.sys.toJson(),
    };

_BiosInfo _$BiosInfoFromJson(Map<String, dynamic> json) => _BiosInfo(
      vendor: json['vendor'] as String?,
    );

Map<String, dynamic> _$BiosInfoToJson(_BiosInfo instance) => <String, dynamic>{
      'vendor': instance.vendor,
    };

_BoardInfo _$BoardInfoFromJson(Map<String, dynamic> json) => _BoardInfo(
      name: json['name'] as String?,
      vendor: json['vendor'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$BoardInfoToJson(_BoardInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'vendor': instance.vendor,
      'version': instance.version,
    };

_ProductInfo _$ProductInfoFromJson(Map<String, dynamic> json) => _ProductInfo(
      name: json['name'] as String?,
      version: json['version'] as String?,
      family: json['family'] as String?,
    );

Map<String, dynamic> _$ProductInfoToJson(_ProductInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'family': instance.family,
    };

_SystemInfo _$SystemInfoFromJson(Map<String, dynamic> json) => _SystemInfo(
      vendor: json['vendor'] as String?,
    );

Map<String, dynamic> _$SystemInfoToJson(_SystemInfo instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
    };
