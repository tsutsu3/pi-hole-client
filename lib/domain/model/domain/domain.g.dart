// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DomainLists _$DomainListsFromJson(Map<String, dynamic> json) => _DomainLists(
  allowExact: (json['allowExact'] as List<dynamic>)
      .map((e) => Domain.fromJson(e as Map<String, dynamic>))
      .toList(),
  allowRegex: (json['allowRegex'] as List<dynamic>)
      .map((e) => Domain.fromJson(e as Map<String, dynamic>))
      .toList(),
  denyExact: (json['denyExact'] as List<dynamic>)
      .map((e) => Domain.fromJson(e as Map<String, dynamic>))
      .toList(),
  denyRegex: (json['denyRegex'] as List<dynamic>)
      .map((e) => Domain.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DomainListsToJson(_DomainLists instance) =>
    <String, dynamic>{
      'allowExact': instance.allowExact.map((e) => e.toJson()).toList(),
      'allowRegex': instance.allowRegex.map((e) => e.toJson()).toList(),
      'denyExact': instance.denyExact.map((e) => e.toJson()).toList(),
      'denyRegex': instance.denyRegex.map((e) => e.toJson()).toList(),
    };

_Domain _$DomainFromJson(Map<String, dynamic> json) => _Domain(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  punyCode: json['punyCode'] as String,
  type: $enumDecode(_$DomainTypeEnumMap, json['type']),
  kind: $enumDecode(_$DomainKindEnumMap, json['kind']),
  comment: json['comment'] as String?,
  groups: (json['groups'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  enabled: json['enabled'] as bool,
  dateAdded: DateTime.parse(json['dateAdded'] as String),
  dateModified: DateTime.parse(json['dateModified'] as String),
);

Map<String, dynamic> _$DomainToJson(_Domain instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'punyCode': instance.punyCode,
  'type': _$DomainTypeEnumMap[instance.type]!,
  'kind': _$DomainKindEnumMap[instance.kind]!,
  'comment': instance.comment,
  'groups': instance.groups,
  'enabled': instance.enabled,
  'dateAdded': instance.dateAdded.toIso8601String(),
  'dateModified': instance.dateModified.toIso8601String(),
};

const _$DomainTypeEnumMap = {
  DomainType.allow: 'allow',
  DomainType.deny: 'deny',
};

const _$DomainKindEnumMap = {
  DomainKind.exact: 'exact',
  DomainKind.regex: 'regex',
};
