// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_lists_processed_processed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasListsProcessedProcessedCWProxy {
  SchemasListsProcessedProcessed success(
    List<SchemasListsProcessedProcessedSuccessInner>? success,
  );

  SchemasListsProcessedProcessed errors(
    List<SchemasListsProcessedProcessedErrorsInner>? errors,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasListsProcessedProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasListsProcessedProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasListsProcessedProcessed call({
    List<SchemasListsProcessedProcessedSuccessInner>? success,
    List<SchemasListsProcessedProcessedErrorsInner>? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasListsProcessedProcessed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasListsProcessedProcessed.copyWith.fieldName(...)`
class _$SchemasListsProcessedProcessedCWProxyImpl
    implements _$SchemasListsProcessedProcessedCWProxy {
  const _$SchemasListsProcessedProcessedCWProxyImpl(this._value);

  final SchemasListsProcessedProcessed _value;

  @override
  SchemasListsProcessedProcessed success(
    List<SchemasListsProcessedProcessedSuccessInner>? success,
  ) => this(success: success);

  @override
  SchemasListsProcessedProcessed errors(
    List<SchemasListsProcessedProcessedErrorsInner>? errors,
  ) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasListsProcessedProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasListsProcessedProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasListsProcessedProcessed call({
    Object? success = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return SchemasListsProcessedProcessed(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as List<SchemasListsProcessedProcessedSuccessInner>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as List<SchemasListsProcessedProcessedErrorsInner>?,
    );
  }
}

extension $SchemasListsProcessedProcessedCopyWith
    on SchemasListsProcessedProcessed {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasListsProcessedProcessed.copyWith(...)` or like so:`instanceOfSchemasListsProcessedProcessed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasListsProcessedProcessedCWProxy get copyWith =>
      _$SchemasListsProcessedProcessedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasListsProcessedProcessed _$SchemasListsProcessedProcessedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SchemasListsProcessedProcessed', json, ($checkedConvert) {
  final val = SchemasListsProcessedProcessed(
    success: $checkedConvert(
      'success',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SchemasListsProcessedProcessedSuccessInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
    errors: $checkedConvert(
      'errors',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SchemasListsProcessedProcessedErrorsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SchemasListsProcessedProcessedToJson(
  SchemasListsProcessedProcessed instance,
) => <String, dynamic>{
  'success': ?instance.success?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors?.map((e) => e.toJson()).toList(),
};
