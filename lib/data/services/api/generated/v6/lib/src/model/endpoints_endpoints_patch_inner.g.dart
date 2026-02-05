// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoints_endpoints_patch_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EndpointsEndpointsPatchInnerCWProxy {
  EndpointsEndpointsPatchInner uri(String? uri);

  EndpointsEndpointsPatchInner parameters(String? parameters);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EndpointsEndpointsPatchInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EndpointsEndpointsPatchInner(...).copyWith(id: 12, name: "My name")
  /// ````
  EndpointsEndpointsPatchInner call({String? uri, String? parameters});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEndpointsEndpointsPatchInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEndpointsEndpointsPatchInner.copyWith.fieldName(...)`
class _$EndpointsEndpointsPatchInnerCWProxyImpl
    implements _$EndpointsEndpointsPatchInnerCWProxy {
  const _$EndpointsEndpointsPatchInnerCWProxyImpl(this._value);

  final EndpointsEndpointsPatchInner _value;

  @override
  EndpointsEndpointsPatchInner uri(String? uri) => this(uri: uri);

  @override
  EndpointsEndpointsPatchInner parameters(String? parameters) =>
      this(parameters: parameters);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EndpointsEndpointsPatchInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EndpointsEndpointsPatchInner(...).copyWith(id: 12, name: "My name")
  /// ````
  EndpointsEndpointsPatchInner call({
    Object? uri = const $CopyWithPlaceholder(),
    Object? parameters = const $CopyWithPlaceholder(),
  }) {
    return EndpointsEndpointsPatchInner(
      uri: uri == const $CopyWithPlaceholder()
          ? _value.uri
          // ignore: cast_nullable_to_non_nullable
          : uri as String?,
      parameters: parameters == const $CopyWithPlaceholder()
          ? _value.parameters
          // ignore: cast_nullable_to_non_nullable
          : parameters as String?,
    );
  }
}

extension $EndpointsEndpointsPatchInnerCopyWith
    on EndpointsEndpointsPatchInner {
  /// Returns a callable class that can be used as follows: `instanceOfEndpointsEndpointsPatchInner.copyWith(...)` or like so:`instanceOfEndpointsEndpointsPatchInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EndpointsEndpointsPatchInnerCWProxy get copyWith =>
      _$EndpointsEndpointsPatchInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointsEndpointsPatchInner _$EndpointsEndpointsPatchInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('EndpointsEndpointsPatchInner', json, ($checkedConvert) {
  final val = EndpointsEndpointsPatchInner(
    uri: $checkedConvert('uri', (v) => v as String?),
    parameters: $checkedConvert('parameters', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$EndpointsEndpointsPatchInnerToJson(
  EndpointsEndpointsPatchInner instance,
) => <String, dynamic>{
  'uri': ?instance.uri,
  'parameters': ?instance.parameters,
};
