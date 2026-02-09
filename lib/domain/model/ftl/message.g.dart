// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtlMessage _$FtlMessageFromJson(Map<String, dynamic> json) => _FtlMessage(
  id: (json['id'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  message: json['message'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$FtlMessageToJson(_FtlMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'message': instance.message,
      'url': instance.url,
    };
