// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Client _$ClientFromJson(Map<String, dynamic> json) => _Client(
      remoteAddr: json['remote_addr'] as String,
      httpVersion: json['http_version'] as String,
      method: json['method'] as String,
      headers: (json['headers'] as List<dynamic>)
          .map((e) => Header.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
      'remote_addr': instance.remoteAddr,
      'http_version': instance.httpVersion,
      'method': instance.method,
      'headers': instance.headers,
      'took': instance.took,
    };

_Header _$HeaderFromJson(Map<String, dynamic> json) => _Header(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$HeaderToJson(_Header instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
