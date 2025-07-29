// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Devices _$DevicesFromJson(Map<String, dynamic> json) => _Devices(
      devices: (json['devices'] as List<dynamic>)
          .map((e) => DeviceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$DevicesToJson(_Devices instance) => <String, dynamic>{
      'devices': instance.devices.map((e) => e.toJson()).toList(),
      'took': instance.took,
    };

_DeviceData _$DeviceDataFromJson(Map<String, dynamic> json) => _DeviceData(
      id: (json['id'] as num).toInt(),
      hwaddr: json['hwaddr'] as String,
      interface: json['interface'] as String,
      firstSeen: (json['firstSeen'] as num).toInt(),
      lastQuery: (json['lastQuery'] as num).toInt(),
      numQueries: (json['numQueries'] as num).toInt(),
      ips: (json['ips'] as List<dynamic>)
          .map((e) => DeviceIp.fromJson(e as Map<String, dynamic>))
          .toList(),
      macVendor: json['macVendor'] as String?,
    );

Map<String, dynamic> _$DeviceDataToJson(_DeviceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hwaddr': instance.hwaddr,
      'interface': instance.interface,
      'firstSeen': instance.firstSeen,
      'lastQuery': instance.lastQuery,
      'numQueries': instance.numQueries,
      'ips': instance.ips.map((e) => e.toJson()).toList(),
      'macVendor': instance.macVendor,
    };

_DeviceIp _$DeviceIpFromJson(Map<String, dynamic> json) => _DeviceIp(
      ip: json['ip'] as String,
      lastSeen: (json['lastSeen'] as num).toInt(),
      nameUpdated: (json['nameUpdated'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DeviceIpToJson(_DeviceIp instance) => <String, dynamic>{
      'ip': instance.ip,
      'lastSeen': instance.lastSeen,
      'nameUpdated': instance.nameUpdated,
      'name': instance.name,
    };
