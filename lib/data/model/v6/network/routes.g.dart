// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Routes _$RoutesFromJson(Map<String, dynamic> json) => _Routes(
  routes: (json['routes'] as List<dynamic>)
      .map((e) => RouteData.fromJson(e as Map<String, dynamic>))
      .toList(),
  took: (json['took'] as num).toDouble(),
);

Map<String, dynamic> _$RoutesToJson(_Routes instance) => <String, dynamic>{
  'routes': instance.routes,
  'took': instance.took,
};

_RouteData _$RouteDataFromJson(Map<String, dynamic> json) => _RouteData(
  table: (json['table'] as num).toInt(),
  family: json['family'] as String,
  protocol: json['protocol'] as String,
  scope: json['scope'] as String,
  type: json['type'] as String,
  flags: (json['flags'] as List<dynamic>).map((e) => e as String).toList(),
  dst: json['dst'] as String,
  iflags: (json['iflags'] as num?)?.toInt(),
  gateway: json['gateway'] as String?,
  oif: json['oif'] as String?,
  iif: json['iif'] as String?,
  src: json['src'] as String?,
  prefsrc: json['prefsrc'] as String?,
  priority: (json['priority'] as num?)?.toInt(),
  pref: (json['pref'] as num?)?.toInt(),
  cstamp: (json['cstamp'] as num?)?.toDouble(),
  tstamp: (json['tstamp'] as num?)?.toDouble(),
  expires: (json['expires'] as num?)?.toInt(),
  error: (json['error'] as num?)?.toInt(),
  used: (json['used'] as num?)?.toInt(),
);

Map<String, dynamic> _$RouteDataToJson(_RouteData instance) =>
    <String, dynamic>{
      'table': instance.table,
      'family': instance.family,
      'protocol': instance.protocol,
      'scope': instance.scope,
      'type': instance.type,
      'flags': instance.flags,
      'dst': instance.dst,
      'iflags': instance.iflags,
      'gateway': instance.gateway,
      'oif': instance.oif,
      'iif': instance.iif,
      'src': instance.src,
      'prefsrc': instance.prefsrc,
      'priority': instance.priority,
      'pref': instance.pref,
      'cstamp': instance.cstamp,
      'tstamp': instance.tstamp,
      'expires': instance.expires,
      'error': instance.error,
      'used': instance.used,
    };
