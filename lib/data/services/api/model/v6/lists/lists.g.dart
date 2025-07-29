// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lists _$ListsFromJson(Map<String, dynamic> json) => _Lists(
      lists: (json['lists'] as List<dynamic>)
          .map((e) => ListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
      processed: json['processed'] == null
          ? null
          : Processed.fromJson(json['processed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListsToJson(_Lists instance) => <String, dynamic>{
      'lists': instance.lists.map((e) => e.toJson()).toList(),
      'took': instance.took,
      'processed': instance.processed?.toJson(),
    };

_ListItem _$ListItemFromJson(Map<String, dynamic> json) => _ListItem(
      address: json['address'] as String,
      type: json['type'] as String,
      groups: (json['groups'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      enabled: json['enabled'] as bool,
      id: (json['id'] as num).toInt(),
      dateAdded: (json['date_added'] as num).toInt(),
      dateModified: (json['date_modified'] as num).toInt(),
      dateUpdated: (json['date_updated'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      invalidDomains: (json['invalid_domains'] as num).toInt(),
      abpEntries: (json['abp_entries'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ListItemToJson(_ListItem instance) => <String, dynamic>{
      'address': instance.address,
      'type': instance.type,
      'groups': instance.groups,
      'enabled': instance.enabled,
      'id': instance.id,
      'date_added': instance.dateAdded,
      'date_modified': instance.dateModified,
      'date_updated': instance.dateUpdated,
      'number': instance.number,
      'invalid_domains': instance.invalidDomains,
      'abp_entries': instance.abpEntries,
      'status': instance.status,
      'comment': instance.comment,
    };

_Processed _$ProcessedFromJson(Map<String, dynamic> json) => _Processed(
      success: (json['success'] as List<dynamic>)
          .map((e) => SuccessItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProcessedToJson(_Processed instance) =>
    <String, dynamic>{
      'success': instance.success.map((e) => e.toJson()).toList(),
      'errors': instance.errors.map((e) => e.toJson()).toList(),
    };

_SuccessItem _$SuccessItemFromJson(Map<String, dynamic> json) => _SuccessItem(
      item: json['item'] as String,
    );

Map<String, dynamic> _$SuccessItemToJson(_SuccessItem instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_ErrorItem _$ErrorItemFromJson(Map<String, dynamic> json) => _ErrorItem(
      item: json['item'] as String,
      error: json['error'] as String,
    );

Map<String, dynamic> _$ErrorItemToJson(_ErrorItem instance) =>
    <String, dynamic>{
      'item': instance.item,
      'error': instance.error,
    };
