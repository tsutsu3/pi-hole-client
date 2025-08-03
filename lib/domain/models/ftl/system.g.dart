// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoSystem _$InfoSystemFromJson(Map<String, dynamic> json) => _InfoSystem(
      uptime: (json['uptime'] as num).toInt(),
      ramUsage: (json['ramUsage'] as num).toDouble(),
      cpuUsage: (json['cpuUsage'] as num).toDouble(),
    );

Map<String, dynamic> _$InfoSystemToJson(_InfoSystem instance) =>
    <String, dynamic>{
      'uptime': instance.uptime,
      'ramUsage': instance.ramUsage,
      'cpuUsage': instance.cpuUsage,
    };
