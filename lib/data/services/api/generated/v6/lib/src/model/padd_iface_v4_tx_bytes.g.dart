// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_iface_v4_tx_bytes.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddIfaceV4TxBytesCWProxy {
  PaddIfaceV4TxBytes value(num? value);

  PaddIfaceV4TxBytes unit(String? unit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIfaceV4TxBytes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIfaceV4TxBytes(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIfaceV4TxBytes call({num? value, String? unit});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddIfaceV4TxBytes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddIfaceV4TxBytes.copyWith.fieldName(...)`
class _$PaddIfaceV4TxBytesCWProxyImpl implements _$PaddIfaceV4TxBytesCWProxy {
  const _$PaddIfaceV4TxBytesCWProxyImpl(this._value);

  final PaddIfaceV4TxBytes _value;

  @override
  PaddIfaceV4TxBytes value(num? value) => this(value: value);

  @override
  PaddIfaceV4TxBytes unit(String? unit) => this(unit: unit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIfaceV4TxBytes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIfaceV4TxBytes(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIfaceV4TxBytes call({
    Object? value = const $CopyWithPlaceholder(),
    Object? unit = const $CopyWithPlaceholder(),
  }) {
    return PaddIfaceV4TxBytes(
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

extension $PaddIfaceV4TxBytesCopyWith on PaddIfaceV4TxBytes {
  /// Returns a callable class that can be used as follows: `instanceOfPaddIfaceV4TxBytes.copyWith(...)` or like so:`instanceOfPaddIfaceV4TxBytes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddIfaceV4TxBytesCWProxy get copyWith =>
      _$PaddIfaceV4TxBytesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddIfaceV4TxBytes _$PaddIfaceV4TxBytesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaddIfaceV4TxBytes', json, ($checkedConvert) {
      final val = PaddIfaceV4TxBytes(
        value: $checkedConvert('value', (v) => v as num?),
        unit: $checkedConvert('unit', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PaddIfaceV4TxBytesToJson(PaddIfaceV4TxBytes instance) =>
    <String, dynamic>{'value': ?instance.value, 'unit': ?instance.unit};
