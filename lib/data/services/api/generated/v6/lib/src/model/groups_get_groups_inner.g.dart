// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_get_groups_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GroupsGetGroupsInnerCWProxy {
  GroupsGetGroupsInner name(String? name);

  GroupsGetGroupsInner comment(String? comment);

  GroupsGetGroupsInner enabled(bool? enabled);

  GroupsGetGroupsInner id(int? id);

  GroupsGetGroupsInner dateAdded(int? dateAdded);

  GroupsGetGroupsInner dateModified(int? dateModified);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupsGetGroupsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupsGetGroupsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupsGetGroupsInner call({
    String? name,
    String? comment,
    bool? enabled,
    int? id,
    int? dateAdded,
    int? dateModified,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGroupsGetGroupsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGroupsGetGroupsInner.copyWith.fieldName(...)`
class _$GroupsGetGroupsInnerCWProxyImpl
    implements _$GroupsGetGroupsInnerCWProxy {
  const _$GroupsGetGroupsInnerCWProxyImpl(this._value);

  final GroupsGetGroupsInner _value;

  @override
  GroupsGetGroupsInner name(String? name) => this(name: name);

  @override
  GroupsGetGroupsInner comment(String? comment) => this(comment: comment);

  @override
  GroupsGetGroupsInner enabled(bool? enabled) => this(enabled: enabled);

  @override
  GroupsGetGroupsInner id(int? id) => this(id: id);

  @override
  GroupsGetGroupsInner dateAdded(int? dateAdded) => this(dateAdded: dateAdded);

  @override
  GroupsGetGroupsInner dateModified(int? dateModified) =>
      this(dateModified: dateModified);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupsGetGroupsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupsGetGroupsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupsGetGroupsInner call({
    Object? name = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? dateAdded = const $CopyWithPlaceholder(),
    Object? dateModified = const $CopyWithPlaceholder(),
  }) {
    return GroupsGetGroupsInner(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
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

extension $GroupsGetGroupsInnerCopyWith on GroupsGetGroupsInner {
  /// Returns a callable class that can be used as follows: `instanceOfGroupsGetGroupsInner.copyWith(...)` or like so:`instanceOfGroupsGetGroupsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GroupsGetGroupsInnerCWProxy get copyWith =>
      _$GroupsGetGroupsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupsGetGroupsInner _$GroupsGetGroupsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GroupsGetGroupsInner',
  json,
  ($checkedConvert) {
    final val = GroupsGetGroupsInner(
      name: $checkedConvert('name', (v) => v as String?),
      comment: $checkedConvert('comment', (v) => v as String?),
      enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
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

Map<String, dynamic> _$GroupsGetGroupsInnerToJson(
  GroupsGetGroupsInner instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'comment': ?instance.comment,
  'enabled': ?instance.enabled,
  'id': ?instance.id,
  'date_added': ?instance.dateAdded,
  'date_modified': ?instance.dateModified,
};
