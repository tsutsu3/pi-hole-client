// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PutCWProxy {
  Put type(PutTypeEnum? type);

  Put kind(PutKindEnum? kind);

  Put comment(String? comment);

  Put groups(List<int>? groups);

  Put enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Put(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Put(...).copyWith(id: 12, name: "My name")
  /// ````
  Put call({
    PutTypeEnum? type,
    PutKindEnum? kind,
    String? comment,
    List<int>? groups,
    bool? enabled,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPut.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPut.copyWith.fieldName(...)`
class _$PutCWProxyImpl implements _$PutCWProxy {
  const _$PutCWProxyImpl(this._value);

  final Put _value;

  @override
  Put type(PutTypeEnum? type) => this(type: type);

  @override
  Put kind(PutKindEnum? kind) => this(kind: kind);

  @override
  Put comment(String? comment) => this(comment: comment);

  @override
  Put groups(List<int>? groups) => this(groups: groups);

  @override
  Put enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Put(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Put(...).copyWith(id: 12, name: "My name")
  /// ````
  Put call({
    Object? type = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return Put(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as PutTypeEnum?,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as PutKindEnum?,
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

extension $PutCopyWith on Put {
  /// Returns a callable class that can be used as follows: `instanceOfPut.copyWith(...)` or like so:`instanceOfPut.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PutCWProxy get copyWith => _$PutCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Put _$PutFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Put', json, ($checkedConvert) {
      final val = Put(
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$PutTypeEnumEnumMap, v),
        ),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$PutKindEnumEnumMap, v),
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

Map<String, dynamic> _$PutToJson(Put instance) => <String, dynamic>{
  'type': ?_$PutTypeEnumEnumMap[instance.type],
  'kind': ?_$PutKindEnumEnumMap[instance.kind],
  'comment': ?instance.comment,
  'groups': ?instance.groups,
  'enabled': ?instance.enabled,
};

const _$PutTypeEnumEnumMap = {
  PutTypeEnum.allow: 'allow',
  PutTypeEnum.deny: 'deny',
};

const _$PutKindEnumEnumMap = {
  PutKindEnum.exact: 'exact',
  PutKindEnum.regex: 'regex',
};
