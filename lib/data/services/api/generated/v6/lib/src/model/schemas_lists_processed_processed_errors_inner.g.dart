// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_lists_processed_processed_errors_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasListsProcessedProcessedErrorsInnerCWProxy {
  SchemasListsProcessedProcessedErrorsInner item(String? item);

  SchemasListsProcessedProcessedErrorsInner error(String? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasListsProcessedProcessedErrorsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasListsProcessedProcessedErrorsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasListsProcessedProcessedErrorsInner call({String? item, String? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasListsProcessedProcessedErrorsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasListsProcessedProcessedErrorsInner.copyWith.fieldName(...)`
class _$SchemasListsProcessedProcessedErrorsInnerCWProxyImpl
    implements _$SchemasListsProcessedProcessedErrorsInnerCWProxy {
  const _$SchemasListsProcessedProcessedErrorsInnerCWProxyImpl(this._value);

  final SchemasListsProcessedProcessedErrorsInner _value;

  @override
  SchemasListsProcessedProcessedErrorsInner item(String? item) =>
      this(item: item);

  @override
  SchemasListsProcessedProcessedErrorsInner error(String? error) =>
      this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasListsProcessedProcessedErrorsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasListsProcessedProcessedErrorsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasListsProcessedProcessedErrorsInner call({
    Object? item = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return SchemasListsProcessedProcessedErrorsInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String?,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String?,
    );
  }
}

extension $SchemasListsProcessedProcessedErrorsInnerCopyWith
    on SchemasListsProcessedProcessedErrorsInner {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasListsProcessedProcessedErrorsInner.copyWith(...)` or like so:`instanceOfSchemasListsProcessedProcessedErrorsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasListsProcessedProcessedErrorsInnerCWProxy get copyWith =>
      _$SchemasListsProcessedProcessedErrorsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasListsProcessedProcessedErrorsInner
_$SchemasListsProcessedProcessedErrorsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SchemasListsProcessedProcessedErrorsInner', json, (
  $checkedConvert,
) {
  final val = SchemasListsProcessedProcessedErrorsInner(
    item: $checkedConvert('item', (v) => v as String?),
    error: $checkedConvert('error', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SchemasListsProcessedProcessedErrorsInnerToJson(
  SchemasListsProcessedProcessedErrorsInner instance,
) => <String, dynamic>{'item': ?instance.item, 'error': ?instance.error};
