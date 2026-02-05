// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_processed_processed_success_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsProcessedProcessedSuccessInnerCWProxy {
  ListsProcessedProcessedSuccessInner item(String? item);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsProcessedProcessedSuccessInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsProcessedProcessedSuccessInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsProcessedProcessedSuccessInner call({String? item});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsProcessedProcessedSuccessInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsProcessedProcessedSuccessInner.copyWith.fieldName(...)`
class _$ListsProcessedProcessedSuccessInnerCWProxyImpl
    implements _$ListsProcessedProcessedSuccessInnerCWProxy {
  const _$ListsProcessedProcessedSuccessInnerCWProxyImpl(this._value);

  final ListsProcessedProcessedSuccessInner _value;

  @override
  ListsProcessedProcessedSuccessInner item(String? item) => this(item: item);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsProcessedProcessedSuccessInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsProcessedProcessedSuccessInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsProcessedProcessedSuccessInner call({
    Object? item = const $CopyWithPlaceholder(),
  }) {
    return ListsProcessedProcessedSuccessInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String?,
    );
  }
}

extension $ListsProcessedProcessedSuccessInnerCopyWith
    on ListsProcessedProcessedSuccessInner {
  /// Returns a callable class that can be used as follows: `instanceOfListsProcessedProcessedSuccessInner.copyWith(...)` or like so:`instanceOfListsProcessedProcessedSuccessInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsProcessedProcessedSuccessInnerCWProxy get copyWith =>
      _$ListsProcessedProcessedSuccessInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsProcessedProcessedSuccessInner
_$ListsProcessedProcessedSuccessInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListsProcessedProcessedSuccessInner', json, (
      $checkedConvert,
    ) {
      final val = ListsProcessedProcessedSuccessInner(
        item: $checkedConvert('item', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ListsProcessedProcessedSuccessInnerToJson(
  ListsProcessedProcessedSuccessInner instance,
) => <String, dynamic>{'item': ?instance.item};
