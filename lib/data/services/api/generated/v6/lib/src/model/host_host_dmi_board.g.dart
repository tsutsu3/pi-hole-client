// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_host_dmi_board.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostHostDmiBoardCWProxy {
  HostHostDmiBoard name(String? name);

  HostHostDmiBoard vendor(String? vendor);

  HostHostDmiBoard version(String? version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmiBoard(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmiBoard(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmiBoard call({String? name, String? vendor, String? version});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHostHostDmiBoard.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHostHostDmiBoard.copyWith.fieldName(...)`
class _$HostHostDmiBoardCWProxyImpl implements _$HostHostDmiBoardCWProxy {
  const _$HostHostDmiBoardCWProxyImpl(this._value);

  final HostHostDmiBoard _value;

  @override
  HostHostDmiBoard name(String? name) => this(name: name);

  @override
  HostHostDmiBoard vendor(String? vendor) => this(vendor: vendor);

  @override
  HostHostDmiBoard version(String? version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmiBoard(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmiBoard(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmiBoard call({
    Object? name = const $CopyWithPlaceholder(),
    Object? vendor = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return HostHostDmiBoard(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      vendor: vendor == const $CopyWithPlaceholder()
          ? _value.vendor
          // ignore: cast_nullable_to_non_nullable
          : vendor as String?,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as String?,
    );
  }
}

extension $HostHostDmiBoardCopyWith on HostHostDmiBoard {
  /// Returns a callable class that can be used as follows: `instanceOfHostHostDmiBoard.copyWith(...)` or like so:`instanceOfHostHostDmiBoard.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostHostDmiBoardCWProxy get copyWith => _$HostHostDmiBoardCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostHostDmiBoard _$HostHostDmiBoardFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HostHostDmiBoard', json, ($checkedConvert) {
      final val = HostHostDmiBoard(
        name: $checkedConvert('name', (v) => v as String?),
        vendor: $checkedConvert('vendor', (v) => v as String?),
        version: $checkedConvert('version', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$HostHostDmiBoardToJson(HostHostDmiBoard instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'vendor': ?instance.vendor,
      'version': ?instance.version,
    };
