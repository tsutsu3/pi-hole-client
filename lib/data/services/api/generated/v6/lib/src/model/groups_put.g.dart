// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_put.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GroupsPutCWProxy {
  GroupsPut name(String? name);

  GroupsPut comment(String? comment);

  GroupsPut enabled(bool? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupsPut(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupsPut(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupsPut call({String? name, String? comment, bool? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGroupsPut.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGroupsPut.copyWith.fieldName(...)`
class _$GroupsPutCWProxyImpl implements _$GroupsPutCWProxy {
  const _$GroupsPutCWProxyImpl(this._value);

  final GroupsPut _value;

  @override
  GroupsPut name(String? name) => this(name: name);

  @override
  GroupsPut comment(String? comment) => this(comment: comment);

  @override
  GroupsPut enabled(bool? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupsPut(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupsPut(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupsPut call({
    Object? name = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return GroupsPut(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool?,
    );
  }
}

extension $GroupsPutCopyWith on GroupsPut {
  /// Returns a callable class that can be used as follows: `instanceOfGroupsPut.copyWith(...)` or like so:`instanceOfGroupsPut.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GroupsPutCWProxy get copyWith => _$GroupsPutCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupsPut _$GroupsPutFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GroupsPut', json, ($checkedConvert) {
      final val = GroupsPut(
        name: $checkedConvert('name', (v) => v as String?),
        comment: $checkedConvert('comment', (v) => v as String?),
        enabled: $checkedConvert('enabled', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$GroupsPutToJson(GroupsPut instance) => <String, dynamic>{
  'name': ?instance.name,
  'comment': ?instance.comment,
  'enabled': ?instance.enabled,
};
