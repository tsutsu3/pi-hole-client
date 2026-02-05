// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_object.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressObjectCWProxy {
  AddressObject address(String? address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddressObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddressObject(...).copyWith(id: 12, name: "My name")
  /// ````
  AddressObject call({String? address});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddressObject.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddressObject.copyWith.fieldName(...)`
class _$AddressObjectCWProxyImpl implements _$AddressObjectCWProxy {
  const _$AddressObjectCWProxyImpl(this._value);

  final AddressObject _value;

  @override
  AddressObject address(String? address) => this(address: address);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddressObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddressObject(...).copyWith(id: 12, name: "My name")
  /// ````
  AddressObject call({Object? address = const $CopyWithPlaceholder()}) {
    return AddressObject(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
    );
  }
}

extension $AddressObjectCopyWith on AddressObject {
  /// Returns a callable class that can be used as follows: `instanceOfAddressObject.copyWith(...)` or like so:`instanceOfAddressObject.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddressObjectCWProxy get copyWith => _$AddressObjectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressObject _$AddressObjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddressObject', json, ($checkedConvert) {
      final val = AddressObject(
        address: $checkedConvert('address', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AddressObjectToJson(AddressObject instance) =>
    <String, dynamic>{'address': ?instance.address};
