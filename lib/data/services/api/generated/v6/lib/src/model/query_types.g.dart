// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_types.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QueryTypesCWProxy {
  QueryTypes types(QueryTypesTypes? types);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryTypes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryTypes(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryTypes call({QueryTypesTypes? types});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueryTypes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueryTypes.copyWith.fieldName(...)`
class _$QueryTypesCWProxyImpl implements _$QueryTypesCWProxy {
  const _$QueryTypesCWProxyImpl(this._value);

  final QueryTypes _value;

  @override
  QueryTypes types(QueryTypesTypes? types) => this(types: types);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryTypes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryTypes(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryTypes call({Object? types = const $CopyWithPlaceholder()}) {
    return QueryTypes(
      types: types == const $CopyWithPlaceholder()
          ? _value.types
          // ignore: cast_nullable_to_non_nullable
          : types as QueryTypesTypes?,
    );
  }
}

extension $QueryTypesCopyWith on QueryTypes {
  /// Returns a callable class that can be used as follows: `instanceOfQueryTypes.copyWith(...)` or like so:`instanceOfQueryTypes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueryTypesCWProxy get copyWith => _$QueryTypesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryTypes _$QueryTypesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('QueryTypes', json, ($checkedConvert) {
      final val = QueryTypes(
        types: $checkedConvert(
          'types',
          (v) => v == null
              ? null
              : QueryTypesTypes.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$QueryTypesToJson(QueryTypes instance) =>
    <String, dynamic>{'types': ?instance.types?.toJson()};
