// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_owner_group.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DatabaseOwnerGroupCWProxy {
  DatabaseOwnerGroup gid(int? gid);

  DatabaseOwnerGroup name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DatabaseOwnerGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DatabaseOwnerGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  DatabaseOwnerGroup call({int? gid, String? name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDatabaseOwnerGroup.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDatabaseOwnerGroup.copyWith.fieldName(...)`
class _$DatabaseOwnerGroupCWProxyImpl implements _$DatabaseOwnerGroupCWProxy {
  const _$DatabaseOwnerGroupCWProxyImpl(this._value);

  final DatabaseOwnerGroup _value;

  @override
  DatabaseOwnerGroup gid(int? gid) => this(gid: gid);

  @override
  DatabaseOwnerGroup name(String? name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DatabaseOwnerGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DatabaseOwnerGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  DatabaseOwnerGroup call({
    Object? gid = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return DatabaseOwnerGroup(
      gid: gid == const $CopyWithPlaceholder()
          ? _value.gid
          // ignore: cast_nullable_to_non_nullable
          : gid as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $DatabaseOwnerGroupCopyWith on DatabaseOwnerGroup {
  /// Returns a callable class that can be used as follows: `instanceOfDatabaseOwnerGroup.copyWith(...)` or like so:`instanceOfDatabaseOwnerGroup.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DatabaseOwnerGroupCWProxy get copyWith =>
      _$DatabaseOwnerGroupCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseOwnerGroup _$DatabaseOwnerGroupFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DatabaseOwnerGroup', json, ($checkedConvert) {
      final val = DatabaseOwnerGroup(
        gid: $checkedConvert('gid', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DatabaseOwnerGroupToJson(DatabaseOwnerGroup instance) =>
    <String, dynamic>{'gid': ?instance.gid, 'name': ?instance.name};
