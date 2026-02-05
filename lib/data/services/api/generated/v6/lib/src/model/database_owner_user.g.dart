// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_owner_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DatabaseOwnerUserCWProxy {
  DatabaseOwnerUser uid(int? uid);

  DatabaseOwnerUser name(String? name);

  DatabaseOwnerUser info(String? info);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DatabaseOwnerUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DatabaseOwnerUser(...).copyWith(id: 12, name: "My name")
  /// ````
  DatabaseOwnerUser call({int? uid, String? name, String? info});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDatabaseOwnerUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDatabaseOwnerUser.copyWith.fieldName(...)`
class _$DatabaseOwnerUserCWProxyImpl implements _$DatabaseOwnerUserCWProxy {
  const _$DatabaseOwnerUserCWProxyImpl(this._value);

  final DatabaseOwnerUser _value;

  @override
  DatabaseOwnerUser uid(int? uid) => this(uid: uid);

  @override
  DatabaseOwnerUser name(String? name) => this(name: name);

  @override
  DatabaseOwnerUser info(String? info) => this(info: info);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DatabaseOwnerUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DatabaseOwnerUser(...).copyWith(id: 12, name: "My name")
  /// ````
  DatabaseOwnerUser call({
    Object? uid = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? info = const $CopyWithPlaceholder(),
  }) {
    return DatabaseOwnerUser(
      uid: uid == const $CopyWithPlaceholder()
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      info: info == const $CopyWithPlaceholder()
          ? _value.info
          // ignore: cast_nullable_to_non_nullable
          : info as String?,
    );
  }
}

extension $DatabaseOwnerUserCopyWith on DatabaseOwnerUser {
  /// Returns a callable class that can be used as follows: `instanceOfDatabaseOwnerUser.copyWith(...)` or like so:`instanceOfDatabaseOwnerUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DatabaseOwnerUserCWProxy get copyWith =>
      _$DatabaseOwnerUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseOwnerUser _$DatabaseOwnerUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DatabaseOwnerUser', json, ($checkedConvert) {
      final val = DatabaseOwnerUser(
        uid: $checkedConvert('uid', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        info: $checkedConvert('info', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DatabaseOwnerUserToJson(DatabaseOwnerUser instance) =>
    <String, dynamic>{
      'uid': ?instance.uid,
      'name': ?instance.name,
      'info': ?instance.info,
    };
