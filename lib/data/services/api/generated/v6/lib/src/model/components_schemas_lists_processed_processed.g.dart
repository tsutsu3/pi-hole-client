// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components_schemas_lists_processed_processed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ComponentsSchemasListsProcessedProcessedCWProxy {
  ComponentsSchemasListsProcessedProcessed success(
    List<ComponentsSchemasListsProcessedProcessedSuccessInner>? success,
  );

  ComponentsSchemasListsProcessedProcessed errors(
    List<ComponentsSchemasListsProcessedProcessedErrorsInner>? errors,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasListsProcessedProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasListsProcessedProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasListsProcessedProcessed call({
    List<ComponentsSchemasListsProcessedProcessedSuccessInner>? success,
    List<ComponentsSchemasListsProcessedProcessedErrorsInner>? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfComponentsSchemasListsProcessedProcessed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfComponentsSchemasListsProcessedProcessed.copyWith.fieldName(...)`
class _$ComponentsSchemasListsProcessedProcessedCWProxyImpl
    implements _$ComponentsSchemasListsProcessedProcessedCWProxy {
  const _$ComponentsSchemasListsProcessedProcessedCWProxyImpl(this._value);

  final ComponentsSchemasListsProcessedProcessed _value;

  @override
  ComponentsSchemasListsProcessedProcessed success(
    List<ComponentsSchemasListsProcessedProcessedSuccessInner>? success,
  ) => this(success: success);

  @override
  ComponentsSchemasListsProcessedProcessed errors(
    List<ComponentsSchemasListsProcessedProcessedErrorsInner>? errors,
  ) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasListsProcessedProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasListsProcessedProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasListsProcessedProcessed call({
    Object? success = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ComponentsSchemasListsProcessedProcessed(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success
                as List<ComponentsSchemasListsProcessedProcessedSuccessInner>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors
                as List<ComponentsSchemasListsProcessedProcessedErrorsInner>?,
    );
  }
}

extension $ComponentsSchemasListsProcessedProcessedCopyWith
    on ComponentsSchemasListsProcessedProcessed {
  /// Returns a callable class that can be used as follows: `instanceOfComponentsSchemasListsProcessedProcessed.copyWith(...)` or like so:`instanceOfComponentsSchemasListsProcessedProcessed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ComponentsSchemasListsProcessedProcessedCWProxy get copyWith =>
      _$ComponentsSchemasListsProcessedProcessedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentsSchemasListsProcessedProcessed
_$ComponentsSchemasListsProcessedProcessedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ComponentsSchemasListsProcessedProcessed', json, (
  $checkedConvert,
) {
  final val = ComponentsSchemasListsProcessedProcessed(
    success: $checkedConvert(
      'success',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                ComponentsSchemasListsProcessedProcessedSuccessInner.fromJson(
                  e as Map<String, dynamic>,
                ),
          )
          .toList(),
    ),
    errors: $checkedConvert(
      'errors',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ComponentsSchemasListsProcessedProcessedErrorsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ComponentsSchemasListsProcessedProcessedToJson(
  ComponentsSchemasListsProcessedProcessed instance,
) => <String, dynamic>{
  'success': ?instance.success?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors?.map((e) => e.toJson()).toList(),
};
