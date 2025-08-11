// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Gateway _$GatewayFromJson(Map<String, dynamic> json) => _Gateway(
  gateway: (json['gateway'] as List<dynamic>)
      .map((e) => GatewayData.fromJson(e as Map<String, dynamic>))
      .toList(),
  took: (json['took'] as num).toDouble(),
  interfaces: (json['interfaces'] as List<dynamic>?)
      ?.map((e) => InterfaceData.fromJson(e as Map<String, dynamic>))
      .toList(),
  routes: (json['routes'] as List<dynamic>?)
      ?.map((e) => RouteData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GatewayToJson(_Gateway instance) => <String, dynamic>{
  'gateway': instance.gateway.map((e) => e.toJson()).toList(),
  'took': instance.took,
  'interfaces': instance.interfaces?.map((e) => e.toJson()).toList(),
  'routes': instance.routes?.map((e) => e.toJson()).toList(),
};

_GatewayData _$GatewayDataFromJson(Map<String, dynamic> json) => _GatewayData(
  family: json['family'] as String,
  interface: json['interface'] as String,
  address: json['address'] as String,
  local: (json['local'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$GatewayDataToJson(_GatewayData instance) =>
    <String, dynamic>{
      'family': instance.family,
      'interface': instance.interface,
      'address': instance.address,
      'local': instance.local,
    };
