// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_lists_processed_processed_success_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasListsProcessedProcessedSuccessInnerCWProxy {
  SchemasListsProcessedProcessedSuccessInner item(String? item);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasListsProcessedProcessedSuccessInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasListsProcessedProcessedSuccessInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasListsProcessedProcessedSuccessInner call({String? item});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasListsProcessedProcessedSuccessInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasListsProcessedProcessedSuccessInner.copyWith.fieldName(...)`
class _$SchemasListsProcessedProcessedSuccessInnerCWProxyImpl
    implements _$SchemasListsProcessedProcessedSuccessInnerCWProxy {
  const _$SchemasListsProcessedProcessedSuccessInnerCWProxyImpl(this._value);

  final SchemasListsProcessedProcessedSuccessInner _value;

  @override
  SchemasListsProcessedProcessedSuccessInner item(String? item) =>
      this(item: item);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasListsProcessedProcessedSuccessInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasListsProcessedProcessedSuccessInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasListsProcessedProcessedSuccessInner call({
    Object? item = const $CopyWithPlaceholder(),
  }) {
    return SchemasListsProcessedProcessedSuccessInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String?,
    );
  }
}

extension $SchemasListsProcessedProcessedSuccessInnerCopyWith
    on SchemasListsProcessedProcessedSuccessInner {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasListsProcessedProcessedSuccessInner.copyWith(...)` or like so:`instanceOfSchemasListsProcessedProcessedSuccessInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasListsProcessedProcessedSuccessInnerCWProxy get copyWith =>
      _$SchemasListsProcessedProcessedSuccessInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasListsProcessedProcessedSuccessInner
_$SchemasListsProcessedProcessedSuccessInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SchemasListsProcessedProcessedSuccessInner', json, (
  $checkedConvert,
) {
  final val = SchemasListsProcessedProcessedSuccessInner(
    item: $checkedConvert('item', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SchemasListsProcessedProcessedSuccessInnerToJson(
  SchemasListsProcessedProcessedSuccessInner instance,
) => <String, dynamic>{'item': ?instance.item};
