// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readonly.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReadonlyCWProxy {
  Readonly id(int? id);

  Readonly dateAdded(int? dateAdded);

  Readonly dateModified(int? dateModified);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Readonly(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Readonly(...).copyWith(id: 12, name: "My name")
  /// ````
  Readonly call({int? id, int? dateAdded, int? dateModified});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReadonly.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReadonly.copyWith.fieldName(...)`
class _$ReadonlyCWProxyImpl implements _$ReadonlyCWProxy {
  const _$ReadonlyCWProxyImpl(this._value);

  final Readonly _value;

  @override
  Readonly id(int? id) => this(id: id);

  @override
  Readonly dateAdded(int? dateAdded) => this(dateAdded: dateAdded);

  @override
  Readonly dateModified(int? dateModified) => this(dateModified: dateModified);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Readonly(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Readonly(...).copyWith(id: 12, name: "My name")
  /// ````
  Readonly call({
    Object? id = const $CopyWithPlaceholder(),
    Object? dateAdded = const $CopyWithPlaceholder(),
    Object? dateModified = const $CopyWithPlaceholder(),
  }) {
    return Readonly(
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

extension $ReadonlyCopyWith on Readonly {
  /// Returns a callable class that can be used as follows: `instanceOfReadonly.copyWith(...)` or like so:`instanceOfReadonly.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReadonlyCWProxy get copyWith => _$ReadonlyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Readonly _$ReadonlyFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Readonly',
  json,
  ($checkedConvert) {
    final val = Readonly(
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

Map<String, dynamic> _$ReadonlyToJson(Readonly instance) => <String, dynamic>{
  'id': ?instance.id,
  'date_added': ?instance.dateAdded,
  'date_modified': ?instance.dateModified,
};
