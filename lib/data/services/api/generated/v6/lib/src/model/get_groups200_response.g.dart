// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_groups200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetGroups200ResponseCWProxy {
  GetGroups200Response groups(List<GroupsGetGroupsInner>? groups);

  GetGroups200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetGroups200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetGroups200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetGroups200Response call({List<GroupsGetGroupsInner>? groups, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetGroups200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetGroups200Response.copyWith.fieldName(...)`
class _$GetGroups200ResponseCWProxyImpl
    implements _$GetGroups200ResponseCWProxy {
  const _$GetGroups200ResponseCWProxyImpl(this._value);

  final GetGroups200Response _value;

  @override
  GetGroups200Response groups(List<GroupsGetGroupsInner>? groups) =>
      this(groups: groups);

  @override
  GetGroups200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetGroups200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetGroups200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetGroups200Response call({
    Object? groups = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetGroups200Response(
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<GroupsGetGroupsInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetGroups200ResponseCopyWith on GetGroups200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetGroups200Response.copyWith(...)` or like so:`instanceOfGetGroups200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetGroups200ResponseCWProxy get copyWith =>
      _$GetGroups200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGroups200Response _$GetGroups200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetGroups200Response', json, ($checkedConvert) {
  final val = GetGroups200Response(
    groups: $checkedConvert(
      'groups',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GroupsGetGroupsInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetGroups200ResponseToJson(
  GetGroups200Response instance,
) => <String, dynamic>{
  'groups': ?instance.groups?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
