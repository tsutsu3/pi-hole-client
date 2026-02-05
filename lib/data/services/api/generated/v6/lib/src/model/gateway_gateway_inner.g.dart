// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_gateway_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GatewayGatewayInnerCWProxy {
  GatewayGatewayInner family(String? family);

  GatewayGatewayInner interface_(String? interface_);

  GatewayGatewayInner address(String? address);

  GatewayGatewayInner local(List<String>? local);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GatewayGatewayInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GatewayGatewayInner(...).copyWith(id: 12, name: "My name")
  /// ````
  GatewayGatewayInner call({
    String? family,
    String? interface_,
    String? address,
    List<String>? local,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGatewayGatewayInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGatewayGatewayInner.copyWith.fieldName(...)`
class _$GatewayGatewayInnerCWProxyImpl implements _$GatewayGatewayInnerCWProxy {
  const _$GatewayGatewayInnerCWProxyImpl(this._value);

  final GatewayGatewayInner _value;

  @override
  GatewayGatewayInner family(String? family) => this(family: family);

  @override
  GatewayGatewayInner interface_(String? interface_) =>
      this(interface_: interface_);

  @override
  GatewayGatewayInner address(String? address) => this(address: address);

  @override
  GatewayGatewayInner local(List<String>? local) => this(local: local);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GatewayGatewayInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GatewayGatewayInner(...).copyWith(id: 12, name: "My name")
  /// ````
  GatewayGatewayInner call({
    Object? family = const $CopyWithPlaceholder(),
    Object? interface_ = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? local = const $CopyWithPlaceholder(),
  }) {
    return GatewayGatewayInner(
      family: family == const $CopyWithPlaceholder()
          ? _value.family
          // ignore: cast_nullable_to_non_nullable
          : family as String?,
      interface_: interface_ == const $CopyWithPlaceholder()
          ? _value.interface_
          // ignore: cast_nullable_to_non_nullable
          : interface_ as String?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      local: local == const $CopyWithPlaceholder()
          ? _value.local
          // ignore: cast_nullable_to_non_nullable
          : local as List<String>?,
    );
  }
}

extension $GatewayGatewayInnerCopyWith on GatewayGatewayInner {
  /// Returns a callable class that can be used as follows: `instanceOfGatewayGatewayInner.copyWith(...)` or like so:`instanceOfGatewayGatewayInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GatewayGatewayInnerCWProxy get copyWith =>
      _$GatewayGatewayInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GatewayGatewayInner _$GatewayGatewayInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GatewayGatewayInner', json, ($checkedConvert) {
      final val = GatewayGatewayInner(
        family: $checkedConvert('family', (v) => v as String?),
        interface_: $checkedConvert('interface', (v) => v as String?),
        address: $checkedConvert('address', (v) => v as String?),
        local: $checkedConvert(
          'local',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'interface_': 'interface'});

Map<String, dynamic> _$GatewayGatewayInnerToJson(
  GatewayGatewayInner instance,
) => <String, dynamic>{
  'family': ?instance.family,
  'interface': ?instance.interface_,
  'address': ?instance.address,
  'local': ?instance.local,
};
