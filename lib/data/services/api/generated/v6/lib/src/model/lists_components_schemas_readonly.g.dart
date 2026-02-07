// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_components_schemas_readonly.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsComponentsSchemasReadonlyCWProxy {
  ListsComponentsSchemasReadonly id(int? id);

  ListsComponentsSchemasReadonly dateAdded(int? dateAdded);

  ListsComponentsSchemasReadonly dateModified(int? dateModified);

  ListsComponentsSchemasReadonly dateUpdated(int? dateUpdated);

  ListsComponentsSchemasReadonly number(int? number);

  ListsComponentsSchemasReadonly invalidDomains(int? invalidDomains);

  ListsComponentsSchemasReadonly abpEntries(int? abpEntries);

  ListsComponentsSchemasReadonly status(int? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasReadonly(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasReadonly(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasReadonly call({
    int? id,
    int? dateAdded,
    int? dateModified,
    int? dateUpdated,
    int? number,
    int? invalidDomains,
    int? abpEntries,
    int? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsComponentsSchemasReadonly.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsComponentsSchemasReadonly.copyWith.fieldName(...)`
class _$ListsComponentsSchemasReadonlyCWProxyImpl
    implements _$ListsComponentsSchemasReadonlyCWProxy {
  const _$ListsComponentsSchemasReadonlyCWProxyImpl(this._value);

  final ListsComponentsSchemasReadonly _value;

  @override
  ListsComponentsSchemasReadonly id(int? id) => this(id: id);

  @override
  ListsComponentsSchemasReadonly dateAdded(int? dateAdded) =>
      this(dateAdded: dateAdded);

  @override
  ListsComponentsSchemasReadonly dateModified(int? dateModified) =>
      this(dateModified: dateModified);

  @override
  ListsComponentsSchemasReadonly dateUpdated(int? dateUpdated) =>
      this(dateUpdated: dateUpdated);

  @override
  ListsComponentsSchemasReadonly number(int? number) => this(number: number);

  @override
  ListsComponentsSchemasReadonly invalidDomains(int? invalidDomains) =>
      this(invalidDomains: invalidDomains);

  @override
  ListsComponentsSchemasReadonly abpEntries(int? abpEntries) =>
      this(abpEntries: abpEntries);

  @override
  ListsComponentsSchemasReadonly status(int? status) => this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasReadonly(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasReadonly(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasReadonly call({
    Object? id = const $CopyWithPlaceholder(),
    Object? dateAdded = const $CopyWithPlaceholder(),
    Object? dateModified = const $CopyWithPlaceholder(),
    Object? dateUpdated = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? invalidDomains = const $CopyWithPlaceholder(),
    Object? abpEntries = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return ListsComponentsSchemasReadonly(
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
      dateUpdated: dateUpdated == const $CopyWithPlaceholder()
          ? _value.dateUpdated
          // ignore: cast_nullable_to_non_nullable
          : dateUpdated as int?,
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as int?,
      invalidDomains: invalidDomains == const $CopyWithPlaceholder()
          ? _value.invalidDomains
          // ignore: cast_nullable_to_non_nullable
          : invalidDomains as int?,
      abpEntries: abpEntries == const $CopyWithPlaceholder()
          ? _value.abpEntries
          // ignore: cast_nullable_to_non_nullable
          : abpEntries as int?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
    );
  }
}

extension $ListsComponentsSchemasReadonlyCopyWith
    on ListsComponentsSchemasReadonly {
  /// Returns a callable class that can be used as follows: `instanceOfListsComponentsSchemasReadonly.copyWith(...)` or like so:`instanceOfListsComponentsSchemasReadonly.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsComponentsSchemasReadonlyCWProxy get copyWith =>
      _$ListsComponentsSchemasReadonlyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsComponentsSchemasReadonly _$ListsComponentsSchemasReadonlyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ListsComponentsSchemasReadonly',
  json,
  ($checkedConvert) {
    final val = ListsComponentsSchemasReadonly(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      dateAdded: $checkedConvert('date_added', (v) => (v as num?)?.toInt()),
      dateModified: $checkedConvert(
        'date_modified',
        (v) => (v as num?)?.toInt(),
      ),
      dateUpdated: $checkedConvert('date_updated', (v) => (v as num?)?.toInt()),
      number: $checkedConvert('number', (v) => (v as num?)?.toInt()),
      invalidDomains: $checkedConvert(
        'invalid_domains',
        (v) => (v as num?)?.toInt(),
      ),
      abpEntries: $checkedConvert('abp_entries', (v) => (v as num?)?.toInt()),
      status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'dateAdded': 'date_added',
    'dateModified': 'date_modified',
    'dateUpdated': 'date_updated',
    'invalidDomains': 'invalid_domains',
    'abpEntries': 'abp_entries',
  },
);

Map<String, dynamic> _$ListsComponentsSchemasReadonlyToJson(
  ListsComponentsSchemasReadonly instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'date_added': ?instance.dateAdded,
  'date_modified': ?instance.dateModified,
  'date_updated': ?instance.dateUpdated,
  'number': ?instance.number,
  'invalid_domains': ?instance.invalidDomains,
  'abp_entries': ?instance.abpEntries,
  'status': ?instance.status,
};
