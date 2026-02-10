// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pihole_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PiholeServer _$PiholeServerFromJson(Map<String, dynamic> json) =>
    _PiholeServer(
      host: json['host'] == null
          ? null
          : FtlHost.fromJson(json['host'] as Map<String, dynamic>),
      sensor: json['sensor'] == null
          ? null
          : FtlSensor.fromJson(json['sensor'] as Map<String, dynamic>),
      system: json['system'] == null
          ? null
          : FtlSystem.fromJson(json['system'] as Map<String, dynamic>),
      version: json['version'] == null
          ? null
          : FtlVersion.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PiholeServerToJson(_PiholeServer instance) =>
    <String, dynamic>{
      'host': instance.host?.toJson(),
      'sensor': instance.sensor?.toJson(),
      'system': instance.system?.toJson(),
      'version': instance.version?.toJson(),
    };
