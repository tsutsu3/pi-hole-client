// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_client_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReplaceClientRequestCWProxy {
  ReplaceClientRequest comment(String? comment);

  ReplaceClientRequest groups(List<int>? groups);

  ReplaceClientRequest took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceClientRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceClientRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceClientRequest call({String? comment, List<int>? groups, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReplaceClientRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReplaceClientRequest.copyWith.fieldName(...)`
class _$ReplaceClientRequestCWProxyImpl
    implements _$ReplaceClientRequestCWProxy {
  const _$ReplaceClientRequestCWProxyImpl(this._value);

  final ReplaceClientRequest _value;

  @override
  ReplaceClientRequest comment(String? comment) => this(comment: comment);

  @override
  ReplaceClientRequest groups(List<int>? groups) => this(groups: groups);

  @override
  ReplaceClientRequest took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceClientRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceClientRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceClientRequest call({
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ReplaceClientRequest(
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<int>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ReplaceClientRequestCopyWith on ReplaceClientRequest {
  /// Returns a callable class that can be used as follows: `instanceOfReplaceClientRequest.copyWith(...)` or like so:`instanceOfReplaceClientRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReplaceClientRequestCWProxy get copyWith =>
      _$ReplaceClientRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceClientRequest _$ReplaceClientRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReplaceClientRequest', json, ($checkedConvert) {
  final val = ReplaceClientRequest(
    comment: $checkedConvert('comment', (v) => v as String?),
    groups: $checkedConvert(
      'groups',
      (v) =>
          (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ?? [0],
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ReplaceClientRequestToJson(
  ReplaceClientRequest instance,
) => <String, dynamic>{
  'comment': ?instance.comment,
  'groups': ?instance.groups,
  'took': ?instance.took,
};
