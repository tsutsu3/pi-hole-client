// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_components_schemas_lists_processed_processed_success_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsComponentsSchemasListsProcessedProcessedSuccessInnerCWProxy {
  ListsComponentsSchemasListsProcessedProcessedSuccessInner item(String? item);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasListsProcessedProcessedSuccessInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasListsProcessedProcessedSuccessInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasListsProcessedProcessedSuccessInner call({
    String? item,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsComponentsSchemasListsProcessedProcessedSuccessInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsComponentsSchemasListsProcessedProcessedSuccessInner.copyWith.fieldName(...)`
class _$ListsComponentsSchemasListsProcessedProcessedSuccessInnerCWProxyImpl
    implements
        _$ListsComponentsSchemasListsProcessedProcessedSuccessInnerCWProxy {
  const _$ListsComponentsSchemasListsProcessedProcessedSuccessInnerCWProxyImpl(
    this._value,
  );

  final ListsComponentsSchemasListsProcessedProcessedSuccessInner _value;

  @override
  ListsComponentsSchemasListsProcessedProcessedSuccessInner item(
    String? item,
  ) => this(item: item);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasListsProcessedProcessedSuccessInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasListsProcessedProcessedSuccessInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasListsProcessedProcessedSuccessInner call({
    Object? item = const $CopyWithPlaceholder(),
  }) {
    return ListsComponentsSchemasListsProcessedProcessedSuccessInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String?,
    );
  }
}

extension $ListsComponentsSchemasListsProcessedProcessedSuccessInnerCopyWith
    on ListsComponentsSchemasListsProcessedProcessedSuccessInner {
  /// Returns a callable class that can be used as follows: `instanceOfListsComponentsSchemasListsProcessedProcessedSuccessInner.copyWith(...)` or like so:`instanceOfListsComponentsSchemasListsProcessedProcessedSuccessInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsComponentsSchemasListsProcessedProcessedSuccessInnerCWProxy
  get copyWith =>
      _$ListsComponentsSchemasListsProcessedProcessedSuccessInnerCWProxyImpl(
        this,
      );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsComponentsSchemasListsProcessedProcessedSuccessInner
_$ListsComponentsSchemasListsProcessedProcessedSuccessInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ListsComponentsSchemasListsProcessedProcessedSuccessInner',
  json,
  ($checkedConvert) {
    final val = ListsComponentsSchemasListsProcessedProcessedSuccessInner(
      item: $checkedConvert('item', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic>
_$ListsComponentsSchemasListsProcessedProcessedSuccessInnerToJson(
  ListsComponentsSchemasListsProcessedProcessedSuccessInner instance,
) => <String, dynamic>{'item': ?instance.item};
