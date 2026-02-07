// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_queries_queries_inner_reply.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasQueriesQueriesInnerReplyCWProxy {
  SchemasQueriesQueriesInnerReply type(String? type);

  SchemasQueriesQueriesInnerReply time(num? time);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasQueriesQueriesInnerReply(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasQueriesQueriesInnerReply(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasQueriesQueriesInnerReply call({String? type, num? time});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasQueriesQueriesInnerReply.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasQueriesQueriesInnerReply.copyWith.fieldName(...)`
class _$SchemasQueriesQueriesInnerReplyCWProxyImpl
    implements _$SchemasQueriesQueriesInnerReplyCWProxy {
  const _$SchemasQueriesQueriesInnerReplyCWProxyImpl(this._value);

  final SchemasQueriesQueriesInnerReply _value;

  @override
  SchemasQueriesQueriesInnerReply type(String? type) => this(type: type);

  @override
  SchemasQueriesQueriesInnerReply time(num? time) => this(time: time);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasQueriesQueriesInnerReply(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasQueriesQueriesInnerReply(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasQueriesQueriesInnerReply call({
    Object? type = const $CopyWithPlaceholder(),
    Object? time = const $CopyWithPlaceholder(),
  }) {
    return SchemasQueriesQueriesInnerReply(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      time: time == const $CopyWithPlaceholder()
          ? _value.time
          // ignore: cast_nullable_to_non_nullable
          : time as num?,
    );
  }
}

extension $SchemasQueriesQueriesInnerReplyCopyWith
    on SchemasQueriesQueriesInnerReply {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasQueriesQueriesInnerReply.copyWith(...)` or like so:`instanceOfSchemasQueriesQueriesInnerReply.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasQueriesQueriesInnerReplyCWProxy get copyWith =>
      _$SchemasQueriesQueriesInnerReplyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasQueriesQueriesInnerReply _$SchemasQueriesQueriesInnerReplyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SchemasQueriesQueriesInnerReply', json, ($checkedConvert) {
  final val = SchemasQueriesQueriesInnerReply(
    type: $checkedConvert('type', (v) => v as String?),
    time: $checkedConvert('time', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$SchemasQueriesQueriesInnerReplyToJson(
  SchemasQueriesQueriesInnerReply instance,
) => <String, dynamic>{'type': ?instance.type, 'time': ?instance.time};
