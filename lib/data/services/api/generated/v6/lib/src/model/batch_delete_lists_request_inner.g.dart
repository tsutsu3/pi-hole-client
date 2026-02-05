// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_delete_lists_request_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BatchDeleteListsRequestInnerCWProxy {
  BatchDeleteListsRequestInner item(String? item);

  BatchDeleteListsRequestInner type(BatchDeleteListsRequestInnerTypeEnum? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatchDeleteListsRequestInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatchDeleteListsRequestInner(...).copyWith(id: 12, name: "My name")
  /// ````
  BatchDeleteListsRequestInner call({
    String? item,
    BatchDeleteListsRequestInnerTypeEnum? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBatchDeleteListsRequestInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBatchDeleteListsRequestInner.copyWith.fieldName(...)`
class _$BatchDeleteListsRequestInnerCWProxyImpl
    implements _$BatchDeleteListsRequestInnerCWProxy {
  const _$BatchDeleteListsRequestInnerCWProxyImpl(this._value);

  final BatchDeleteListsRequestInner _value;

  @override
  BatchDeleteListsRequestInner item(String? item) => this(item: item);

  @override
  BatchDeleteListsRequestInner type(
    BatchDeleteListsRequestInnerTypeEnum? type,
  ) => this(type: type);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatchDeleteListsRequestInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatchDeleteListsRequestInner(...).copyWith(id: 12, name: "My name")
  /// ````
  BatchDeleteListsRequestInner call({
    Object? item = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return BatchDeleteListsRequestInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as BatchDeleteListsRequestInnerTypeEnum?,
    );
  }
}

extension $BatchDeleteListsRequestInnerCopyWith
    on BatchDeleteListsRequestInner {
  /// Returns a callable class that can be used as follows: `instanceOfBatchDeleteListsRequestInner.copyWith(...)` or like so:`instanceOfBatchDeleteListsRequestInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BatchDeleteListsRequestInnerCWProxy get copyWith =>
      _$BatchDeleteListsRequestInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteListsRequestInner _$BatchDeleteListsRequestInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BatchDeleteListsRequestInner', json, ($checkedConvert) {
  final val = BatchDeleteListsRequestInner(
    item: $checkedConvert('item', (v) => v as String?),
    type: $checkedConvert(
      'type',
      (v) =>
          $enumDecodeNullable(_$BatchDeleteListsRequestInnerTypeEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$BatchDeleteListsRequestInnerToJson(
  BatchDeleteListsRequestInner instance,
) => <String, dynamic>{
  'item': ?instance.item,
  'type': ?_$BatchDeleteListsRequestInnerTypeEnumEnumMap[instance.type],
};

const _$BatchDeleteListsRequestInnerTypeEnumEnumMap = {
  BatchDeleteListsRequestInnerTypeEnum.allow: 'allow',
  BatchDeleteListsRequestInnerTypeEnum.block: 'block',
};
