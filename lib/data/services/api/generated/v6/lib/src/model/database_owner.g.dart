// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_owner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DatabaseOwnerCWProxy {
  DatabaseOwner user(DatabaseOwnerUser? user);

  DatabaseOwner group(DatabaseOwnerGroup? group);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DatabaseOwner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DatabaseOwner(...).copyWith(id: 12, name: "My name")
  /// ````
  DatabaseOwner call({DatabaseOwnerUser? user, DatabaseOwnerGroup? group});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDatabaseOwner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDatabaseOwner.copyWith.fieldName(...)`
class _$DatabaseOwnerCWProxyImpl implements _$DatabaseOwnerCWProxy {
  const _$DatabaseOwnerCWProxyImpl(this._value);

  final DatabaseOwner _value;

  @override
  DatabaseOwner user(DatabaseOwnerUser? user) => this(user: user);

  @override
  DatabaseOwner group(DatabaseOwnerGroup? group) => this(group: group);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DatabaseOwner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DatabaseOwner(...).copyWith(id: 12, name: "My name")
  /// ````
  DatabaseOwner call({
    Object? user = const $CopyWithPlaceholder(),
    Object? group = const $CopyWithPlaceholder(),
  }) {
    return DatabaseOwner(
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as DatabaseOwnerUser?,
      group: group == const $CopyWithPlaceholder()
          ? _value.group
          // ignore: cast_nullable_to_non_nullable
          : group as DatabaseOwnerGroup?,
    );
  }
}

extension $DatabaseOwnerCopyWith on DatabaseOwner {
  /// Returns a callable class that can be used as follows: `instanceOfDatabaseOwner.copyWith(...)` or like so:`instanceOfDatabaseOwner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DatabaseOwnerCWProxy get copyWith => _$DatabaseOwnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseOwner _$DatabaseOwnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DatabaseOwner', json, ($checkedConvert) {
      final val = DatabaseOwner(
        user: $checkedConvert(
          'user',
          (v) => v == null
              ? null
              : DatabaseOwnerUser.fromJson(v as Map<String, dynamic>),
        ),
        group: $checkedConvert(
          'group',
          (v) => v == null
              ? null
              : DatabaseOwnerGroup.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DatabaseOwnerToJson(DatabaseOwner instance) =>
    <String, dynamic>{
      'user': ?instance.user?.toJson(),
      'group': ?instance.group?.toJson(),
    };
