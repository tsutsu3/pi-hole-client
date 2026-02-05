// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_queries_queries_inner_ede.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasQueriesQueriesInnerEdeCWProxy {
  SchemasQueriesQueriesInnerEde code(int? code);

  SchemasQueriesQueriesInnerEde text(String? text);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasQueriesQueriesInnerEde(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasQueriesQueriesInnerEde(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasQueriesQueriesInnerEde call({int? code, String? text});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasQueriesQueriesInnerEde.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasQueriesQueriesInnerEde.copyWith.fieldName(...)`
class _$SchemasQueriesQueriesInnerEdeCWProxyImpl
    implements _$SchemasQueriesQueriesInnerEdeCWProxy {
  const _$SchemasQueriesQueriesInnerEdeCWProxyImpl(this._value);

  final SchemasQueriesQueriesInnerEde _value;

  @override
  SchemasQueriesQueriesInnerEde code(int? code) => this(code: code);

  @override
  SchemasQueriesQueriesInnerEde text(String? text) => this(text: text);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasQueriesQueriesInnerEde(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasQueriesQueriesInnerEde(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasQueriesQueriesInnerEde call({
    Object? code = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return SchemasQueriesQueriesInnerEde(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as int?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
    );
  }
}

extension $SchemasQueriesQueriesInnerEdeCopyWith
    on SchemasQueriesQueriesInnerEde {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasQueriesQueriesInnerEde.copyWith(...)` or like so:`instanceOfSchemasQueriesQueriesInnerEde.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasQueriesQueriesInnerEdeCWProxy get copyWith =>
      _$SchemasQueriesQueriesInnerEdeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasQueriesQueriesInnerEde _$SchemasQueriesQueriesInnerEdeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SchemasQueriesQueriesInnerEde', json, ($checkedConvert) {
  final val = SchemasQueriesQueriesInnerEde(
    code: $checkedConvert('code', (v) => (v as num?)?.toInt()),
    text: $checkedConvert('text', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SchemasQueriesQueriesInnerEdeToJson(
  SchemasQueriesQueriesInnerEde instance,
) => <String, dynamic>{'code': ?instance.code, 'text': ?instance.text};
