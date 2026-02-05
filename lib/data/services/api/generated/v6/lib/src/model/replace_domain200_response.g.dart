// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_domain200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReplaceDomain200ResponseCWProxy {
  ReplaceDomain200Response domains(List<GetDomainsInner>? domains);

  ReplaceDomain200Response processed(ListsProcessedProcessed? processed);

  ReplaceDomain200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceDomain200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceDomain200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceDomain200Response call({
    List<GetDomainsInner>? domains,
    ListsProcessedProcessed? processed,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReplaceDomain200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReplaceDomain200Response.copyWith.fieldName(...)`
class _$ReplaceDomain200ResponseCWProxyImpl
    implements _$ReplaceDomain200ResponseCWProxy {
  const _$ReplaceDomain200ResponseCWProxyImpl(this._value);

  final ReplaceDomain200Response _value;

  @override
  ReplaceDomain200Response domains(List<GetDomainsInner>? domains) =>
      this(domains: domains);

  @override
  ReplaceDomain200Response processed(ListsProcessedProcessed? processed) =>
      this(processed: processed);

  @override
  ReplaceDomain200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceDomain200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceDomain200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceDomain200Response call({
    Object? domains = const $CopyWithPlaceholder(),
    Object? processed = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ReplaceDomain200Response(
      domains: domains == const $CopyWithPlaceholder()
          ? _value.domains
          // ignore: cast_nullable_to_non_nullable
          : domains as List<GetDomainsInner>?,
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as ListsProcessedProcessed?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ReplaceDomain200ResponseCopyWith on ReplaceDomain200Response {
  /// Returns a callable class that can be used as follows: `instanceOfReplaceDomain200Response.copyWith(...)` or like so:`instanceOfReplaceDomain200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReplaceDomain200ResponseCWProxy get copyWith =>
      _$ReplaceDomain200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceDomain200Response _$ReplaceDomain200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReplaceDomain200Response', json, ($checkedConvert) {
  final val = ReplaceDomain200Response(
    domains: $checkedConvert(
      'domains',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GetDomainsInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    processed: $checkedConvert(
      'processed',
      (v) => v == null
          ? null
          : ListsProcessedProcessed.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ReplaceDomain200ResponseToJson(
  ReplaceDomain200Response instance,
) => <String, dynamic>{
  'domains': ?instance.domains?.map((e) => e.toJson()).toList(),
  'processed': ?instance.processed?.toJson(),
  'took': ?instance.took,
};
