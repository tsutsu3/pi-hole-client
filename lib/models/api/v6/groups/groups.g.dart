// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Groups _$GroupsFromJson(Map<String, dynamic> json) => _Groups(
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toInt(),
      processed: json['processed'] == null
          ? null
          : Processed.fromJson(json['processed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupsToJson(_Groups instance) => <String, dynamic>{
      'groups': instance.groups,
      'took': instance.took,
      'processed': instance.processed,
    };

_Group _$GroupFromJson(Map<String, dynamic> json) => _Group(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      enabled: json['enabled'] as bool,
      dateAdded: (json['date_added'] as num).toInt(),
      dateModified: (json['date_modified'] as num).toInt(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$GroupToJson(_Group instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'enabled': instance.enabled,
      'date_added': instance.dateAdded,
      'date_modified': instance.dateModified,
      'comment': instance.comment,
    };

_Processed _$ProcessedFromJson(Map<String, dynamic> json) => _Processed(
      success: (json['success'] as List<dynamic>)
          .map((e) => ProcessedSuccess.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ProcessedError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProcessedToJson(_Processed instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
    };

_ProcessedSuccess _$ProcessedSuccessFromJson(Map<String, dynamic> json) =>
    _ProcessedSuccess(
      item: json['item'] as String,
    );

Map<String, dynamic> _$ProcessedSuccessToJson(_ProcessedSuccess instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_ProcessedError _$ProcessedErrorFromJson(Map<String, dynamic> json) =>
    _ProcessedError(
      item: json['item'] as String,
      error: json['error'] as String,
    );

Map<String, dynamic> _$ProcessedErrorToJson(_ProcessedError instance) =>
    <String, dynamic>{
      'item': instance.item,
      'error': instance.error,
    };
