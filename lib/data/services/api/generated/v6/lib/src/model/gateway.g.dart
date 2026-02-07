// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GatewayCWProxy {
  Gateway gateway(List<GatewayGatewayInner>? gateway);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Gateway(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Gateway(...).copyWith(id: 12, name: "My name")
  /// ````
  Gateway call({List<GatewayGatewayInner>? gateway});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGateway.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGateway.copyWith.fieldName(...)`
class _$GatewayCWProxyImpl implements _$GatewayCWProxy {
  const _$GatewayCWProxyImpl(this._value);

  final Gateway _value;

  @override
  Gateway gateway(List<GatewayGatewayInner>? gateway) => this(gateway: gateway);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Gateway(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Gateway(...).copyWith(id: 12, name: "My name")
  /// ````
  Gateway call({Object? gateway = const $CopyWithPlaceholder()}) {
    return Gateway(
      gateway: gateway == const $CopyWithPlaceholder()
          ? _value.gateway
          // ignore: cast_nullable_to_non_nullable
          : gateway as List<GatewayGatewayInner>?,
    );
  }
}

extension $GatewayCopyWith on Gateway {
  /// Returns a callable class that can be used as follows: `instanceOfGateway.copyWith(...)` or like so:`instanceOfGateway.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GatewayCWProxy get copyWith => _$GatewayCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gateway _$GatewayFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Gateway', json, ($checkedConvert) {
      final val = Gateway(
        gateway: $checkedConvert(
          'gateway',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => GatewayGatewayInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$GatewayToJson(Gateway instance) => <String, dynamic>{
  'gateway': ?instance.gateway?.map((e) => e.toJson()).toList(),
};
