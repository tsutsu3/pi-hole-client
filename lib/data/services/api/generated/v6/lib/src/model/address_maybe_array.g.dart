// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_maybe_array.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressMaybeArrayCWProxy {
  AddressMaybeArray address(StringOrList? address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddressMaybeArray(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddressMaybeArray(...).copyWith(id: 12, name: "My name")
  /// ````
  AddressMaybeArray call({StringOrList? address});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddressMaybeArray.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddressMaybeArray.copyWith.fieldName(...)`
class _$AddressMaybeArrayCWProxyImpl implements _$AddressMaybeArrayCWProxy {
  const _$AddressMaybeArrayCWProxyImpl(this._value);

  final AddressMaybeArray _value;

  @override
  AddressMaybeArray address(StringOrList? address) => this(address: address);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddressMaybeArray(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddressMaybeArray(...).copyWith(id: 12, name: "My name")
  /// ````
  AddressMaybeArray call({Object? address = const $CopyWithPlaceholder()}) {
    return AddressMaybeArray(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as StringOrList?,
    );
  }
}

extension $AddressMaybeArrayCopyWith on AddressMaybeArray {
  /// Returns a callable class that can be used as follows: `instanceOfAddressMaybeArray.copyWith(...)` or like so:`instanceOfAddressMaybeArray.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddressMaybeArrayCWProxy get copyWith =>
      _$AddressMaybeArrayCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressMaybeArray _$AddressMaybeArrayFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddressMaybeArray', json, ($checkedConvert) {
      final val = AddressMaybeArray(
        address: $checkedConvert(
          'address',
          (v) => v == null ? null : StringOrList.fromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AddressMaybeArrayToJson(AddressMaybeArray instance) =>
    <String, dynamic>{'address': ?instance.address?.toJson()};
