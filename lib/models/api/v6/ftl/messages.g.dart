// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Messages _$MessagesFromJson(Map<String, dynamic> json) => _Messages(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$MessagesToJson(_Messages instance) => <String, dynamic>{
      'messages': instance.messages,
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
