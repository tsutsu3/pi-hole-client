// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components_schemas_comment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ComponentsSchemasCommentCWProxy {
  ComponentsSchemasComment comment(String? comment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasComment(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasComment call({String? comment});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfComponentsSchemasComment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfComponentsSchemasComment.copyWith.fieldName(...)`
class _$ComponentsSchemasCommentCWProxyImpl
    implements _$ComponentsSchemasCommentCWProxy {
  const _$ComponentsSchemasCommentCWProxyImpl(this._value);

  final ComponentsSchemasComment _value;

  @override
  ComponentsSchemasComment comment(String? comment) => this(comment: comment);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ComponentsSchemasComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ComponentsSchemasComment(...).copyWith(id: 12, name: "My name")
  /// ````
  ComponentsSchemasComment call({
    Object? comment = const $CopyWithPlaceholder(),
  }) {
    return ComponentsSchemasComment(
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
    );
  }
}

extension $ComponentsSchemasCommentCopyWith on ComponentsSchemasComment {
  /// Returns a callable class that can be used as follows: `instanceOfComponentsSchemasComment.copyWith(...)` or like so:`instanceOfComponentsSchemasComment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ComponentsSchemasCommentCWProxy get copyWith =>
      _$ComponentsSchemasCommentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentsSchemasComment _$ComponentsSchemasCommentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ComponentsSchemasComment', json, ($checkedConvert) {
  final val = ComponentsSchemasComment(
    comment: $checkedConvert('comment', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ComponentsSchemasCommentToJson(
  ComponentsSchemasComment instance,
) => <String, dynamic>{'comment': ?instance.comment};
