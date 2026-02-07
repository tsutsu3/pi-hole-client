// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_domains_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetDomainsInnerCWProxy {
  GetDomainsInner domain(String? domain);

  GetDomainsInner unicode(String? unicode);

  GetDomainsInner type(GetDomainsInnerTypeEnum? type);

  GetDomainsInner kind(GetDomainsInnerKindEnum? kind);

  GetDomainsInner comment(String? comment);

  GetDomainsInner groups(List<int>? groups);

  GetDomainsInner enabled(bool? enabled);

  GetDomainsInner id(int? id);

  GetDomainsInner dateAdded(int? dateAdded);

  GetDomainsInner dateModified(int? dateModified);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDomainsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDomainsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDomainsInner call({
    String? domain,
    String? unicode,
    GetDomainsInnerTypeEnum? type,
    GetDomainsInnerKindEnum? kind,
    String? comment,
    List<int>? groups,
    bool? enabled,
    int? id,
    int? dateAdded,
    int? dateModified,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetDomainsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetDomainsInner.copyWith.fieldName(...)`
class _$GetDomainsInnerCWProxyImpl implements _$GetDomainsInnerCWProxy {
  const _$GetDomainsInnerCWProxyImpl(this._value);

  final GetDomainsInner _value;

  @override
  GetDomainsInner domain(String? domain) => this(domain: domain);

  @override
  GetDomainsInner unicode(String? unicode) => this(unicode: unicode);

  @override
  GetDomainsInner type(GetDomainsInnerTypeEnum? type) => this(type: type);

  @override
  GetDomainsInner kind(GetDomainsInnerKindEnum? kind) => this(kind: kind);

  @override
  GetDomainsInner comment(String? comment) => this(comment: comment);

  @override
  GetDomainsInner groups(List<int>? groups) => this(groups: groups);

  @override
  GetDomainsInner enabled(bool? enabled) => this(enabled: enabled);

  @override
  GetDomainsInner id(int? id) => this(id: id);

  @override
  GetDomainsInner dateAdded(int? dateAdded) => this(dateAdded: dateAdded);

  @override
  GetDomainsInner dateModified(int? dateModified) =>
      this(dateModified: dateModified);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDomainsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDomainsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDomainsInner call({
    Object? domain = const $CopyWithPlaceholder(),
    Object? unicode = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? dateAdded = const $CopyWithPlaceholder(),
    Object? dateModified = const $CopyWithPlaceholder(),
  }) {
    return GetDomainsInner(
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String?,
      unicode: unicode == const $CopyWithPlaceholder()
          ? _value.unicode
          // ignore: cast_nullable_to_non_nullable
          : unicode as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as GetDomainsInnerTypeEnum?,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as GetDomainsInnerKindEnum?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<int>?,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
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
    );
  }
}

extension $GetDomainsInnerCopyWith on GetDomainsInner {
  /// Returns a callable class that can be used as follows: `instanceOfGetDomainsInner.copyWith(...)` or like so:`instanceOfGetDomainsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetDomainsInnerCWProxy get copyWith => _$GetDomainsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDomainsInner _$GetDomainsInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GetDomainsInner',
      json,
      ($checkedConvert) {
        final val = GetDomainsInner(
          domain: $checkedConvert('domain', (v) => v as String?),
          unicode: $checkedConvert('unicode', (v) => v as String?),
          type: $checkedConvert(
            'type',
            (v) => $enumDecodeNullable(_$GetDomainsInnerTypeEnumEnumMap, v),
          ),
          kind: $checkedConvert(
            'kind',
            (v) => $enumDecodeNullable(_$GetDomainsInnerKindEnumEnumMap, v),
          ),
          comment: $checkedConvert('comment', (v) => v as String?),
          groups: $checkedConvert(
            'groups',
            (v) =>
                (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
          ),
          enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          dateAdded: $checkedConvert('date_added', (v) => (v as num?)?.toInt()),
          dateModified: $checkedConvert(
            'date_modified',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'dateAdded': 'date_added',
        'dateModified': 'date_modified',
      },
    );

Map<String, dynamic> _$GetDomainsInnerToJson(GetDomainsInner instance) =>
    <String, dynamic>{
      'domain': ?instance.domain,
      'unicode': ?instance.unicode,
      'type': ?_$GetDomainsInnerTypeEnumEnumMap[instance.type],
      'kind': ?_$GetDomainsInnerKindEnumEnumMap[instance.kind],
      'comment': ?instance.comment,
      'groups': ?instance.groups,
      'enabled': ?instance.enabled,
      'id': ?instance.id,
      'date_added': ?instance.dateAdded,
      'date_modified': ?instance.dateModified,
    };

const _$GetDomainsInnerTypeEnumEnumMap = {
  GetDomainsInnerTypeEnum.allow: 'allow',
  GetDomainsInnerTypeEnum.deny: 'deny',
};

const _$GetDomainsInnerKindEnumEnumMap = {
  GetDomainsInnerKindEnum.exact: 'exact',
  GetDomainsInnerKindEnum.regex: 'regex',
};
