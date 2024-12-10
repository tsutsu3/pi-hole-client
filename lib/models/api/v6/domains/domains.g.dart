// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainsImpl _$$DomainsImplFromJson(Map<String, dynamic> json) =>
    _$DomainsImpl(
      domains: (json['domains'] as List<dynamic>)
          .map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$DomainsImplToJson(_$DomainsImpl instance) =>
    <String, dynamic>{
      'domains': instance.domains,
      'took': instance.took,
    };

_$AddDomainsImpl _$$AddDomainsImplFromJson(Map<String, dynamic> json) =>
    _$AddDomainsImpl(
      domains: (json['domains'] as List<dynamic>)
          .map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
      processed: Processed.fromJson(json['processed'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddDomainsImplToJson(_$AddDomainsImpl instance) =>
    <String, dynamic>{
      'domains': instance.domains,
      'processed': instance.processed,
      'took': instance.took,
    };

_$DomainImpl _$$DomainImplFromJson(Map<String, dynamic> json) => _$DomainImpl(
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

Map<String, dynamic> _$$DomainImplToJson(_$DomainImpl instance) =>
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

_$ProcessedImpl _$$ProcessedImplFromJson(Map<String, dynamic> json) =>
    _$ProcessedImpl(
      success: (json['success'] as List<dynamic>)
          .map((e) => ProcessedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>)
          .map((e) => ProcessedError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProcessedImplToJson(_$ProcessedImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
    };

_$ProcessedItemImpl _$$ProcessedItemImplFromJson(Map<String, dynamic> json) =>
    _$ProcessedItemImpl(
      item: json['item'] as String,
    );

Map<String, dynamic> _$$ProcessedItemImplToJson(_$ProcessedItemImpl instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_$ProcessedErrorImpl _$$ProcessedErrorImplFromJson(Map<String, dynamic> json) =>
    _$ProcessedErrorImpl(
      item: json['item'] as String,
      error: json['error'] as String,
    );

Map<String, dynamic> _$$ProcessedErrorImplToJson(
        _$ProcessedErrorImpl instance) =>
    <String, dynamic>{
      'item': instance.item,
      'error': instance.error,
    };
