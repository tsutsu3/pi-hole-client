// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_delete_groups_request_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BatchDeleteGroupsRequestInnerCWProxy {
  BatchDeleteGroupsRequestInner item(String item);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatchDeleteGroupsRequestInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatchDeleteGroupsRequestInner(...).copyWith(id: 12, name: "My name")
  /// ````
  BatchDeleteGroupsRequestInner call({String item});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBatchDeleteGroupsRequestInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBatchDeleteGroupsRequestInner.copyWith.fieldName(...)`
class _$BatchDeleteGroupsRequestInnerCWProxyImpl
    implements _$BatchDeleteGroupsRequestInnerCWProxy {
  const _$BatchDeleteGroupsRequestInnerCWProxyImpl(this._value);

  final BatchDeleteGroupsRequestInner _value;

  @override
  BatchDeleteGroupsRequestInner item(String item) => this(item: item);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatchDeleteGroupsRequestInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatchDeleteGroupsRequestInner(...).copyWith(id: 12, name: "My name")
  /// ````
  BatchDeleteGroupsRequestInner call({
    Object? item = const $CopyWithPlaceholder(),
  }) {
    return BatchDeleteGroupsRequestInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String,
    );
  }
}

extension $BatchDeleteGroupsRequestInnerCopyWith
    on BatchDeleteGroupsRequestInner {
  /// Returns a callable class that can be used as follows: `instanceOfBatchDeleteGroupsRequestInner.copyWith(...)` or like so:`instanceOfBatchDeleteGroupsRequestInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BatchDeleteGroupsRequestInnerCWProxy get copyWith =>
      _$BatchDeleteGroupsRequestInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteGroupsRequestInner _$BatchDeleteGroupsRequestInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BatchDeleteGroupsRequestInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['item']);
  final val = BatchDeleteGroupsRequestInner(
    item: $checkedConvert('item', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$BatchDeleteGroupsRequestInnerToJson(
  BatchDeleteGroupsRequestInner instance,
) => <String, dynamic>{'item': instance.item};
