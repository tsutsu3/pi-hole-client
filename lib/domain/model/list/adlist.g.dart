// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Adlist _$AdlistFromJson(Map<String, dynamic> json) => _Adlist(
  address: json['address'] as String,
  type: $enumDecode(_$ListTypeEnumMap, json['type']),
  groups: (json['groups'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  enabled: json['enabled'] as bool,
  id: (json['id'] as num).toInt(),
  dateAdded: DateTime.parse(json['dateAdded'] as String),
  dateModified: DateTime.parse(json['dateModified'] as String),
  dateUpdated: DateTime.parse(json['dateUpdated'] as String),
  number: (json['number'] as num).toInt(),
  invalidDomains: (json['invalidDomains'] as num).toInt(),
  abpEntries: (json['abpEntries'] as num).toInt(),
  status: $enumDecode(_$ListsStatusEnumMap, json['status']),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$AdlistToJson(_Adlist instance) => <String, dynamic>{
  'address': instance.address,
  'type': _$ListTypeEnumMap[instance.type]!,
  'groups': instance.groups,
  'enabled': instance.enabled,
  'id': instance.id,
  'dateAdded': instance.dateAdded.toIso8601String(),
  'dateModified': instance.dateModified.toIso8601String(),
  'dateUpdated': instance.dateUpdated.toIso8601String(),
  'number': instance.number,
  'invalidDomains': instance.invalidDomains,
  'abpEntries': instance.abpEntries,
  'status': _$ListsStatusEnumMap[instance.status]!,
  'comment': instance.comment,
};

const _$ListTypeEnumMap = {ListType.allow: 'allow', ListType.block: 'block'};

const _$ListsStatusEnumMap = {
  ListsStatus.notDownloaded: 'notDownloaded',
  ListsStatus.downloaded: 'downloaded',
  ListsStatus.unchanged: 'unchanged',
  ListsStatus.unavailableCached: 'unavailableCached',
  ListsStatus.unavailableNoCache: 'unavailableNoCache',
  ListsStatus.unknown: 'unknown',
};
