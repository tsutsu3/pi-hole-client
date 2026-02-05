// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_host_dmi_bios.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostHostDmiBiosCWProxy {
  HostHostDmiBios vendor(String? vendor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmiBios(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmiBios(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmiBios call({String? vendor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHostHostDmiBios.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHostHostDmiBios.copyWith.fieldName(...)`
class _$HostHostDmiBiosCWProxyImpl implements _$HostHostDmiBiosCWProxy {
  const _$HostHostDmiBiosCWProxyImpl(this._value);

  final HostHostDmiBios _value;

  @override
  HostHostDmiBios vendor(String? vendor) => this(vendor: vendor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmiBios(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmiBios(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmiBios call({Object? vendor = const $CopyWithPlaceholder()}) {
    return HostHostDmiBios(
      vendor: vendor == const $CopyWithPlaceholder()
          ? _value.vendor
          // ignore: cast_nullable_to_non_nullable
          : vendor as String?,
    );
  }
}

extension $HostHostDmiBiosCopyWith on HostHostDmiBios {
  /// Returns a callable class that can be used as follows: `instanceOfHostHostDmiBios.copyWith(...)` or like so:`instanceOfHostHostDmiBios.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostHostDmiBiosCWProxy get copyWith => _$HostHostDmiBiosCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostHostDmiBios _$HostHostDmiBiosFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HostHostDmiBios', json, ($checkedConvert) {
      final val = HostHostDmiBios(
        vendor: $checkedConvert('vendor', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$HostHostDmiBiosToJson(HostHostDmiBios instance) =>
    <String, dynamic>{'vendor': ?instance.vendor};
