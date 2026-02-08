// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dhcp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DhcpLease _$DhcpLeaseFromJson(Map<String, dynamic> json) => _DhcpLease(
  name: json['name'] as String,
  hwaddr: json['hwaddr'] as String,
  ip: json['ip'] as String,
  clientid: json['clientid'] as String,
  expires: json['expires'] == null
      ? null
      : DateTime.parse(json['expires'] as String),
);

Map<String, dynamic> _$DhcpLeaseToJson(_DhcpLease instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hwaddr': instance.hwaddr,
      'ip': instance.ip,
      'clientid': instance.clientid,
      'expires': instance.expires?.toIso8601String(),
    };
