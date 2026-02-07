// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_host_dmi_product.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostHostDmiProductCWProxy {
  HostHostDmiProduct name(String? name);

  HostHostDmiProduct version(String? version);

  HostHostDmiProduct family(String? family);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmiProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmiProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmiProduct call({String? name, String? version, String? family});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHostHostDmiProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHostHostDmiProduct.copyWith.fieldName(...)`
class _$HostHostDmiProductCWProxyImpl implements _$HostHostDmiProductCWProxy {
  const _$HostHostDmiProductCWProxyImpl(this._value);

  final HostHostDmiProduct _value;

  @override
  HostHostDmiProduct name(String? name) => this(name: name);

  @override
  HostHostDmiProduct version(String? version) => this(version: version);

  @override
  HostHostDmiProduct family(String? family) => this(family: family);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostDmiProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostDmiProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostDmiProduct call({
    Object? name = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? family = const $CopyWithPlaceholder(),
  }) {
    return HostHostDmiProduct(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as String?,
      family: family == const $CopyWithPlaceholder()
          ? _value.family
          // ignore: cast_nullable_to_non_nullable
          : family as String?,
    );
  }
}

extension $HostHostDmiProductCopyWith on HostHostDmiProduct {
  /// Returns a callable class that can be used as follows: `instanceOfHostHostDmiProduct.copyWith(...)` or like so:`instanceOfHostHostDmiProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostHostDmiProductCWProxy get copyWith =>
      _$HostHostDmiProductCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostHostDmiProduct _$HostHostDmiProductFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HostHostDmiProduct', json, ($checkedConvert) {
      final val = HostHostDmiProduct(
        name: $checkedConvert('name', (v) => v as String?),
        version: $checkedConvert('version', (v) => v as String?),
        family: $checkedConvert('family', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$HostHostDmiProductToJson(HostHostDmiProduct instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'version': ?instance.version,
      'family': ?instance.family,
    };
