// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components_schemas_lists_processed_processed_errors_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ComponentsSchemasListsProcessedProcessedErrorsInnerCWProxy {
  ComponentsSchemasListsProcessedProcessedErrorsInner item(String? item);

  ComponentsSchemasListsProcessedProcessedErrorsInner error(String? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasListsProcessedProcessedErrorsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasListsProcessedProcessedErrorsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasListsProcessedProcessedErrorsInner call({
    String? item,
    String? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfComponentsSchemasListsProcessedProcessedErrorsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfComponentsSchemasListsProcessedProcessedErrorsInner.copyWith.fieldName(...)`
class _$ComponentsSchemasListsProcessedProcessedErrorsInnerCWProxyImpl
    implements _$ComponentsSchemasListsProcessedProcessedErrorsInnerCWProxy {
  const _$ComponentsSchemasListsProcessedProcessedErrorsInnerCWProxyImpl(
    this._value,
  );

  final ComponentsSchemasListsProcessedProcessedErrorsInner _value;

  @override
  ComponentsSchemasListsProcessedProcessedErrorsInner item(String? item) =>
      this(item: item);

  @override
  ComponentsSchemasListsProcessedProcessedErrorsInner error(String? error) =>
      this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasListsProcessedProcessedErrorsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasListsProcessedProcessedErrorsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasListsProcessedProcessedErrorsInner call({
    Object? item = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return ComponentsSchemasListsProcessedProcessedErrorsInner(
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

extension $ComponentsSchemasListsProcessedProcessedErrorsInnerCopyWith
    on ComponentsSchemasListsProcessedProcessedErrorsInner {
  /// Returns a callable class that can be used as follows: `instanceOfComponentsSchemasListsProcessedProcessedErrorsInner.copyWith(...)` or like so:`instanceOfComponentsSchemasListsProcessedProcessedErrorsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ComponentsSchemasListsProcessedProcessedErrorsInnerCWProxy get copyWith =>
      _$ComponentsSchemasListsProcessedProcessedErrorsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentsSchemasListsProcessedProcessedErrorsInner
_$ComponentsSchemasListsProcessedProcessedErrorsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ComponentsSchemasListsProcessedProcessedErrorsInner',
  json,
  ($checkedConvert) {
    final val = ComponentsSchemasListsProcessedProcessedErrorsInner(
      item: $checkedConvert('item', (v) => v as String?),
      error: $checkedConvert('error', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic>
_$ComponentsSchemasListsProcessedProcessedErrorsInnerToJson(
  ComponentsSchemasListsProcessedProcessedErrorsInner instance,
) => <String, dynamic>{'item': ?instance.item, 'error': ?instance.error};
