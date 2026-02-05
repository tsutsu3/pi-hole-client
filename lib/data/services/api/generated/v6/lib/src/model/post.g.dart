// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostCWProxy {
  Post domain(StringOrList? domain);

  Post comment(String? comment);

  Post groups(List<int>? groups);

  Post enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Post(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Post(...).copyWith(id: 12, name: "My name")
  /// ````
  Post call({
    StringOrList? domain,
    String? comment,
    List<int>? groups,
    bool? enabled,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPost.copyWith.fieldName(...)`
class _$PostCWProxyImpl implements _$PostCWProxy {
  const _$PostCWProxyImpl(this._value);

  final Post _value;

  @override
  Post domain(StringOrList? domain) => this(domain: domain);

  @override
  Post comment(String? comment) => this(comment: comment);

  @override
  Post groups(List<int>? groups) => this(groups: groups);

  @override
  Post enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Post(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Post(...).copyWith(id: 12, name: "My name")
  /// ````
  Post call({
    Object? domain = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return Post(
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as StringOrList?,
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

extension $PostCopyWith on Post {
  /// Returns a callable class that can be used as follows: `instanceOfPost.copyWith(...)` or like so:`instanceOfPost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostCWProxy get copyWith => _$PostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Post', json, ($checkedConvert) {
      final val = Post(
        domain: $checkedConvert(
          'domain',
          (v) => v == null ? null : StringOrList.fromJson(v),
        ),
        comment: $checkedConvert('comment', (v) => v as String?),
        groups: $checkedConvert(
          'groups',
          (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
        ),
        enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
  'domain': ?instance.domain?.toJson(),
  'comment': ?instance.comment,
  'groups': ?instance.groups,
  'enabled': ?instance.enabled,
};
