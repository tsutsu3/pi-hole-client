// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_comment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasCommentCWProxy {
  SchemasComment comment(String? comment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasComment(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasComment call({String? comment});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasComment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasComment.copyWith.fieldName(...)`
class _$SchemasCommentCWProxyImpl implements _$SchemasCommentCWProxy {
  const _$SchemasCommentCWProxyImpl(this._value);

  final SchemasComment _value;

  @override
  SchemasComment comment(String? comment) => this(comment: comment);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasComment(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasComment call({Object? comment = const $CopyWithPlaceholder()}) {
    return SchemasComment(
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
    );
  }
}

extension $SchemasCommentCopyWith on SchemasComment {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasComment.copyWith(...)` or like so:`instanceOfSchemasComment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasCommentCWProxy get copyWith => _$SchemasCommentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasComment _$SchemasCommentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SchemasComment', json, ($checkedConvert) {
      final val = SchemasComment(
        comment: $checkedConvert('comment', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SchemasCommentToJson(SchemasComment instance) =>
    <String, dynamic>{'comment': ?instance.comment};
