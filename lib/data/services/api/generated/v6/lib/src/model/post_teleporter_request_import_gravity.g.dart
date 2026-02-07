// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_teleporter_request_import_gravity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostTeleporterRequestImportGravityCWProxy {
  PostTeleporterRequestImportGravity group(bool? group);

  PostTeleporterRequestImportGravity adlist(bool? adlist);

  PostTeleporterRequestImportGravity adlistByGroup(bool? adlistByGroup);

  PostTeleporterRequestImportGravity domainlist(bool? domainlist);

  PostTeleporterRequestImportGravity domainlistByGroup(bool? domainlistByGroup);

  PostTeleporterRequestImportGravity client(bool? client);

  PostTeleporterRequestImportGravity clientByGroup(bool? clientByGroup);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostTeleporterRequestImportGravity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostTeleporterRequestImportGravity(...).copyWith(id: 12, name: "My name")
  /// ````
  PostTeleporterRequestImportGravity call({
    bool? group,
    bool? adlist,
    bool? adlistByGroup,
    bool? domainlist,
    bool? domainlistByGroup,
    bool? client,
    bool? clientByGroup,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostTeleporterRequestImportGravity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostTeleporterRequestImportGravity.copyWith.fieldName(...)`
class _$PostTeleporterRequestImportGravityCWProxyImpl
    implements _$PostTeleporterRequestImportGravityCWProxy {
  const _$PostTeleporterRequestImportGravityCWProxyImpl(this._value);

  final PostTeleporterRequestImportGravity _value;

  @override
  PostTeleporterRequestImportGravity group(bool? group) => this(group: group);

  @override
  PostTeleporterRequestImportGravity adlist(bool? adlist) =>
      this(adlist: adlist);

  @override
  PostTeleporterRequestImportGravity adlistByGroup(bool? adlistByGroup) =>
      this(adlistByGroup: adlistByGroup);

  @override
  PostTeleporterRequestImportGravity domainlist(bool? domainlist) =>
      this(domainlist: domainlist);

  @override
  PostTeleporterRequestImportGravity domainlistByGroup(
    bool? domainlistByGroup,
  ) => this(domainlistByGroup: domainlistByGroup);

  @override
  PostTeleporterRequestImportGravity client(bool? client) =>
      this(client: client);

  @override
  PostTeleporterRequestImportGravity clientByGroup(bool? clientByGroup) =>
      this(clientByGroup: clientByGroup);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostTeleporterRequestImportGravity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostTeleporterRequestImportGravity(...).copyWith(id: 12, name: "My name")
  /// ````
  PostTeleporterRequestImportGravity call({
    Object? group = const $CopyWithPlaceholder(),
    Object? adlist = const $CopyWithPlaceholder(),
    Object? adlistByGroup = const $CopyWithPlaceholder(),
    Object? domainlist = const $CopyWithPlaceholder(),
    Object? domainlistByGroup = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
    Object? clientByGroup = const $CopyWithPlaceholder(),
  }) {
    return PostTeleporterRequestImportGravity(
      group: group == const $CopyWithPlaceholder()
          ? _value.group
          // ignore: cast_nullable_to_non_nullable
          : group as bool?,
      adlist: adlist == const $CopyWithPlaceholder()
          ? _value.adlist
          // ignore: cast_nullable_to_non_nullable
          : adlist as bool?,
      adlistByGroup: adlistByGroup == const $CopyWithPlaceholder()
          ? _value.adlistByGroup
          // ignore: cast_nullable_to_non_nullable
          : adlistByGroup as bool?,
      domainlist: domainlist == const $CopyWithPlaceholder()
          ? _value.domainlist
          // ignore: cast_nullable_to_non_nullable
          : domainlist as bool?,
      domainlistByGroup: domainlistByGroup == const $CopyWithPlaceholder()
          ? _value.domainlistByGroup
          // ignore: cast_nullable_to_non_nullable
          : domainlistByGroup as bool?,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as bool?,
      clientByGroup: clientByGroup == const $CopyWithPlaceholder()
          ? _value.clientByGroup
          // ignore: cast_nullable_to_non_nullable
          : clientByGroup as bool?,
    );
  }
}

extension $PostTeleporterRequestImportGravityCopyWith
    on PostTeleporterRequestImportGravity {
  /// Returns a callable class that can be used as follows: `instanceOfPostTeleporterRequestImportGravity.copyWith(...)` or like so:`instanceOfPostTeleporterRequestImportGravity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostTeleporterRequestImportGravityCWProxy get copyWith =>
      _$PostTeleporterRequestImportGravityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTeleporterRequestImportGravity _$PostTeleporterRequestImportGravityFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PostTeleporterRequestImportGravity',
  json,
  ($checkedConvert) {
    final val = PostTeleporterRequestImportGravity(
      group: $checkedConvert('group', (v) => v as bool?),
      adlist: $checkedConvert('adlist', (v) => v as bool?),
      adlistByGroup: $checkedConvert('adlist_by_group', (v) => v as bool?),
      domainlist: $checkedConvert('domainlist', (v) => v as bool?),
      domainlistByGroup: $checkedConvert(
        'domainlist_by_group',
        (v) => v as bool?,
      ),
      client: $checkedConvert('client', (v) => v as bool?),
      clientByGroup: $checkedConvert('client_by_group', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'adlistByGroup': 'adlist_by_group',
    'domainlistByGroup': 'domainlist_by_group',
    'clientByGroup': 'client_by_group',
  },
);

Map<String, dynamic> _$PostTeleporterRequestImportGravityToJson(
  PostTeleporterRequestImportGravity instance,
) => <String, dynamic>{
  'group': ?instance.group,
  'adlist': ?instance.adlist,
  'adlist_by_group': ?instance.adlistByGroup,
  'domainlist': ?instance.domainlist,
  'domainlist_by_group': ?instance.domainlistByGroup,
  'client': ?instance.client,
  'client_by_group': ?instance.clientByGroup,
};
