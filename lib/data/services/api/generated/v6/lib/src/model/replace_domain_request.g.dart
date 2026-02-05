// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_domain_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReplaceDomainRequestCWProxy {
  ReplaceDomainRequest type(ReplaceDomainRequestTypeEnum? type);

  ReplaceDomainRequest kind(ReplaceDomainRequestKindEnum? kind);

  ReplaceDomainRequest comment(String? comment);

  ReplaceDomainRequest groups(List<int>? groups);

  ReplaceDomainRequest enabled(bool? enabled);

  ReplaceDomainRequest took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceDomainRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceDomainRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceDomainRequest call({
    ReplaceDomainRequestTypeEnum? type,
    ReplaceDomainRequestKindEnum? kind,
    String? comment,
    List<int>? groups,
    bool? enabled,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReplaceDomainRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReplaceDomainRequest.copyWith.fieldName(...)`
class _$ReplaceDomainRequestCWProxyImpl
    implements _$ReplaceDomainRequestCWProxy {
  const _$ReplaceDomainRequestCWProxyImpl(this._value);

  final ReplaceDomainRequest _value;

  @override
  ReplaceDomainRequest type(ReplaceDomainRequestTypeEnum? type) =>
      this(type: type);

  @override
  ReplaceDomainRequest kind(ReplaceDomainRequestKindEnum? kind) =>
      this(kind: kind);

  @override
  ReplaceDomainRequest comment(String? comment) => this(comment: comment);

  @override
  ReplaceDomainRequest groups(List<int>? groups) => this(groups: groups);

  @override
  ReplaceDomainRequest enabled(bool? enabled) => this(enabled: enabled);

  @override
  ReplaceDomainRequest took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceDomainRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceDomainRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceDomainRequest call({
    Object? type = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ReplaceDomainRequest(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ReplaceDomainRequestTypeEnum?,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as ReplaceDomainRequestKindEnum?,
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
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ReplaceDomainRequestCopyWith on ReplaceDomainRequest {
  /// Returns a callable class that can be used as follows: `instanceOfReplaceDomainRequest.copyWith(...)` or like so:`instanceOfReplaceDomainRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReplaceDomainRequestCWProxy get copyWith =>
      _$ReplaceDomainRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceDomainRequest _$ReplaceDomainRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReplaceDomainRequest', json, ($checkedConvert) {
  final val = ReplaceDomainRequest(
    type: $checkedConvert(
      'type',
      (v) => $enumDecodeNullable(_$ReplaceDomainRequestTypeEnumEnumMap, v),
    ),
    kind: $checkedConvert(
      'kind',
      (v) => $enumDecodeNullable(_$ReplaceDomainRequestKindEnumEnumMap, v),
    ),
    comment: $checkedConvert('comment', (v) => v as String?),
    groups: $checkedConvert(
      'groups',
      (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
    ),
    enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ReplaceDomainRequestToJson(
  ReplaceDomainRequest instance,
) => <String, dynamic>{
  'type': ?_$ReplaceDomainRequestTypeEnumEnumMap[instance.type],
  'kind': ?_$ReplaceDomainRequestKindEnumEnumMap[instance.kind],
  'comment': ?instance.comment,
  'groups': ?instance.groups,
  'enabled': ?instance.enabled,
  'took': ?instance.took,
};

const _$ReplaceDomainRequestTypeEnumEnumMap = {
  ReplaceDomainRequestTypeEnum.allow: 'allow',
  ReplaceDomainRequestTypeEnum.deny: 'deny',
};

const _$ReplaceDomainRequestKindEnumEnumMap = {
  ReplaceDomainRequestKindEnum.exact: 'exact',
  ReplaceDomainRequestKindEnum.regex: 'regex',
};
