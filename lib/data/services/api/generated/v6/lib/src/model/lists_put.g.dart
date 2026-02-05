// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_put.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsPutCWProxy {
  ListsPut comment(String? comment);

  ListsPut type(ListsPutTypeEnum? type);

  ListsPut groups(List<int>? groups);

  ListsPut enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsPut(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsPut(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsPut call({
    String? comment,
    ListsPutTypeEnum? type,
    List<int>? groups,
    bool? enabled,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsPut.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsPut.copyWith.fieldName(...)`
class _$ListsPutCWProxyImpl implements _$ListsPutCWProxy {
  const _$ListsPutCWProxyImpl(this._value);

  final ListsPut _value;

  @override
  ListsPut comment(String? comment) => this(comment: comment);

  @override
  ListsPut type(ListsPutTypeEnum? type) => this(type: type);

  @override
  ListsPut groups(List<int>? groups) => this(groups: groups);

  @override
  ListsPut enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsPut(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsPut(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsPut call({
    Object? comment = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return ListsPut(
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ListsPutTypeEnum?,
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

extension $ListsPutCopyWith on ListsPut {
  /// Returns a callable class that can be used as follows: `instanceOfListsPut.copyWith(...)` or like so:`instanceOfListsPut.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsPutCWProxy get copyWith => _$ListsPutCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsPut _$ListsPutFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListsPut', json, ($checkedConvert) {
      final val = ListsPut(
        comment: $checkedConvert('comment', (v) => v as String?),
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$ListsPutTypeEnumEnumMap, v),
        ),
        groups: $checkedConvert(
          'groups',
          (v) =>
              (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
              [0],
        ),
        enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$ListsPutToJson(ListsPut instance) => <String, dynamic>{
  'comment': ?instance.comment,
  'type': ?_$ListsPutTypeEnumEnumMap[instance.type],
  'groups': ?instance.groups,
  'enabled': ?instance.enabled,
};

const _$ListsPutTypeEnumEnumMap = {
  ListsPutTypeEnum.allow: 'allow',
  ListsPutTypeEnum.block: 'block',
};
