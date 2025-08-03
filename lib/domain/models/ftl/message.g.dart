// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoMessage _$InfoMessageFromJson(Map<String, dynamic> json) => _InfoMessage(
      id: (json['id'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      message: json['message'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$InfoMessageToJson(_InfoMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'message': instance.message,
      'url': instance.url,
    };
