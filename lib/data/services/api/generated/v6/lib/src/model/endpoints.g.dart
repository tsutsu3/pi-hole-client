// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoints.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EndpointsCWProxy {
  Endpoints endpoints(EndpointsEndpoints? endpoints);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Endpoints(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Endpoints(...).copyWith(id: 12, name: "My name")
  /// ````
  Endpoints call({EndpointsEndpoints? endpoints});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEndpoints.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEndpoints.copyWith.fieldName(...)`
class _$EndpointsCWProxyImpl implements _$EndpointsCWProxy {
  const _$EndpointsCWProxyImpl(this._value);

  final Endpoints _value;

  @override
  Endpoints endpoints(EndpointsEndpoints? endpoints) =>
      this(endpoints: endpoints);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Endpoints(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Endpoints(...).copyWith(id: 12, name: "My name")
  /// ````
  Endpoints call({Object? endpoints = const $CopyWithPlaceholder()}) {
    return Endpoints(
      endpoints: endpoints == const $CopyWithPlaceholder()
          ? _value.endpoints
          // ignore: cast_nullable_to_non_nullable
          : endpoints as EndpointsEndpoints?,
    );
  }
}

extension $EndpointsCopyWith on Endpoints {
  /// Returns a callable class that can be used as follows: `instanceOfEndpoints.copyWith(...)` or like so:`instanceOfEndpoints.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EndpointsCWProxy get copyWith => _$EndpointsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Endpoints _$EndpointsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Endpoints', json, ($checkedConvert) {
      final val = Endpoints(
        endpoints: $checkedConvert(
          'endpoints',
          (v) => v == null
              ? null
              : EndpointsEndpoints.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$EndpointsToJson(Endpoints instance) => <String, dynamic>{
  'endpoints': ?instance.endpoints?.toJson(),
};
