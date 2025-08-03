// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Config _$ConfigFromJson(Map<String, dynamic> json) => _Config(
      dns: json['dns'] == null
          ? null
          : Dns.fromJson(json['dns'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigToJson(_Config instance) => <String, dynamic>{
      if (instance.dns?.toJson() case final value?) 'dns': value,
    };

_Dns _$DnsFromJson(Map<String, dynamic> json) => _Dns(
      queryLogging: json['queryLogging'] as bool?,
    );

Map<String, dynamic> _$DnsToJson(_Dns instance) => <String, dynamic>{
      if (instance.queryLogging case final value?) 'queryLogging': value,
    };
