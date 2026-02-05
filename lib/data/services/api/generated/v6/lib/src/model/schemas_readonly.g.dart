// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_readonly.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasReadonlyCWProxy {
  SchemasReadonly id(int? id);

  SchemasReadonly dateAdded(int? dateAdded);

  SchemasReadonly dateModified(int? dateModified);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasReadonly(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasReadonly(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasReadonly call({int? id, int? dateAdded, int? dateModified});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasReadonly.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasReadonly.copyWith.fieldName(...)`
class _$SchemasReadonlyCWProxyImpl implements _$SchemasReadonlyCWProxy {
  const _$SchemasReadonlyCWProxyImpl(this._value);

  final SchemasReadonly _value;

  @override
  SchemasReadonly id(int? id) => this(id: id);

  @override
  SchemasReadonly dateAdded(int? dateAdded) => this(dateAdded: dateAdded);

  @override
  SchemasReadonly dateModified(int? dateModified) =>
      this(dateModified: dateModified);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasReadonly(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasReadonly(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasReadonly call({
    Object? id = const $CopyWithPlaceholder(),
    Object? dateAdded = const $CopyWithPlaceholder(),
    Object? dateModified = const $CopyWithPlaceholder(),
  }) {
    return SchemasReadonly(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      dateAdded: dateAdded == const $CopyWithPlaceholder()
          ? _value.dateAdded
          // ignore: cast_nullable_to_non_nullable
          : dateAdded as int?,
      dateModified: dateModified == const $CopyWithPlaceholder()
          ? _value.dateModified
          // ignore: cast_nullable_to_non_nullable
          : dateModified as int?,
    );
  }
}

extension $SchemasReadonlyCopyWith on SchemasReadonly {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasReadonly.copyWith(...)` or like so:`instanceOfSchemasReadonly.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasReadonlyCWProxy get copyWith => _$SchemasReadonlyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasReadonly _$SchemasReadonlyFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SchemasReadonly',
      json,
      ($checkedConvert) {
        final val = SchemasReadonly(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          dateAdded: $checkedConvert('date_added', (v) => (v as num?)?.toInt()),
          dateModified: $checkedConvert(
            'date_modified',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'dateAdded': 'date_added',
        'dateModified': 'date_modified',
      },
    );

Map<String, dynamic> _$SchemasReadonlyToJson(SchemasReadonly instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'date_added': ?instance.dateAdded,
      'date_modified': ?instance.dateModified,
    };
