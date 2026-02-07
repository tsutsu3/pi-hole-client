// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_host_dmi_sys.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostHostDmiSysCWProxy {
  HostHostDmiSys vendor(String? vendor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmiSys(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmiSys(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmiSys call({String? vendor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHostHostDmiSys.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHostHostDmiSys.copyWith.fieldName(...)`
class _$HostHostDmiSysCWProxyImpl implements _$HostHostDmiSysCWProxy {
  const _$HostHostDmiSysCWProxyImpl(this._value);

  final HostHostDmiSys _value;

  @override
  HostHostDmiSys vendor(String? vendor) => this(vendor: vendor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmiSys(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmiSys(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmiSys call({Object? vendor = const $CopyWithPlaceholder()}) {
    return HostHostDmiSys(
      vendor: vendor == const $CopyWithPlaceholder()
          ? _value.vendor
          // ignore: cast_nullable_to_non_nullable
          : vendor as String?,
    );
  }
}

extension $HostHostDmiSysCopyWith on HostHostDmiSys {
  /// Returns a callable class that can be used as follows: `instanceOfHostHostDmiSys.copyWith(...)` or like so:`instanceOfHostHostDmiSys.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostHostDmiSysCWProxy get copyWith => _$HostHostDmiSysCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostHostDmiSys _$HostHostDmiSysFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HostHostDmiSys', json, ($checkedConvert) {
      final val = HostHostDmiSys(
        vendor: $checkedConvert('vendor', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$HostHostDmiSysToJson(HostHostDmiSys instance) =>
    <String, dynamic>{'vendor': ?instance.vendor};
