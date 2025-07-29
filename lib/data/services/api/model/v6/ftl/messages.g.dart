// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoMessages _$InfoMessagesFromJson(Map<String, dynamic> json) =>
    _InfoMessages(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$InfoMessagesToJson(_InfoMessages instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'took': instance.took,
    };

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
      id: (json['id'] as num).toInt(),
      timestamp: (json['timestamp'] as num).toInt(),
      type: json['type'] as String,
      plain: json['plain'] as String,
      html: json['html'] as String,
    );

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'type': instance.type,
      'plain': instance.plain,
      'html': instance.html,
    };
