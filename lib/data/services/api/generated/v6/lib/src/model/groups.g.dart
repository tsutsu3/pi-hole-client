// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GroupsCWProxy {
  Groups groups(List<int>? groups);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Groups(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Groups(...).copyWith(id: 12, name: "My name")
  /// ````
  Groups call({List<int>? groups});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGroups.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGroups.copyWith.fieldName(...)`
class _$GroupsCWProxyImpl implements _$GroupsCWProxy {
  const _$GroupsCWProxyImpl(this._value);

  final Groups _value;

  @override
  Groups groups(List<int>? groups) => this(groups: groups);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Groups(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Groups(...).copyWith(id: 12, name: "My name")
  /// ````
  Groups call({Object? groups = const $CopyWithPlaceholder()}) {
    return Groups(
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<int>?,
    );
  }
}

extension $GroupsCopyWith on Groups {
  /// Returns a callable class that can be used as follows: `instanceOfGroups.copyWith(...)` or like so:`instanceOfGroups.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GroupsCWProxy get copyWith => _$GroupsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Groups _$GroupsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Groups', json, ($checkedConvert) {
      final val = Groups(
        groups: $checkedConvert(
          'groups',
          (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$GroupsToJson(Groups instance) => <String, dynamic>{
  'groups': ?instance.groups,
};
