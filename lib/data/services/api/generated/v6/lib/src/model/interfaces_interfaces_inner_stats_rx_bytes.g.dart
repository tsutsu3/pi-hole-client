// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interfaces_interfaces_inner_stats_rx_bytes.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InterfacesInterfacesInnerStatsRxBytesCWProxy {
  InterfacesInterfacesInnerStatsRxBytes value(num? value);

  InterfacesInterfacesInnerStatsRxBytes unit(String? unit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InterfacesInterfacesInnerStatsRxBytes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InterfacesInterfacesInnerStatsRxBytes(...).copyWith(id: 12, name: "My name")
  /// ````
  InterfacesInterfacesInnerStatsRxBytes call({num? value, String? unit});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInterfacesInterfacesInnerStatsRxBytes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInterfacesInterfacesInnerStatsRxBytes.copyWith.fieldName(...)`
class _$InterfacesInterfacesInnerStatsRxBytesCWProxyImpl
    implements _$InterfacesInterfacesInnerStatsRxBytesCWProxy {
  const _$InterfacesInterfacesInnerStatsRxBytesCWProxyImpl(this._value);

  final InterfacesInterfacesInnerStatsRxBytes _value;

  @override
  InterfacesInterfacesInnerStatsRxBytes value(num? value) => this(value: value);

  @override
  InterfacesInterfacesInnerStatsRxBytes unit(String? unit) => this(unit: unit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InterfacesInterfacesInnerStatsRxBytes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InterfacesInterfacesInnerStatsRxBytes(...).copyWith(id: 12, name: "My name")
  /// ````
  InterfacesInterfacesInnerStatsRxBytes call({
    Object? value = const $CopyWithPlaceholder(),
    Object? unit = const $CopyWithPlaceholder(),
  }) {
    return InterfacesInterfacesInnerStatsRxBytes(
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

extension $InterfacesInterfacesInnerStatsRxBytesCopyWith
    on InterfacesInterfacesInnerStatsRxBytes {
  /// Returns a callable class that can be used as follows: `instanceOfInterfacesInterfacesInnerStatsRxBytes.copyWith(...)` or like so:`instanceOfInterfacesInterfacesInnerStatsRxBytes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InterfacesInterfacesInnerStatsRxBytesCWProxy get copyWith =>
      _$InterfacesInterfacesInnerStatsRxBytesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterfacesInterfacesInnerStatsRxBytes
_$InterfacesInterfacesInnerStatsRxBytesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InterfacesInterfacesInnerStatsRxBytes', json, (
      $checkedConvert,
    ) {
      final val = InterfacesInterfacesInnerStatsRxBytes(
        value: $checkedConvert('value', (v) => v as num?),
        unit: $checkedConvert('unit', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$InterfacesInterfacesInnerStatsRxBytesToJson(
  InterfacesInterfacesInnerStatsRxBytes instance,
) => <String, dynamic>{'value': ?instance.value, 'unit': ?instance.unit};
