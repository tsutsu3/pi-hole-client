// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_components_schemas_lists_processed_processed_errors_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsComponentsSchemasListsProcessedProcessedErrorsInnerCWProxy {
  ListsComponentsSchemasListsProcessedProcessedErrorsInner item(String? item);

  ListsComponentsSchemasListsProcessedProcessedErrorsInner error(String? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasListsProcessedProcessedErrorsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasListsProcessedProcessedErrorsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasListsProcessedProcessedErrorsInner call({
    String? item,
    String? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsComponentsSchemasListsProcessedProcessedErrorsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsComponentsSchemasListsProcessedProcessedErrorsInner.copyWith.fieldName(...)`
class _$ListsComponentsSchemasListsProcessedProcessedErrorsInnerCWProxyImpl
    implements
        _$ListsComponentsSchemasListsProcessedProcessedErrorsInnerCWProxy {
  const _$ListsComponentsSchemasListsProcessedProcessedErrorsInnerCWProxyImpl(
    this._value,
  );

  final ListsComponentsSchemasListsProcessedProcessedErrorsInner _value;

  @override
  ListsComponentsSchemasListsProcessedProcessedErrorsInner item(String? item) =>
      this(item: item);

  @override
  ListsComponentsSchemasListsProcessedProcessedErrorsInner error(
    String? error,
  ) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasListsProcessedProcessedErrorsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasListsProcessedProcessedErrorsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasListsProcessedProcessedErrorsInner call({
    Object? item = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return ListsComponentsSchemasListsProcessedProcessedErrorsInner(
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

extension $ListsComponentsSchemasListsProcessedProcessedErrorsInnerCopyWith
    on ListsComponentsSchemasListsProcessedProcessedErrorsInner {
  /// Returns a callable class that can be used as follows: `instanceOfListsComponentsSchemasListsProcessedProcessedErrorsInner.copyWith(...)` or like so:`instanceOfListsComponentsSchemasListsProcessedProcessedErrorsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsComponentsSchemasListsProcessedProcessedErrorsInnerCWProxy
  get copyWith =>
      _$ListsComponentsSchemasListsProcessedProcessedErrorsInnerCWProxyImpl(
        this,
      );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsComponentsSchemasListsProcessedProcessedErrorsInner
_$ListsComponentsSchemasListsProcessedProcessedErrorsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ListsComponentsSchemasListsProcessedProcessedErrorsInner',
  json,
  ($checkedConvert) {
    final val = ListsComponentsSchemasListsProcessedProcessedErrorsInner(
      item: $checkedConvert('item', (v) => v as String?),
      error: $checkedConvert('error', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic>
_$ListsComponentsSchemasListsProcessedProcessedErrorsInnerToJson(
  ListsComponentsSchemasListsProcessedProcessedErrorsInner instance,
) => <String, dynamic>{'item': ?instance.item, 'error': ?instance.error};
