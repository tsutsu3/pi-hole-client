// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dhcp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Dhcp _$DhcpFromJson(Map<String, dynamic> json) => _Dhcp(
      leases: (json['leases'] as List<dynamic>)
          .map((e) => DhcpData.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$DhcpToJson(_Dhcp instance) => <String, dynamic>{
      'leases': instance.leases,
      'took': instance.took,
    };

_DhcpData _$DhcpDataFromJson(Map<String, dynamic> json) => _DhcpData(
      expires: (json['expires'] as num).toInt(),
      name: json['name'] as String,
      hwaddr: json['hwaddr'] as String,
      ip: json['ip'] as String,
      clientid: json['clientid'] as String,
    );

Map<String, dynamic> _$DhcpDataToJson(_DhcpData instance) => <String, dynamic>{
      'expires': instance.expires,
      'name': instance.name,
      'hwaddr': instance.hwaddr,
      'ip': instance.ip,
      'clientid': instance.clientid,
    };
