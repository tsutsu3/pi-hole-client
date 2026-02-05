// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components_schemas_lists_processed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ComponentsSchemasListsProcessedCWProxy {
  ComponentsSchemasListsProcessed processed(
    ComponentsSchemasListsProcessedProcessed? processed,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasListsProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasListsProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasListsProcessed call({
    ComponentsSchemasListsProcessedProcessed? processed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfComponentsSchemasListsProcessed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfComponentsSchemasListsProcessed.copyWith.fieldName(...)`
class _$ComponentsSchemasListsProcessedCWProxyImpl
    implements _$ComponentsSchemasListsProcessedCWProxy {
  const _$ComponentsSchemasListsProcessedCWProxyImpl(this._value);

  final ComponentsSchemasListsProcessed _value;

  @override
  ComponentsSchemasListsProcessed processed(
    ComponentsSchemasListsProcessedProcessed? processed,
  ) => this(processed: processed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasListsProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasListsProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasListsProcessed call({
    Object? processed = const $CopyWithPlaceholder(),
  }) {
    return ComponentsSchemasListsProcessed(
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as ComponentsSchemasListsProcessedProcessed?,
    );
  }
}

extension $ComponentsSchemasListsProcessedCopyWith
    on ComponentsSchemasListsProcessed {
  /// Returns a callable class that can be used as follows: `instanceOfComponentsSchemasListsProcessed.copyWith(...)` or like so:`instanceOfComponentsSchemasListsProcessed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ComponentsSchemasListsProcessedCWProxy get copyWith =>
      _$ComponentsSchemasListsProcessedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentsSchemasListsProcessed _$ComponentsSchemasListsProcessedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ComponentsSchemasListsProcessed', json, ($checkedConvert) {
  final val = ComponentsSchemasListsProcessed(
    processed: $checkedConvert(
      'processed',
      (v) => v == null
          ? null
          : ComponentsSchemasListsProcessedProcessed.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ComponentsSchemasListsProcessedToJson(
  ComponentsSchemasListsProcessed instance,
) => <String, dynamic>{'processed': ?instance.processed?.toJson()};
