// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components_schemas_lists_processed_processed_success_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ComponentsSchemasListsProcessedProcessedSuccessInnerCWProxy {
  ComponentsSchemasListsProcessedProcessedSuccessInner item(String? item);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasListsProcessedProcessedSuccessInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasListsProcessedProcessedSuccessInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasListsProcessedProcessedSuccessInner call({String? item});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfComponentsSchemasListsProcessedProcessedSuccessInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfComponentsSchemasListsProcessedProcessedSuccessInner.copyWith.fieldName(...)`
class _$ComponentsSchemasListsProcessedProcessedSuccessInnerCWProxyImpl
    implements _$ComponentsSchemasListsProcessedProcessedSuccessInnerCWProxy {
  const _$ComponentsSchemasListsProcessedProcessedSuccessInnerCWProxyImpl(
    this._value,
  );

  final ComponentsSchemasListsProcessedProcessedSuccessInner _value;

  @override
  ComponentsSchemasListsProcessedProcessedSuccessInner item(String? item) =>
      this(item: item);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasListsProcessedProcessedSuccessInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasListsProcessedProcessedSuccessInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasListsProcessedProcessedSuccessInner call({
    Object? item = const $CopyWithPlaceholder(),
  }) {
    return ComponentsSchemasListsProcessedProcessedSuccessInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String?,
    );
  }
}

extension $ComponentsSchemasListsProcessedProcessedSuccessInnerCopyWith
    on ComponentsSchemasListsProcessedProcessedSuccessInner {
  /// Returns a callable class that can be used as follows: `instanceOfComponentsSchemasListsProcessedProcessedSuccessInner.copyWith(...)` or like so:`instanceOfComponentsSchemasListsProcessedProcessedSuccessInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ComponentsSchemasListsProcessedProcessedSuccessInnerCWProxy get copyWith =>
      _$ComponentsSchemasListsProcessedProcessedSuccessInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentsSchemasListsProcessedProcessedSuccessInner
_$ComponentsSchemasListsProcessedProcessedSuccessInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ComponentsSchemasListsProcessedProcessedSuccessInner',
  json,
  ($checkedConvert) {
    final val = ComponentsSchemasListsProcessedProcessedSuccessInner(
      item: $checkedConvert('item', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic>
_$ComponentsSchemasListsProcessedProcessedSuccessInnerToJson(
  ComponentsSchemasListsProcessedProcessedSuccessInner instance,
) => <String, dynamic>{'item': ?instance.item};
