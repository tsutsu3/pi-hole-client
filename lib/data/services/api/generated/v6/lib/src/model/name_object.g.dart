// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_object.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NameObjectCWProxy {
  NameObject name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NameObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NameObject(...).copyWith(id: 12, name: "My name")
  /// ````
  NameObject call({String? name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNameObject.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNameObject.copyWith.fieldName(...)`
class _$NameObjectCWProxyImpl implements _$NameObjectCWProxy {
  const _$NameObjectCWProxyImpl(this._value);

  final NameObject _value;

  @override
  NameObject name(String? name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NameObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NameObject(...).copyWith(id: 12, name: "My name")
  /// ````
  NameObject call({Object? name = const $CopyWithPlaceholder()}) {
    return NameObject(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $NameObjectCopyWith on NameObject {
  /// Returns a callable class that can be used as follows: `instanceOfNameObject.copyWith(...)` or like so:`instanceOfNameObject.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NameObjectCWProxy get copyWith => _$NameObjectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameObject _$NameObjectFromJson(Map<String, dynamic> json) => $checkedCreate(
  'NameObject',
  json,
  ($checkedConvert) {
    final val = NameObject(name: $checkedConvert('name', (v) => v as String?));
    return val;
  },
);

Map<String, dynamic> _$NameObjectToJson(NameObject instance) =>
    <String, dynamic>{'name': ?instance.name};
