// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_lists_processed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasListsProcessedCWProxy {
  SchemasListsProcessed processed(SchemasListsProcessedProcessed? processed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasListsProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasListsProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasListsProcessed call({SchemasListsProcessedProcessed? processed});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasListsProcessed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasListsProcessed.copyWith.fieldName(...)`
class _$SchemasListsProcessedCWProxyImpl
    implements _$SchemasListsProcessedCWProxy {
  const _$SchemasListsProcessedCWProxyImpl(this._value);

  final SchemasListsProcessed _value;

  @override
  SchemasListsProcessed processed(SchemasListsProcessedProcessed? processed) =>
      this(processed: processed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasListsProcessed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasListsProcessed(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasListsProcessed call({
    Object? processed = const $CopyWithPlaceholder(),
  }) {
    return SchemasListsProcessed(
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as SchemasListsProcessedProcessed?,
    );
  }
}

extension $SchemasListsProcessedCopyWith on SchemasListsProcessed {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasListsProcessed.copyWith(...)` or like so:`instanceOfSchemasListsProcessed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasListsProcessedCWProxy get copyWith =>
      _$SchemasListsProcessedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasListsProcessed _$SchemasListsProcessedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SchemasListsProcessed', json, ($checkedConvert) {
  final val = SchemasListsProcessed(
    processed: $checkedConvert(
      'processed',
      (v) => v == null
          ? null
          : SchemasListsProcessedProcessed.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SchemasListsProcessedToJson(
  SchemasListsProcessed instance,
) => <String, dynamic>{'processed': ?instance.processed?.toJson()};
