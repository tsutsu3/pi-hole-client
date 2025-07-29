// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Domains _$DomainsFromJson(Map<String, dynamic> json) => _Domains(
      domains: (json['domains'] as List<dynamic>)
          .map((e) => DomainData.fromJson(e as Map<String, dynamic>))
          .toList(),
      processed: json['processed'] == null
          ? null
          : Processed.fromJson(json['processed'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$DomainsToJson(_Domains instance) => <String, dynamic>{
      'domains': instance.domains.map((e) => e.toJson()).toList(),
      'processed': instance.processed?.toJson(),
      'took': instance.took,
    };

_DomainData _$DomainDataFromJson(Map<String, dynamic> json) => _DomainData(
      domain: json['domain'] as String,
      unicode: json['unicode'] as String,
      type: json['type'] as String,
      kind: json['kind'] as String,
      comment: json['comment'] as String?,
      groups: (json['groups'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      enabled: json['enabled'] as bool,
      id: (json['id'] as num).toInt(),
      dateAdded: (json['date_added'] as num).toInt(),
      dateModified: (json['date_modified'] as num).toInt(),
    );

Map<String, dynamic> _$DomainDataToJson(_DomainData instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'unicode': instance.unicode,
      'type': instance.type,
      'kind': instance.kind,
      'comment': instance.comment,
      'groups': instance.groups,
      'enabled': instance.enabled,
      'id': instance.id,
      'date_added': instance.dateAdded,
      'date_modified': instance.dateModified,
    };

_Processed _$ProcessedFromJson(Map<String, dynamic> json) => _Processed(
      success: (json['success'] as List<dynamic>)
          .map((e) => ProcessedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ProcessedError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProcessedToJson(_Processed instance) =>
    <String, dynamic>{
      'success': instance.success.map((e) => e.toJson()).toList(),
      'errors': instance.errors.map((e) => e.toJson()).toList(),
    };

_ProcessedItem _$ProcessedItemFromJson(Map<String, dynamic> json) =>
    _ProcessedItem(
      item: json['item'] as String,
    );

Map<String, dynamic> _$ProcessedItemToJson(_ProcessedItem instance) =>
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
