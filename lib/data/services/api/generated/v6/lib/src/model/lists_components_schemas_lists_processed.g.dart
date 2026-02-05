// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_components_schemas_lists_processed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsComponentsSchemasListsProcessedCWProxy {
  ListsComponentsSchemasListsProcessed processed(
    ListsComponentsSchemasListsProcessedProcessed? processed,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasListsProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasListsProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasListsProcessed call({
    ListsComponentsSchemasListsProcessedProcessed? processed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsComponentsSchemasListsProcessed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsComponentsSchemasListsProcessed.copyWith.fieldName(...)`
class _$ListsComponentsSchemasListsProcessedCWProxyImpl
    implements _$ListsComponentsSchemasListsProcessedCWProxy {
  const _$ListsComponentsSchemasListsProcessedCWProxyImpl(this._value);

  final ListsComponentsSchemasListsProcessed _value;

  @override
  ListsComponentsSchemasListsProcessed processed(
    ListsComponentsSchemasListsProcessedProcessed? processed,
  ) => this(processed: processed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasListsProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasListsProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasListsProcessed call({
    Object? processed = const $CopyWithPlaceholder(),
  }) {
    return ListsComponentsSchemasListsProcessed(
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as ListsComponentsSchemasListsProcessedProcessed?,
    );
  }
}

extension $ListsComponentsSchemasListsProcessedCopyWith
    on ListsComponentsSchemasListsProcessed {
  /// Returns a callable class that can be used as follows: `instanceOfListsComponentsSchemasListsProcessed.copyWith(...)` or like so:`instanceOfListsComponentsSchemasListsProcessed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsComponentsSchemasListsProcessedCWProxy get copyWith =>
      _$ListsComponentsSchemasListsProcessedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsComponentsSchemasListsProcessed
_$ListsComponentsSchemasListsProcessedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListsComponentsSchemasListsProcessed', json, (
      $checkedConvert,
    ) {
      final val = ListsComponentsSchemasListsProcessed(
        processed: $checkedConvert(
          'processed',
          (v) => v == null
              ? null
              : ListsComponentsSchemasListsProcessedProcessed.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListsComponentsSchemasListsProcessedToJson(
  ListsComponentsSchemasListsProcessed instance,
) => <String, dynamic>{'processed': ?instance.processed?.toJson()};
