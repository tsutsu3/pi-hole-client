// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_processed_processed_errors_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsProcessedProcessedErrorsInnerCWProxy {
  ListsProcessedProcessedErrorsInner item(String? item);

  ListsProcessedProcessedErrorsInner error(String? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsProcessedProcessedErrorsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsProcessedProcessedErrorsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsProcessedProcessedErrorsInner call({String? item, String? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsProcessedProcessedErrorsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsProcessedProcessedErrorsInner.copyWith.fieldName(...)`
class _$ListsProcessedProcessedErrorsInnerCWProxyImpl
    implements _$ListsProcessedProcessedErrorsInnerCWProxy {
  const _$ListsProcessedProcessedErrorsInnerCWProxyImpl(this._value);

  final ListsProcessedProcessedErrorsInner _value;

  @override
  ListsProcessedProcessedErrorsInner item(String? item) => this(item: item);

  @override
  ListsProcessedProcessedErrorsInner error(String? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsProcessedProcessedErrorsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsProcessedProcessedErrorsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsProcessedProcessedErrorsInner call({
    Object? item = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return ListsProcessedProcessedErrorsInner(
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

extension $ListsProcessedProcessedErrorsInnerCopyWith
    on ListsProcessedProcessedErrorsInner {
  /// Returns a callable class that can be used as follows: `instanceOfListsProcessedProcessedErrorsInner.copyWith(...)` or like so:`instanceOfListsProcessedProcessedErrorsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsProcessedProcessedErrorsInnerCWProxy get copyWith =>
      _$ListsProcessedProcessedErrorsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsProcessedProcessedErrorsInner _$ListsProcessedProcessedErrorsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListsProcessedProcessedErrorsInner', json, (
  $checkedConvert,
) {
  final val = ListsProcessedProcessedErrorsInner(
    item: $checkedConvert('item', (v) => v as String?),
    error: $checkedConvert('error', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ListsProcessedProcessedErrorsInnerToJson(
  ListsProcessedProcessedErrorsInner instance,
) => <String, dynamic>{'item': ?instance.item, 'error': ?instance.error};
