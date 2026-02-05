// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_groups.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasGroupsCWProxy {
  SchemasGroups groups(List<int>? groups);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasGroups(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasGroups(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasGroups call({List<int>? groups});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasGroups.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasGroups.copyWith.fieldName(...)`
class _$SchemasGroupsCWProxyImpl implements _$SchemasGroupsCWProxy {
  const _$SchemasGroupsCWProxyImpl(this._value);

  final SchemasGroups _value;

  @override
  SchemasGroups groups(List<int>? groups) => this(groups: groups);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasGroups(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasGroups(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasGroups call({Object? groups = const $CopyWithPlaceholder()}) {
    return SchemasGroups(
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<int>?,
    );
  }
}

extension $SchemasGroupsCopyWith on SchemasGroups {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasGroups.copyWith(...)` or like so:`instanceOfSchemasGroups.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasGroupsCWProxy get copyWith => _$SchemasGroupsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasGroups _$SchemasGroupsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SchemasGroups', json, ($checkedConvert) {
      final val = SchemasGroups(
        groups: $checkedConvert(
          'groups',
          (v) =>
              (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
              [0],
        ),
      );
      return val;
    });

Map<String, dynamic> _$SchemasGroupsToJson(SchemasGroups instance) =>
    <String, dynamic>{'groups': ?instance.groups};
