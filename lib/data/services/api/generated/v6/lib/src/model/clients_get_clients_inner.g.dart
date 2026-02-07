// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_get_clients_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientsGetClientsInnerCWProxy {
  ClientsGetClientsInner client(String? client);

  ClientsGetClientsInner comment(String? comment);

  ClientsGetClientsInner groups(List<int>? groups);

  ClientsGetClientsInner id(int? id);

  ClientsGetClientsInner dateAdded(int? dateAdded);

  ClientsGetClientsInner dateModified(int? dateModified);

  ClientsGetClientsInner name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientsGetClientsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientsGetClientsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientsGetClientsInner call({
    String? client,
    String? comment,
    List<int>? groups,
    int? id,
    int? dateAdded,
    int? dateModified,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientsGetClientsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientsGetClientsInner.copyWith.fieldName(...)`
class _$ClientsGetClientsInnerCWProxyImpl
    implements _$ClientsGetClientsInnerCWProxy {
  const _$ClientsGetClientsInnerCWProxyImpl(this._value);

  final ClientsGetClientsInner _value;

  @override
  ClientsGetClientsInner client(String? client) => this(client: client);

  @override
  ClientsGetClientsInner comment(String? comment) => this(comment: comment);

  @override
  ClientsGetClientsInner groups(List<int>? groups) => this(groups: groups);

  @override
  ClientsGetClientsInner id(int? id) => this(id: id);

  @override
  ClientsGetClientsInner dateAdded(int? dateAdded) =>
      this(dateAdded: dateAdded);

  @override
  ClientsGetClientsInner dateModified(int? dateModified) =>
      this(dateModified: dateModified);

  @override
  ClientsGetClientsInner name(String? name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientsGetClientsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientsGetClientsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientsGetClientsInner call({
    Object? client = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? dateAdded = const $CopyWithPlaceholder(),
    Object? dateModified = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return ClientsGetClientsInner(
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as String?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<int>?,
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

extension $ClientsGetClientsInnerCopyWith on ClientsGetClientsInner {
  /// Returns a callable class that can be used as follows: `instanceOfClientsGetClientsInner.copyWith(...)` or like so:`instanceOfClientsGetClientsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientsGetClientsInnerCWProxy get copyWith =>
      _$ClientsGetClientsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsGetClientsInner _$ClientsGetClientsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ClientsGetClientsInner',
  json,
  ($checkedConvert) {
    final val = ClientsGetClientsInner(
      client: $checkedConvert('client', (v) => v as String?),
      comment: $checkedConvert('comment', (v) => v as String?),
      groups: $checkedConvert(
        'groups',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            [0],
      ),
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

Map<String, dynamic> _$ClientsGetClientsInnerToJson(
  ClientsGetClientsInner instance,
) => <String, dynamic>{
  'client': ?instance.client,
  'comment': ?instance.comment,
  'groups': ?instance.groups,
  'id': ?instance.id,
  'date_added': ?instance.dateAdded,
  'date_modified': ?instance.dateModified,
  'name': ?instance.name,
};
