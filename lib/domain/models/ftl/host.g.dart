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
);

Map<String, dynamic> _$InfoHostToJson(_InfoHost instance) => <String, dynamic>{
  'domainName': instance.domainName,
  'arch': instance.arch,
  'hostName': instance.hostName,
  'release': instance.release,
  'sysName': instance.sysName,
  'version': instance.version,
  'model': instance.model,
};
