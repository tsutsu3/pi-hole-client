// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_components_schemas_comment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsComponentsSchemasCommentCWProxy {
  ListsComponentsSchemasComment comment(String? comment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasComment(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasComment call({String? comment});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsComponentsSchemasComment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsComponentsSchemasComment.copyWith.fieldName(...)`
class _$ListsComponentsSchemasCommentCWProxyImpl
    implements _$ListsComponentsSchemasCommentCWProxy {
  const _$ListsComponentsSchemasCommentCWProxyImpl(this._value);

  final ListsComponentsSchemasComment _value;

  @override
  ListsComponentsSchemasComment comment(String? comment) =>
      this(comment: comment);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsComponentsSchemasComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsComponentsSchemasComment(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsComponentsSchemasComment call({
    Object? comment = const $CopyWithPlaceholder(),
  }) {
    return ListsComponentsSchemasComment(
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
    );
  }
}

extension $ListsComponentsSchemasCommentCopyWith
    on ListsComponentsSchemasComment {
  /// Returns a callable class that can be used as follows: `instanceOfListsComponentsSchemasComment.copyWith(...)` or like so:`instanceOfListsComponentsSchemasComment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsComponentsSchemasCommentCWProxy get copyWith =>
      _$ListsComponentsSchemasCommentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsComponentsSchemasComment _$ListsComponentsSchemasCommentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListsComponentsSchemasComment', json, ($checkedConvert) {
  final val = ListsComponentsSchemasComment(
    comment: $checkedConvert('comment', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ListsComponentsSchemasCommentToJson(
  ListsComponentsSchemasComment instance,
) => <String, dynamic>{'comment': ?instance.comment};
