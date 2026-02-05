// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_domains200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetDomains200ResponseCWProxy {
  GetDomains200Response domains(List<GetDomainsInner>? domains);

  GetDomains200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDomains200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDomains200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDomains200Response call({List<GetDomainsInner>? domains, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetDomains200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetDomains200Response.copyWith.fieldName(...)`
class _$GetDomains200ResponseCWProxyImpl
    implements _$GetDomains200ResponseCWProxy {
  const _$GetDomains200ResponseCWProxyImpl(this._value);

  final GetDomains200Response _value;

  @override
  GetDomains200Response domains(List<GetDomainsInner>? domains) =>
      this(domains: domains);

  @override
  GetDomains200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDomains200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDomains200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDomains200Response call({
    Object? domains = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetDomains200Response(
      domains: domains == const $CopyWithPlaceholder()
          ? _value.domains
          // ignore: cast_nullable_to_non_nullable
          : domains as List<GetDomainsInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetDomains200ResponseCopyWith on GetDomains200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetDomains200Response.copyWith(...)` or like so:`instanceOfGetDomains200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetDomains200ResponseCWProxy get copyWith =>
      _$GetDomains200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDomains200Response _$GetDomains200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetDomains200Response', json, ($checkedConvert) {
  final val = GetDomains200Response(
    domains: $checkedConvert(
      'domains',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GetDomainsInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetDomains200ResponseToJson(
  GetDomains200Response instance,
) => <String, dynamic>{
  'domains': ?instance.domains?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
