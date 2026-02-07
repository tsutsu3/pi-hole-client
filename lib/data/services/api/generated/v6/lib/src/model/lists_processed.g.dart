// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_processed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsProcessedCWProxy {
  ListsProcessed processed(ListsProcessedProcessed? processed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsProcessed call({ListsProcessedProcessed? processed});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsProcessed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsProcessed.copyWith.fieldName(...)`
class _$ListsProcessedCWProxyImpl implements _$ListsProcessedCWProxy {
  const _$ListsProcessedCWProxyImpl(this._value);

  final ListsProcessed _value;

  @override
  ListsProcessed processed(ListsProcessedProcessed? processed) =>
      this(processed: processed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsProcessed call({Object? processed = const $CopyWithPlaceholder()}) {
    return ListsProcessed(
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as ListsProcessedProcessed?,
    );
  }
}

extension $ListsProcessedCopyWith on ListsProcessed {
  /// Returns a callable class that can be used as follows: `instanceOfListsProcessed.copyWith(...)` or like so:`instanceOfListsProcessed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsProcessedCWProxy get copyWith => _$ListsProcessedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsProcessed _$ListsProcessedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListsProcessed', json, ($checkedConvert) {
      final val = ListsProcessed(
        processed: $checkedConvert(
          'processed',
          (v) => v == null
              ? null
              : ListsProcessedProcessed.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListsProcessedToJson(ListsProcessed instance) =>
    <String, dynamic>{'processed': ?instance.processed?.toJson()};
