// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_get.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GroupsGetCWProxy {
  GroupsGet groups(List<GroupsGetGroupsInner>? groups);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupsGet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupsGet(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupsGet call({List<GroupsGetGroupsInner>? groups});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGroupsGet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGroupsGet.copyWith.fieldName(...)`
class _$GroupsGetCWProxyImpl implements _$GroupsGetCWProxy {
  const _$GroupsGetCWProxyImpl(this._value);

  final GroupsGet _value;

  @override
  GroupsGet groups(List<GroupsGetGroupsInner>? groups) => this(groups: groups);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupsGet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupsGet(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupsGet call({Object? groups = const $CopyWithPlaceholder()}) {
    return GroupsGet(
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<GroupsGetGroupsInner>?,
    );
  }
}

extension $GroupsGetCopyWith on GroupsGet {
  /// Returns a callable class that can be used as follows: `instanceOfGroupsGet.copyWith(...)` or like so:`instanceOfGroupsGet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GroupsGetCWProxy get copyWith => _$GroupsGetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupsGet _$GroupsGetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GroupsGet', json, ($checkedConvert) {
      final val = GroupsGet(
        groups: $checkedConvert(
          'groups',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => GroupsGetGroupsInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$GroupsGetToJson(GroupsGet instance) => <String, dynamic>{
  'groups': ?instance.groups?.map((e) => e.toJson()).toList(),
};
