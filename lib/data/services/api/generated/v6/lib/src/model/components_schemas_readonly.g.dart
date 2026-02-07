// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components_schemas_readonly.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ComponentsSchemasReadonlyCWProxy {
  ComponentsSchemasReadonly id(int? id);

  ComponentsSchemasReadonly dateAdded(int? dateAdded);

  ComponentsSchemasReadonly dateModified(int? dateModified);

  ComponentsSchemasReadonly name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasReadonly(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasReadonly(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasReadonly call({
    int? id,
    int? dateAdded,
    int? dateModified,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfComponentsSchemasReadonly.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfComponentsSchemasReadonly.copyWith.fieldName(...)`
class _$ComponentsSchemasReadonlyCWProxyImpl
    implements _$ComponentsSchemasReadonlyCWProxy {
  const _$ComponentsSchemasReadonlyCWProxyImpl(this._value);

  final ComponentsSchemasReadonly _value;

  @override
  ComponentsSchemasReadonly id(int? id) => this(id: id);

  @override
  ComponentsSchemasReadonly dateAdded(int? dateAdded) =>
      this(dateAdded: dateAdded);

  @override
  ComponentsSchemasReadonly dateModified(int? dateModified) =>
      this(dateModified: dateModified);

  @override
  ComponentsSchemasReadonly name(String? name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasReadonly(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasReadonly(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasReadonly call({
    Object? id = const $CopyWithPlaceholder(),
    Object? dateAdded = const $CopyWithPlaceholder(),
    Object? dateModified = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return ComponentsSchemasReadonly(
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
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $ComponentsSchemasReadonlyCopyWith on ComponentsSchemasReadonly {
  /// Returns a callable class that can be used as follows: `instanceOfComponentsSchemasReadonly.copyWith(...)` or like so:`instanceOfComponentsSchemasReadonly.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ComponentsSchemasReadonlyCWProxy get copyWith =>
      _$ComponentsSchemasReadonlyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentsSchemasReadonly _$ComponentsSchemasReadonlyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ComponentsSchemasReadonly',
  json,
  ($checkedConvert) {
    final val = ComponentsSchemasReadonly(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      dateAdded: $checkedConvert('date_added', (v) => (v as num?)?.toInt()),
      dateModified: $checkedConvert(
        'date_modified',
        (v) => (v as num?)?.toInt(),
      ),
      name: $checkedConvert('name', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'dateAdded': 'date_added',
    'dateModified': 'date_modified',
  },
);

Map<String, dynamic> _$ComponentsSchemasReadonlyToJson(
  ComponentsSchemasReadonly instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'date_added': ?instance.dateAdded,
  'date_modified': ?instance.dateModified,
  'name': ?instance.name,
};
