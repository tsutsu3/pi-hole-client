// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_group200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReplaceGroup200ResponseCWProxy {
  ReplaceGroup200Response groups(List<GroupsGetGroupsInner>? groups);

  ReplaceGroup200Response processed(SchemasListsProcessedProcessed? processed);

  ReplaceGroup200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceGroup200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceGroup200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceGroup200Response call({
    List<GroupsGetGroupsInner>? groups,
    SchemasListsProcessedProcessed? processed,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReplaceGroup200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReplaceGroup200Response.copyWith.fieldName(...)`
class _$ReplaceGroup200ResponseCWProxyImpl
    implements _$ReplaceGroup200ResponseCWProxy {
  const _$ReplaceGroup200ResponseCWProxyImpl(this._value);

  final ReplaceGroup200Response _value;

  @override
  ReplaceGroup200Response groups(List<GroupsGetGroupsInner>? groups) =>
      this(groups: groups);

  @override
  ReplaceGroup200Response processed(
    SchemasListsProcessedProcessed? processed,
  ) => this(processed: processed);

  @override
  ReplaceGroup200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceGroup200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceGroup200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceGroup200Response call({
    Object? groups = const $CopyWithPlaceholder(),
    Object? processed = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ReplaceGroup200Response(
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<GroupsGetGroupsInner>?,
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as SchemasListsProcessedProcessed?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ReplaceGroup200ResponseCopyWith on ReplaceGroup200Response {
  /// Returns a callable class that can be used as follows: `instanceOfReplaceGroup200Response.copyWith(...)` or like so:`instanceOfReplaceGroup200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReplaceGroup200ResponseCWProxy get copyWith =>
      _$ReplaceGroup200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceGroup200Response _$ReplaceGroup200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReplaceGroup200Response', json, ($checkedConvert) {
  final val = ReplaceGroup200Response(
    groups: $checkedConvert(
      'groups',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GroupsGetGroupsInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    processed: $checkedConvert(
      'processed',
      (v) => v == null
          ? null
          : SchemasListsProcessedProcessed.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ReplaceGroup200ResponseToJson(
  ReplaceGroup200Response instance,
) => <String, dynamic>{
  'groups': ?instance.groups?.map((e) => e.toJson()).toList(),
  'processed': ?instance.processed?.toJson(),
  'took': ?instance.took,
};
