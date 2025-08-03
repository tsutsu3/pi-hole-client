// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Group _$GroupFromJson(Map<String, dynamic> json) => _Group(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      enabled: json['enabled'] as bool,
      dateAdded: DateTime.parse(json['dateAdded'] as String),
      dateModified: DateTime.parse(json['dateModified'] as String),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$GroupToJson(_Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'enabled': instance.enabled,
      'dateAdded': instance.dateAdded.toIso8601String(),
      'dateModified': instance.dateModified.toIso8601String(),
      'comment': instance.comment,
    };
