// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_delete_domains_request_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BatchDeleteDomainsRequestInnerCWProxy {
  BatchDeleteDomainsRequestInner item(String item);

  BatchDeleteDomainsRequestInner type(
    BatchDeleteDomainsRequestInnerTypeEnum type,
  );

  BatchDeleteDomainsRequestInner kind(
    BatchDeleteDomainsRequestInnerKindEnum kind,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatchDeleteDomainsRequestInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatchDeleteDomainsRequestInner(...).copyWith(id: 12, name: "My name")
  /// ````
  BatchDeleteDomainsRequestInner call({
    String item,
    BatchDeleteDomainsRequestInnerTypeEnum type,
    BatchDeleteDomainsRequestInnerKindEnum kind,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBatchDeleteDomainsRequestInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBatchDeleteDomainsRequestInner.copyWith.fieldName(...)`
class _$BatchDeleteDomainsRequestInnerCWProxyImpl
    implements _$BatchDeleteDomainsRequestInnerCWProxy {
  const _$BatchDeleteDomainsRequestInnerCWProxyImpl(this._value);

  final BatchDeleteDomainsRequestInner _value;

  @override
  BatchDeleteDomainsRequestInner item(String item) => this(item: item);

  @override
  BatchDeleteDomainsRequestInner type(
    BatchDeleteDomainsRequestInnerTypeEnum type,
  ) => this(type: type);

  @override
  BatchDeleteDomainsRequestInner kind(
    BatchDeleteDomainsRequestInnerKindEnum kind,
  ) => this(kind: kind);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatchDeleteDomainsRequestInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatchDeleteDomainsRequestInner(...).copyWith(id: 12, name: "My name")
  /// ````
  BatchDeleteDomainsRequestInner call({
    Object? item = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
  }) {
    return BatchDeleteDomainsRequestInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as BatchDeleteDomainsRequestInnerTypeEnum,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as BatchDeleteDomainsRequestInnerKindEnum,
    );
  }
}

extension $BatchDeleteDomainsRequestInnerCopyWith
    on BatchDeleteDomainsRequestInner {
  /// Returns a callable class that can be used as follows: `instanceOfBatchDeleteDomainsRequestInner.copyWith(...)` or like so:`instanceOfBatchDeleteDomainsRequestInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BatchDeleteDomainsRequestInnerCWProxy get copyWith =>
      _$BatchDeleteDomainsRequestInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteDomainsRequestInner _$BatchDeleteDomainsRequestInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BatchDeleteDomainsRequestInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['item', 'type', 'kind']);
  final val = BatchDeleteDomainsRequestInner(
    item: $checkedConvert('item', (v) => v as String),
    type: $checkedConvert(
      'type',
      (v) => $enumDecode(_$BatchDeleteDomainsRequestInnerTypeEnumEnumMap, v),
    ),
    kind: $checkedConvert(
      'kind',
      (v) => $enumDecode(_$BatchDeleteDomainsRequestInnerKindEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$BatchDeleteDomainsRequestInnerToJson(
  BatchDeleteDomainsRequestInner instance,
) => <String, dynamic>{
  'item': instance.item,
  'type': _$BatchDeleteDomainsRequestInnerTypeEnumEnumMap[instance.type]!,
  'kind': _$BatchDeleteDomainsRequestInnerKindEnumEnumMap[instance.kind]!,
};

const _$BatchDeleteDomainsRequestInnerTypeEnumEnumMap = {
  BatchDeleteDomainsRequestInnerTypeEnum.allow: 'allow',
  BatchDeleteDomainsRequestInnerTypeEnum.deny: 'deny',
};

const _$BatchDeleteDomainsRequestInnerKindEnumEnumMap = {
  BatchDeleteDomainsRequestInnerKindEnum.exact: 'exact',
  BatchDeleteDomainsRequestInnerKindEnum.regex: 'regex',
};
