// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoints_endpoints_get_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EndpointsEndpointsGetInnerCWProxy {
  EndpointsEndpointsGetInner uri(String? uri);

  EndpointsEndpointsGetInner parameters(String? parameters);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EndpointsEndpointsGetInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EndpointsEndpointsGetInner(...).copyWith(id: 12, name: "My name")
  /// ````
  EndpointsEndpointsGetInner call({String? uri, String? parameters});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEndpointsEndpointsGetInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEndpointsEndpointsGetInner.copyWith.fieldName(...)`
class _$EndpointsEndpointsGetInnerCWProxyImpl
    implements _$EndpointsEndpointsGetInnerCWProxy {
  const _$EndpointsEndpointsGetInnerCWProxyImpl(this._value);

  final EndpointsEndpointsGetInner _value;

  @override
  EndpointsEndpointsGetInner uri(String? uri) => this(uri: uri);

  @override
  EndpointsEndpointsGetInner parameters(String? parameters) =>
      this(parameters: parameters);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EndpointsEndpointsGetInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EndpointsEndpointsGetInner(...).copyWith(id: 12, name: "My name")
  /// ````
  EndpointsEndpointsGetInner call({
    Object? uri = const $CopyWithPlaceholder(),
    Object? parameters = const $CopyWithPlaceholder(),
  }) {
    return EndpointsEndpointsGetInner(
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

extension $EndpointsEndpointsGetInnerCopyWith on EndpointsEndpointsGetInner {
  /// Returns a callable class that can be used as follows: `instanceOfEndpointsEndpointsGetInner.copyWith(...)` or like so:`instanceOfEndpointsEndpointsGetInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EndpointsEndpointsGetInnerCWProxy get copyWith =>
      _$EndpointsEndpointsGetInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointsEndpointsGetInner _$EndpointsEndpointsGetInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('EndpointsEndpointsGetInner', json, ($checkedConvert) {
  final val = EndpointsEndpointsGetInner(
    uri: $checkedConvert('uri', (v) => v as String?),
    parameters: $checkedConvert('parameters', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$EndpointsEndpointsGetInnerToJson(
  EndpointsEndpointsGetInner instance,
) => <String, dynamic>{
  'uri': ?instance.uri,
  'parameters': ?instance.parameters,
};
