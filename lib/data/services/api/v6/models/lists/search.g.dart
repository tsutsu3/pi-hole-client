// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Search _$SearchFromJson(Map<String, dynamic> json) => _Search(
      search: SearchData.fromJson(json['search'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchToJson(_Search instance) => <String, dynamic>{
      'search': instance.search,
      'took': instance.took,
    };

_SearchData _$SearchDataFromJson(Map<String, dynamic> json) => _SearchData(
      domains: (json['domains'] as List<dynamic>)
          .map((e) => DomainEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      gravity: (json['gravity'] as List<dynamic>)
          .map((e) => GravityEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameters:
          SearchParameters.fromJson(json['parameters'] as Map<String, dynamic>),
      results: SearchResults.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchDataToJson(_SearchData instance) =>
    <String, dynamic>{
      'domains': instance.domains,
      'gravity': instance.gravity,
      'parameters': instance.parameters,
      'results': instance.results,
    };

_DomainEntry _$DomainEntryFromJson(Map<String, dynamic> json) => _DomainEntry(
      domain: json['domain'] as String,
      enabled: json['enabled'] as bool,
      type: $enumDecode(_$DomainTypeEnumMap, json['type']),
      kind: $enumDecode(_$DomainKindEnumMap, json['kind']),
      id: (json['id'] as num).toInt(),
      dateAdded: (json['date_added'] as num).toInt(),
      dateModified: (json['date_modified'] as num).toInt(),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$DomainEntryToJson(_DomainEntry instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'enabled': instance.enabled,
      'type': _$DomainTypeEnumMap[instance.type]!,
      'kind': _$DomainKindEnumMap[instance.kind]!,
      'id': instance.id,
      'date_added': instance.dateAdded,
      'date_modified': instance.dateModified,
      'groups': instance.groups,
      'comment': instance.comment,
    };

const _$DomainTypeEnumMap = {
  DomainType.allow: 'allow',
  DomainType.deny: 'deny',
};

const _$DomainKindEnumMap = {
  DomainKind.exact: 'exact',
  DomainKind.regex: 'regex',
};

_GravityEntry _$GravityEntryFromJson(Map<String, dynamic> json) =>
    _GravityEntry(
      domain: json['domain'] as String,
      address: json['address'] as String,
      enabled: json['enabled'] as bool,
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$GravityTypeEnumMap, json['type']),
      dateAdded: (json['date_added'] as num).toInt(),
      dateModified: (json['date_modified'] as num).toInt(),
      dateUpdated: (json['date_updated'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      invalidDomains: (json['invalid_domains'] as num).toInt(),
      abpEntries: (json['abp_entries'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$GravityEntryToJson(_GravityEntry instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'address': instance.address,
      'enabled': instance.enabled,
      'id': instance.id,
      'type': _$GravityTypeEnumMap[instance.type]!,
      'date_added': instance.dateAdded,
      'date_modified': instance.dateModified,
      'date_updated': instance.dateUpdated,
      'number': instance.number,
      'invalid_domains': instance.invalidDomains,
      'abp_entries': instance.abpEntries,
      'status': instance.status,
      'groups': instance.groups,
      'comment': instance.comment,
    };

const _$GravityTypeEnumMap = {
  GravityType.allow: 'allow',
  GravityType.block: 'block',
};

_SearchParameters _$SearchParametersFromJson(Map<String, dynamic> json) =>
    _SearchParameters(
      partial: json['partial'] as bool,
      N: (json['N'] as num).toInt(),
      domain: json['domain'] as String,
      debug: json['debug'] as bool,
    );

Map<String, dynamic> _$SearchParametersToJson(_SearchParameters instance) =>
    <String, dynamic>{
      'partial': instance.partial,
      'N': instance.N,
      'domain': instance.domain,
      'debug': instance.debug,
    };

_SearchResults _$SearchResultsFromJson(Map<String, dynamic> json) =>
    _SearchResults(
      domains:
          DomainMatchCount.fromJson(json['domains'] as Map<String, dynamic>),
      gravity:
          GravityMatchCount.fromJson(json['gravity'] as Map<String, dynamic>),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$SearchResultsToJson(_SearchResults instance) =>
    <String, dynamic>{
      'domains': instance.domains,
      'gravity': instance.gravity,
      'total': instance.total,
    };

_DomainMatchCount _$DomainMatchCountFromJson(Map<String, dynamic> json) =>
    _DomainMatchCount(
      exact: (json['exact'] as num).toInt(),
      regex: (json['regex'] as num).toInt(),
    );

Map<String, dynamic> _$DomainMatchCountToJson(_DomainMatchCount instance) =>
    <String, dynamic>{
      'exact': instance.exact,
      'regex': instance.regex,
    };

_GravityMatchCount _$GravityMatchCountFromJson(Map<String, dynamic> json) =>
    _GravityMatchCount(
      allow: (json['allow'] as num).toInt(),
      block: (json['block'] as num).toInt(),
    );

Map<String, dynamic> _$GravityMatchCountToJson(_GravityMatchCount instance) =>
    <String, dynamic>{
      'allow': instance.allow,
      'block': instance.block,
    };
