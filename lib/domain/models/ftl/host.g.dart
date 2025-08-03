// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoHost _$InfoHostFromJson(Map<String, dynamic> json) => _InfoHost(
      domainname: json['domainname'] as String,
      arch: json['arch'] as String,
      hostName: json['hostName'] as String,
      release: json['release'] as String,
      sysName: json['sysName'] as String,
      version: json['version'] as String,
      model: json['model'] as String?,
    );

Map<String, dynamic> _$InfoHostToJson(_InfoHost instance) => <String, dynamic>{
      'domainname': instance.domainname,
      'arch': instance.arch,
      'hostName': instance.hostName,
      'release': instance.release,
      'sysName': instance.sysName,
      'version': instance.version,
      'model': instance.model,
    };
