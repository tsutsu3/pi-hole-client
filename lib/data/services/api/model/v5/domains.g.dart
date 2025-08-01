// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Domains _$DomainsFromJson(Map<String, dynamic> json) => _Domains(
      data: (json['data'] as List<dynamic>)
          .map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DomainsToJson(_Domains instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_Domain _$DomainFromJson(Map<String, dynamic> json) => _Domain(
      id: (json['id'] as num).toInt(),
      type: (json['type'] as num).toInt(),
      domain: json['domain'] as String,
      enabled: (json['enabled'] as num).toInt(),
      dateAdded: (json['date_added'] as num).toInt(),
      dateModified: (json['date_modified'] as num).toInt(),
      comment: json['comment'] as String,
      groups: (json['groups'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$DomainToJson(_Domain instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'domain': instance.domain,
      'enabled': instance.enabled,
      'date_added': instance.dateAdded,
      'date_modified': instance.dateModified,
      'comment': instance.comment,
      'groups': instance.groups,
    };

_DomainResponse _$DomainResponseFromJson(Map<String, dynamic> json) =>
    _DomainResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DomainResponseToJson(_DomainResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
