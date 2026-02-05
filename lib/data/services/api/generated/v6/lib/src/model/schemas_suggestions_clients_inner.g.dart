// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_suggestions_clients_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasSuggestionsClientsInnerCWProxy {
  SchemasSuggestionsClientsInner hwaddr(String? hwaddr);

  SchemasSuggestionsClientsInner macVendor(String? macVendor);

  SchemasSuggestionsClientsInner lastQuery(int? lastQuery);

  SchemasSuggestionsClientsInner addresses(String? addresses);

  SchemasSuggestionsClientsInner names(String? names);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasSuggestionsClientsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasSuggestionsClientsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasSuggestionsClientsInner call({
    String? hwaddr,
    String? macVendor,
    int? lastQuery,
    String? addresses,
    String? names,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasSuggestionsClientsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasSuggestionsClientsInner.copyWith.fieldName(...)`
class _$SchemasSuggestionsClientsInnerCWProxyImpl
    implements _$SchemasSuggestionsClientsInnerCWProxy {
  const _$SchemasSuggestionsClientsInnerCWProxyImpl(this._value);

  final SchemasSuggestionsClientsInner _value;

  @override
  SchemasSuggestionsClientsInner hwaddr(String? hwaddr) => this(hwaddr: hwaddr);

  @override
  SchemasSuggestionsClientsInner macVendor(String? macVendor) =>
      this(macVendor: macVendor);

  @override
  SchemasSuggestionsClientsInner lastQuery(int? lastQuery) =>
      this(lastQuery: lastQuery);

  @override
  SchemasSuggestionsClientsInner addresses(String? addresses) =>
      this(addresses: addresses);

  @override
  SchemasSuggestionsClientsInner names(String? names) => this(names: names);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasSuggestionsClientsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasSuggestionsClientsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasSuggestionsClientsInner call({
    Object? hwaddr = const $CopyWithPlaceholder(),
    Object? macVendor = const $CopyWithPlaceholder(),
    Object? lastQuery = const $CopyWithPlaceholder(),
    Object? addresses = const $CopyWithPlaceholder(),
    Object? names = const $CopyWithPlaceholder(),
  }) {
    return SchemasSuggestionsClientsInner(
      hwaddr: hwaddr == const $CopyWithPlaceholder()
          ? _value.hwaddr
          // ignore: cast_nullable_to_non_nullable
          : hwaddr as String?,
      macVendor: macVendor == const $CopyWithPlaceholder()
          ? _value.macVendor
          // ignore: cast_nullable_to_non_nullable
          : macVendor as String?,
      lastQuery: lastQuery == const $CopyWithPlaceholder()
          ? _value.lastQuery
          // ignore: cast_nullable_to_non_nullable
          : lastQuery as int?,
      addresses: addresses == const $CopyWithPlaceholder()
          ? _value.addresses
          // ignore: cast_nullable_to_non_nullable
          : addresses as String?,
      names: names == const $CopyWithPlaceholder()
          ? _value.names
          // ignore: cast_nullable_to_non_nullable
          : names as String?,
    );
  }
}

extension $SchemasSuggestionsClientsInnerCopyWith
    on SchemasSuggestionsClientsInner {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasSuggestionsClientsInner.copyWith(...)` or like so:`instanceOfSchemasSuggestionsClientsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasSuggestionsClientsInnerCWProxy get copyWith =>
      _$SchemasSuggestionsClientsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasSuggestionsClientsInner _$SchemasSuggestionsClientsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SchemasSuggestionsClientsInner', json, ($checkedConvert) {
  final val = SchemasSuggestionsClientsInner(
    hwaddr: $checkedConvert('hwaddr', (v) => v as String?),
    macVendor: $checkedConvert('macVendor', (v) => v as String?),
    lastQuery: $checkedConvert('lastQuery', (v) => (v as num?)?.toInt()),
    addresses: $checkedConvert('addresses', (v) => v as String?),
    names: $checkedConvert('names', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SchemasSuggestionsClientsInnerToJson(
  SchemasSuggestionsClientsInner instance,
) => <String, dynamic>{
  'hwaddr': ?instance.hwaddr,
  'macVendor': ?instance.macVendor,
  'lastQuery': ?instance.lastQuery,
  'addresses': ?instance.addresses,
  'names': ?instance.names,
};
