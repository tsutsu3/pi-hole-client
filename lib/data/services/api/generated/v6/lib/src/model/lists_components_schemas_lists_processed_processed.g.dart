// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_components_schemas_lists_processed_processed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsComponentsSchemasListsProcessedProcessedCWProxy {
  ListsComponentsSchemasListsProcessedProcessed success(
    List<ListsComponentsSchemasListsProcessedProcessedSuccessInner>? success,
  );

  ListsComponentsSchemasListsProcessedProcessed errors(
    List<ListsComponentsSchemasListsProcessedProcessedErrorsInner>? errors,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasListsProcessedProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasListsProcessedProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasListsProcessedProcessed call({
    List<ListsComponentsSchemasListsProcessedProcessedSuccessInner>? success,
    List<ListsComponentsSchemasListsProcessedProcessedErrorsInner>? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsComponentsSchemasListsProcessedProcessed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsComponentsSchemasListsProcessedProcessed.copyWith.fieldName(...)`
class _$ListsComponentsSchemasListsProcessedProcessedCWProxyImpl
    implements _$ListsComponentsSchemasListsProcessedProcessedCWProxy {
  const _$ListsComponentsSchemasListsProcessedProcessedCWProxyImpl(this._value);

  final ListsComponentsSchemasListsProcessedProcessed _value;

  @override
  ListsComponentsSchemasListsProcessedProcessed success(
    List<ListsComponentsSchemasListsProcessedProcessedSuccessInner>? success,
  ) => this(success: success);

  @override
  ListsComponentsSchemasListsProcessedProcessed errors(
    List<ListsComponentsSchemasListsProcessedProcessedErrorsInner>? errors,
  ) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasListsProcessedProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasListsProcessedProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasListsProcessedProcessed call({
    Object? success = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ListsComponentsSchemasListsProcessedProcessed(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success
                as List<
                  ListsComponentsSchemasListsProcessedProcessedSuccessInner
                >?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors
                as List<
                  ListsComponentsSchemasListsProcessedProcessedErrorsInner
                >?,
    );
  }
}

extension $ListsComponentsSchemasListsProcessedProcessedCopyWith
    on ListsComponentsSchemasListsProcessedProcessed {
  /// Returns a callable class that can be used as follows: `instanceOfListsComponentsSchemasListsProcessedProcessed.copyWith(...)` or like so:`instanceOfListsComponentsSchemasListsProcessedProcessed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsComponentsSchemasListsProcessedProcessedCWProxy get copyWith =>
      _$ListsComponentsSchemasListsProcessedProcessedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsComponentsSchemasListsProcessedProcessed
_$ListsComponentsSchemasListsProcessedProcessedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListsComponentsSchemasListsProcessedProcessed', json, (
  $checkedConvert,
) {
  final val = ListsComponentsSchemasListsProcessedProcessed(
    success: $checkedConvert(
      'success',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                ListsComponentsSchemasListsProcessedProcessedSuccessInner.fromJson(
                  e as Map<String, dynamic>,
                ),
          )
          .toList(),
    ),
    errors: $checkedConvert(
      'errors',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                ListsComponentsSchemasListsProcessedProcessedErrorsInner.fromJson(
                  e as Map<String, dynamic>,
                ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListsComponentsSchemasListsProcessedProcessedToJson(
  ListsComponentsSchemasListsProcessedProcessed instance,
) => <String, dynamic>{
  'success': ?instance.success?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors?.map((e) => e.toJson()).toList(),
};
