// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pihole_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoPiholeServer _$InfoPiholeServerFromJson(Map<String, dynamic> json) =>
    _InfoPiholeServer(
      host: json['host'] == null
          ? null
          : InfoHost.fromJson(json['host'] as Map<String, dynamic>),
      sensor: json['sensor'] == null
          ? null
          : InfoSensor.fromJson(json['sensor'] as Map<String, dynamic>),
      system: json['system'] == null
          ? null
          : InfoSystem.fromJson(json['system'] as Map<String, dynamic>),
      version: json['version'] == null
          ? null
          : InfoVersion.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoPiholeServerToJson(_InfoPiholeServer instance) =>
    <String, dynamic>{
      'host': instance.host?.toJson(),
      'sensor': instance.sensor?.toJson(),
      'system': instance.system?.toJson(),
      'version': instance.version?.toJson(),
    };
