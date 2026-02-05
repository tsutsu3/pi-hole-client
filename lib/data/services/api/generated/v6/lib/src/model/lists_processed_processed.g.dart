// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_processed_processed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsProcessedProcessedCWProxy {
  ListsProcessedProcessed success(
    List<ListsProcessedProcessedSuccessInner>? success,
  );

  ListsProcessedProcessed errors(
    List<ListsProcessedProcessedErrorsInner>? errors,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsProcessedProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsProcessedProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsProcessedProcessed call({
    List<ListsProcessedProcessedSuccessInner>? success,
    List<ListsProcessedProcessedErrorsInner>? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsProcessedProcessed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsProcessedProcessed.copyWith.fieldName(...)`
class _$ListsProcessedProcessedCWProxyImpl
    implements _$ListsProcessedProcessedCWProxy {
  const _$ListsProcessedProcessedCWProxyImpl(this._value);

  final ListsProcessedProcessed _value;

  @override
  ListsProcessedProcessed success(
    List<ListsProcessedProcessedSuccessInner>? success,
  ) => this(success: success);

  @override
  ListsProcessedProcessed errors(
    List<ListsProcessedProcessedErrorsInner>? errors,
  ) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsProcessedProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsProcessedProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsProcessedProcessed call({
    Object? success = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ListsProcessedProcessed(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as List<ListsProcessedProcessedSuccessInner>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as List<ListsProcessedProcessedErrorsInner>?,
    );
  }
}

extension $ListsProcessedProcessedCopyWith on ListsProcessedProcessed {
  /// Returns a callable class that can be used as follows: `instanceOfListsProcessedProcessed.copyWith(...)` or like so:`instanceOfListsProcessedProcessed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsProcessedProcessedCWProxy get copyWith =>
      _$ListsProcessedProcessedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsProcessedProcessed _$ListsProcessedProcessedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListsProcessedProcessed', json, ($checkedConvert) {
  final val = ListsProcessedProcessed(
    success: $checkedConvert(
      'success',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ListsProcessedProcessedSuccessInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
    errors: $checkedConvert(
      'errors',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ListsProcessedProcessedErrorsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListsProcessedProcessedToJson(
  ListsProcessedProcessed instance,
) => <String, dynamic>{
  'success': ?instance.success?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors?.map((e) => e.toJson()).toList(),
};
