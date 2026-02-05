// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TypeCWProxy {
  Type type(TypeTypeEnum? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Type(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Type(...).copyWith(id: 12, name: "My name")
  /// ````
  Type call({TypeTypeEnum? type});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfType.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfType.copyWith.fieldName(...)`
class _$TypeCWProxyImpl implements _$TypeCWProxy {
  const _$TypeCWProxyImpl(this._value);

  final Type _value;

  @override
  Type type(TypeTypeEnum? type) => this(type: type);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Type(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Type(...).copyWith(id: 12, name: "My name")
  /// ````
  Type call({Object? type = const $CopyWithPlaceholder()}) {
    return Type(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TypeTypeEnum?,
    );
  }
}

extension $TypeCopyWith on Type {
  /// Returns a callable class that can be used as follows: `instanceOfType.copyWith(...)` or like so:`instanceOfType.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TypeCWProxy get copyWith => _$TypeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Type _$TypeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Type', json, ($checkedConvert) {
      final val = Type(
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$TypeTypeEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
  'type': ?_$TypeTypeEnumEnumMap[instance.type],
};

const _$TypeTypeEnumEnumMap = {
  TypeTypeEnum.allow: 'allow',
  TypeTypeEnum.deny: 'deny',
};
