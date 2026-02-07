// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_maybe_array.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NameMaybeArrayCWProxy {
  NameMaybeArray name(StringOrList? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NameMaybeArray(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NameMaybeArray(...).copyWith(id: 12, name: "My name")
  /// ````
  NameMaybeArray call({StringOrList? name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNameMaybeArray.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNameMaybeArray.copyWith.fieldName(...)`
class _$NameMaybeArrayCWProxyImpl implements _$NameMaybeArrayCWProxy {
  const _$NameMaybeArrayCWProxyImpl(this._value);

  final NameMaybeArray _value;

  @override
  NameMaybeArray name(StringOrList? name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NameMaybeArray(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NameMaybeArray(...).copyWith(id: 12, name: "My name")
  /// ````
  NameMaybeArray call({Object? name = const $CopyWithPlaceholder()}) {
    return NameMaybeArray(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as StringOrList?,
    );
  }
}

extension $NameMaybeArrayCopyWith on NameMaybeArray {
  /// Returns a callable class that can be used as follows: `instanceOfNameMaybeArray.copyWith(...)` or like so:`instanceOfNameMaybeArray.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NameMaybeArrayCWProxy get copyWith => _$NameMaybeArrayCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameMaybeArray _$NameMaybeArrayFromJson(Map<String, dynamic> json) =>
    $checkedCreate('NameMaybeArray', json, ($checkedConvert) {
      final val = NameMaybeArray(
        name: $checkedConvert(
          'name',
          (v) => v == null ? null : StringOrList.fromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NameMaybeArrayToJson(NameMaybeArray instance) =>
    <String, dynamic>{'name': ?instance.name?.toJson()};
