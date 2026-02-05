// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_missing.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItemMissingCWProxy {
  ItemMissing error(ItemMissingError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemMissing(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemMissing(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemMissing call({ItemMissingError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItemMissing.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItemMissing.copyWith.fieldName(...)`
class _$ItemMissingCWProxyImpl implements _$ItemMissingCWProxy {
  const _$ItemMissingCWProxyImpl(this._value);

  final ItemMissing _value;

  @override
  ItemMissing error(ItemMissingError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemMissing(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemMissing(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemMissing call({Object? error = const $CopyWithPlaceholder()}) {
    return ItemMissing(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as ItemMissingError?,
    );
  }
}

extension $ItemMissingCopyWith on ItemMissing {
  /// Returns a callable class that can be used as follows: `instanceOfItemMissing.copyWith(...)` or like so:`instanceOfItemMissing.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItemMissingCWProxy get copyWith => _$ItemMissingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMissing _$ItemMissingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ItemMissing', json, ($checkedConvert) {
      final val = ItemMissing(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : ItemMissingError.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ItemMissingToJson(ItemMissing instance) =>
    <String, dynamic>{'error': ?instance.error?.toJson()};
