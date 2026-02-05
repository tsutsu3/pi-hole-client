// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_post.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsPostCWProxy {
  ListsPost address(StringOrList? address);

  ListsPost comment(String? comment);

  ListsPost groups(List<int>? groups);

  ListsPost enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsPost(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsPost call({
    StringOrList? address,
    String? comment,
    List<int>? groups,
    bool? enabled,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsPost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsPost.copyWith.fieldName(...)`
class _$ListsPostCWProxyImpl implements _$ListsPostCWProxy {
  const _$ListsPostCWProxyImpl(this._value);

  final ListsPost _value;

  @override
  ListsPost address(StringOrList? address) => this(address: address);

  @override
  ListsPost comment(String? comment) => this(comment: comment);

  @override
  ListsPost groups(List<int>? groups) => this(groups: groups);

  @override
  ListsPost enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsPost(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsPost call({
    Object? address = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return ListsPost(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as StringOrList?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<int>?,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
    );
  }
}

extension $ListsPostCopyWith on ListsPost {
  /// Returns a callable class that can be used as follows: `instanceOfListsPost.copyWith(...)` or like so:`instanceOfListsPost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsPostCWProxy get copyWith => _$ListsPostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsPost _$ListsPostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListsPost', json, ($checkedConvert) {
      final val = ListsPost(
        address: $checkedConvert(
          'address',
          (v) => v == null ? null : StringOrList.fromJson(v),
        ),
        comment: $checkedConvert('comment', (v) => v as String?),
        groups: $checkedConvert(
          'groups',
          (v) =>
              (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
              [0],
        ),
        enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$ListsPostToJson(ListsPost instance) => <String, dynamic>{
  'address': ?instance.address?.toJson(),
  'comment': ?instance.comment,
  'groups': ?instance.groups,
  'enabled': ?instance.enabled,
};
