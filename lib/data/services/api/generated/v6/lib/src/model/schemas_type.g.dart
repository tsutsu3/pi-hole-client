// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_type.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasTypeCWProxy {
  SchemasType type(SchemasTypeTypeEnum? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasType(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasType(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasType call({SchemasTypeTypeEnum? type});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasType.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasType.copyWith.fieldName(...)`
class _$SchemasTypeCWProxyImpl implements _$SchemasTypeCWProxy {
  const _$SchemasTypeCWProxyImpl(this._value);

  final SchemasType _value;

  @override
  SchemasType type(SchemasTypeTypeEnum? type) => this(type: type);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasType(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasType(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasType call({Object? type = const $CopyWithPlaceholder()}) {
    return SchemasType(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as SchemasTypeTypeEnum?,
    );
  }
}

extension $SchemasTypeCopyWith on SchemasType {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasType.copyWith(...)` or like so:`instanceOfSchemasType.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasTypeCWProxy get copyWith => _$SchemasTypeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasType _$SchemasTypeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SchemasType', json, ($checkedConvert) {
      final val = SchemasType(
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$SchemasTypeTypeEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SchemasTypeToJson(SchemasType instance) =>
    <String, dynamic>{'type': ?_$SchemasTypeTypeEnumEnumMap[instance.type]};

const _$SchemasTypeTypeEnumEnumMap = {
  SchemasTypeTypeEnum.allow: 'allow',
  SchemasTypeTypeEnum.block: 'block',
};
