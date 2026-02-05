// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_iface_v4_rx_bytes.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddIfaceV4RxBytesCWProxy {
  PaddIfaceV4RxBytes value(num? value);

  PaddIfaceV4RxBytes unit(String? unit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIfaceV4RxBytes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIfaceV4RxBytes(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIfaceV4RxBytes call({num? value, String? unit});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddIfaceV4RxBytes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddIfaceV4RxBytes.copyWith.fieldName(...)`
class _$PaddIfaceV4RxBytesCWProxyImpl implements _$PaddIfaceV4RxBytesCWProxy {
  const _$PaddIfaceV4RxBytesCWProxyImpl(this._value);

  final PaddIfaceV4RxBytes _value;

  @override
  PaddIfaceV4RxBytes value(num? value) => this(value: value);

  @override
  PaddIfaceV4RxBytes unit(String? unit) => this(unit: unit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddIfaceV4RxBytes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddIfaceV4RxBytes(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddIfaceV4RxBytes call({
    Object? value = const $CopyWithPlaceholder(),
    Object? unit = const $CopyWithPlaceholder(),
  }) {
    return PaddIfaceV4RxBytes(
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

extension $PaddIfaceV4RxBytesCopyWith on PaddIfaceV4RxBytes {
  /// Returns a callable class that can be used as follows: `instanceOfPaddIfaceV4RxBytes.copyWith(...)` or like so:`instanceOfPaddIfaceV4RxBytes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddIfaceV4RxBytesCWProxy get copyWith =>
      _$PaddIfaceV4RxBytesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddIfaceV4RxBytes _$PaddIfaceV4RxBytesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaddIfaceV4RxBytes', json, ($checkedConvert) {
      final val = PaddIfaceV4RxBytes(
        value: $checkedConvert('value', (v) => v as num?),
        unit: $checkedConvert('unit', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PaddIfaceV4RxBytesToJson(PaddIfaceV4RxBytes instance) =>
    <String, dynamic>{'value': ?instance.value, 'unit': ?instance.unit};
