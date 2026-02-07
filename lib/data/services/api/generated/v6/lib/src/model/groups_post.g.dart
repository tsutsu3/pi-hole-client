// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_post.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GroupsPostCWProxy {
  GroupsPost name(StringOrList? name);

  GroupsPost comment(String? comment);

  GroupsPost enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupsPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupsPost(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupsPost call({StringOrList? name, String? comment, bool? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGroupsPost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGroupsPost.copyWith.fieldName(...)`
class _$GroupsPostCWProxyImpl implements _$GroupsPostCWProxy {
  const _$GroupsPostCWProxyImpl(this._value);

  final GroupsPost _value;

  @override
  GroupsPost name(StringOrList? name) => this(name: name);

  @override
  GroupsPost comment(String? comment) => this(comment: comment);

  @override
  GroupsPost enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupsPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupsPost(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupsPost call({
    Object? name = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return GroupsPost(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as StringOrList?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
    );
  }
}

extension $GroupsPostCopyWith on GroupsPost {
  /// Returns a callable class that can be used as follows: `instanceOfGroupsPost.copyWith(...)` or like so:`instanceOfGroupsPost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GroupsPostCWProxy get copyWith => _$GroupsPostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupsPost _$GroupsPostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GroupsPost', json, ($checkedConvert) {
      final val = GroupsPost(
        name: $checkedConvert(
          'name',
          (v) => v == null ? null : StringOrList.fromJson(v),
        ),
        comment: $checkedConvert('comment', (v) => v as String?),
        enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$GroupsPostToJson(GroupsPost instance) =>
    <String, dynamic>{
      'name': ?instance.name?.toJson(),
      'comment': ?instance.comment,
      'enabled': ?instance.enabled,
    };
