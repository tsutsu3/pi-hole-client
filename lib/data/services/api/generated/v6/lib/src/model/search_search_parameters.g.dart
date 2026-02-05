// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_search_parameters.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchSearchParametersCWProxy {
  SearchSearchParameters partial(bool? partial);

  SearchSearchParameters N(int? N);

  SearchSearchParameters domain(String? domain);

  SearchSearchParameters debug(bool? debug);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchParameters(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchParameters(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchParameters call({
    bool? partial,
    int? N,
    String? domain,
    bool? debug,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchSearchParameters.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchSearchParameters.copyWith.fieldName(...)`
class _$SearchSearchParametersCWProxyImpl
    implements _$SearchSearchParametersCWProxy {
  const _$SearchSearchParametersCWProxyImpl(this._value);

  final SearchSearchParameters _value;

  @override
  SearchSearchParameters partial(bool? partial) => this(partial: partial);

  @override
  SearchSearchParameters N(int? N) => this(N: N);

  @override
  SearchSearchParameters domain(String? domain) => this(domain: domain);

  @override
  SearchSearchParameters debug(bool? debug) => this(debug: debug);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchParameters(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchParameters(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchParameters call({
    Object? partial = const $CopyWithPlaceholder(),
    Object? N = const $CopyWithPlaceholder(),
    Object? domain = const $CopyWithPlaceholder(),
    Object? debug = const $CopyWithPlaceholder(),
  }) {
    return SearchSearchParameters(
      partial: partial == const $CopyWithPlaceholder()
          ? _value.partial
          // ignore: cast_nullable_to_non_nullable
          : partial as bool?,
      N: N == const $CopyWithPlaceholder()
          ? _value.N
          // ignore: cast_nullable_to_non_nullable
          : N as int?,
      domain: domain == const $CopyWithPlaceholder()
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String?,
      debug: debug == const $CopyWithPlaceholder()
          ? _value.debug
          // ignore: cast_nullable_to_non_nullable
          : debug as bool?,
    );
  }
}

extension $SearchSearchParametersCopyWith on SearchSearchParameters {
  /// Returns a callable class that can be used as follows: `instanceOfSearchSearchParameters.copyWith(...)` or like so:`instanceOfSearchSearchParameters.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchSearchParametersCWProxy get copyWith =>
      _$SearchSearchParametersCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSearchParameters _$SearchSearchParametersFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchSearchParameters', json, ($checkedConvert) {
  final val = SearchSearchParameters(
    partial: $checkedConvert('partial', (v) => v as bool?),
    N: $checkedConvert('N', (v) => (v as num?)?.toInt()),
    domain: $checkedConvert('domain', (v) => v as String?),
    debug: $checkedConvert('debug', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$SearchSearchParametersToJson(
  SearchSearchParameters instance,
) => <String, dynamic>{
  'partial': ?instance.partial,
  'N': ?instance.N,
  'domain': ?instance.domain,
  'debug': ?instance.debug,
};
