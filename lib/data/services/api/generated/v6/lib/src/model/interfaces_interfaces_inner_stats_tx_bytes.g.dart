// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interfaces_interfaces_inner_stats_tx_bytes.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InterfacesInterfacesInnerStatsTxBytesCWProxy {
  InterfacesInterfacesInnerStatsTxBytes value(num? value);

  InterfacesInterfacesInnerStatsTxBytes unit(String? unit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InterfacesInterfacesInnerStatsTxBytes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InterfacesInterfacesInnerStatsTxBytes(...).copyWith(id: 12, name: "My name")
  /// ````
  InterfacesInterfacesInnerStatsTxBytes call({num? value, String? unit});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInterfacesInterfacesInnerStatsTxBytes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInterfacesInterfacesInnerStatsTxBytes.copyWith.fieldName(...)`
class _$InterfacesInterfacesInnerStatsTxBytesCWProxyImpl
    implements _$InterfacesInterfacesInnerStatsTxBytesCWProxy {
  const _$InterfacesInterfacesInnerStatsTxBytesCWProxyImpl(this._value);

  final InterfacesInterfacesInnerStatsTxBytes _value;

  @override
  InterfacesInterfacesInnerStatsTxBytes value(num? value) => this(value: value);

  @override
  InterfacesInterfacesInnerStatsTxBytes unit(String? unit) => this(unit: unit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InterfacesInterfacesInnerStatsTxBytes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InterfacesInterfacesInnerStatsTxBytes(...).copyWith(id: 12, name: "My name")
  /// ````
  InterfacesInterfacesInnerStatsTxBytes call({
    Object? value = const $CopyWithPlaceholder(),
    Object? unit = const $CopyWithPlaceholder(),
  }) {
    return InterfacesInterfacesInnerStatsTxBytes(
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as num?,
      unit: unit == const $CopyWithPlaceholder()
          ? _value.unit
          // ignore: cast_nullable_to_non_nullable
          : unit as String?,
    );
  }
}

extension $InterfacesInterfacesInnerStatsTxBytesCopyWith
    on InterfacesInterfacesInnerStatsTxBytes {
  /// Returns a callable class that can be used as follows: `instanceOfInterfacesInterfacesInnerStatsTxBytes.copyWith(...)` or like so:`instanceOfInterfacesInterfacesInnerStatsTxBytes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InterfacesInterfacesInnerStatsTxBytesCWProxy get copyWith =>
      _$InterfacesInterfacesInnerStatsTxBytesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterfacesInterfacesInnerStatsTxBytes
_$InterfacesInterfacesInnerStatsTxBytesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InterfacesInterfacesInnerStatsTxBytes', json, (
      $checkedConvert,
    ) {
      final val = InterfacesInterfacesInnerStatsTxBytes(
        value: $checkedConvert('value', (v) => v as num?),
        unit: $checkedConvert('unit', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$InterfacesInterfacesInnerStatsTxBytesToJson(
  InterfacesInterfacesInnerStatsTxBytes instance,
) => <String, dynamic>{'value': ?instance.value, 'unit': ?instance.unit};
