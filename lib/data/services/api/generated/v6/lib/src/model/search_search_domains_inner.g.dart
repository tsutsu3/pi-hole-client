// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_search_domains_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchSearchDomainsInnerCWProxy {
  SearchSearchDomainsInner domain(String? domain);

  SearchSearchDomainsInner comment(String? comment);

  SearchSearchDomainsInner enabled(bool? enabled);

  SearchSearchDomainsInner type(SearchSearchDomainsInnerTypeEnum? type);

  SearchSearchDomainsInner kind(SearchSearchDomainsInnerKindEnum? kind);

  SearchSearchDomainsInner id(int? id);

  SearchSearchDomainsInner dateAdded(int? dateAdded);

  SearchSearchDomainsInner dateModified(int? dateModified);

  SearchSearchDomainsInner groups(List<int>? groups);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchDomainsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchDomainsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchDomainsInner call({
    String? domain,
    String? comment,
    bool? enabled,
    SearchSearchDomainsInnerTypeEnum? type,
    SearchSearchDomainsInnerKindEnum? kind,
    int? id,
    int? dateAdded,
    int? dateModified,
    List<int>? groups,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchSearchDomainsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchSearchDomainsInner.copyWith.fieldName(...)`
class _$SearchSearchDomainsInnerCWProxyImpl
    implements _$SearchSearchDomainsInnerCWProxy {
  const _$SearchSearchDomainsInnerCWProxyImpl(this._value);

  final SearchSearchDomainsInner _value;

  @override
  SearchSearchDomainsInner domain(String? domain) => this(domain: domain);

  @override
  SearchSearchDomainsInner comment(String? comment) => this(comment: comment);

  @override
  SearchSearchDomainsInner enabled(bool? enabled) => this(enabled: enabled);

  @override
  SearchSearchDomainsInner type(SearchSearchDomainsInnerTypeEnum? type) =>
      this(type: type);

  @override
  SearchSearchDomainsInner kind(SearchSearchDomainsInnerKindEnum? kind) =>
      this(kind: kind);

  @override
  SearchSearchDomainsInner id(int? id) => this(id: id);

  @override
  SearchSearchDomainsInner dateAdded(int? dateAdded) =>
      this(dateAdded: dateAdded);

  @override
  SearchSearchDomainsInner dateModified(int? dateModified) =>
      this(dateModified: dateModified);

  @override
  SearchSearchDomainsInner groups(List<int>? groups) => this(groups: groups);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchDomainsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchDomainsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchDomainsInner call({
    Object? domain = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? dateAdded = const $CopyWithPlaceholder(),
    Object? dateModified = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
  }) {
    return SearchSearchDomainsInner(
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as SearchSearchDomainsInnerTypeEnum?,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as SearchSearchDomainsInnerKindEnum?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      dateAdded: dateAdded == const $CopyWithPlaceholder()
          ? _value.dateAdded
          // ignore: cast_nullable_to_non_nullable
          : dateAdded as int?,
      dateModified: dateModified == const $CopyWithPlaceholder()
          ? _value.dateModified
          // ignore: cast_nullable_to_non_nullable
          : dateModified as int?,
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<int>?,
    );
  }
}

extension $SearchSearchDomainsInnerCopyWith on SearchSearchDomainsInner {
  /// Returns a callable class that can be used as follows: `instanceOfSearchSearchDomainsInner.copyWith(...)` or like so:`instanceOfSearchSearchDomainsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchSearchDomainsInnerCWProxy get copyWith =>
      _$SearchSearchDomainsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSearchDomainsInner _$SearchSearchDomainsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SearchSearchDomainsInner',
  json,
  ($checkedConvert) {
    final val = SearchSearchDomainsInner(
      domain: $checkedConvert('domain', (v) => v as String?),
      comment: $checkedConvert('comment', (v) => v as String?),
      enabled: $checkedConvert('enabled', (v) => v as bool?),
      type: $checkedConvert(
        'type',
        (v) =>
            $enumDecodeNullable(_$SearchSearchDomainsInnerTypeEnumEnumMap, v),
      ),
      kind: $checkedConvert(
        'kind',
        (v) =>
            $enumDecodeNullable(_$SearchSearchDomainsInnerKindEnumEnumMap, v),
      ),
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      dateAdded: $checkedConvert('date_added', (v) => (v as num?)?.toInt()),
      dateModified: $checkedConvert(
        'date_modified',
        (v) => (v as num?)?.toInt(),
      ),
      groups: $checkedConvert(
        'groups',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dateAdded': 'date_added',
    'dateModified': 'date_modified',
  },
);

Map<String, dynamic> _$SearchSearchDomainsInnerToJson(
  SearchSearchDomainsInner instance,
) => <String, dynamic>{
  'domain': ?instance.domain,
  'comment': ?instance.comment,
  'enabled': ?instance.enabled,
  'type': ?_$SearchSearchDomainsInnerTypeEnumEnumMap[instance.type],
  'kind': ?_$SearchSearchDomainsInnerKindEnumEnumMap[instance.kind],
  'id': ?instance.id,
  'date_added': ?instance.dateAdded,
  'date_modified': ?instance.dateModified,
  'groups': ?instance.groups,
};

const _$SearchSearchDomainsInnerTypeEnumEnumMap = {
  SearchSearchDomainsInnerTypeEnum.allow: 'allow',
  SearchSearchDomainsInnerTypeEnum.deny: 'deny',
};

const _$SearchSearchDomainsInnerKindEnumEnumMap = {
  SearchSearchDomainsInnerKindEnum.exact: 'exact',
  SearchSearchDomainsInnerKindEnum.regex: 'regex',
};
