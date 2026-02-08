// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pihole_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PiholeClient _$PiholeClientFromJson(Map<String, dynamic> json) =>
    _PiholeClient(
      id: (json['id'] as num).toInt(),
      client: json['client'] as String,
      groups: (json['groups'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      dateAdded: DateTime.parse(json['dateAdded'] as String),
      dateModified: DateTime.parse(json['dateModified'] as String),
      name: json['name'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$PiholeClientToJson(_PiholeClient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'groups': instance.groups,
      'dateAdded': instance.dateAdded.toIso8601String(),
      'dateModified': instance.dateModified.toIso8601String(),
      'name': instance.name,
      'comment': instance.comment,
    };
