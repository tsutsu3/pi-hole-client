// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_search.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchSearchCWProxy {
  SearchSearch domains(List<SearchSearchDomainsInner>? domains);

  SearchSearch gravity(List<SearchSearchGravityInner>? gravity);

  SearchSearch parameters(SearchSearchParameters? parameters);

  SearchSearch results(SearchSearchResults? results);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearch(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearch(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearch call({
    List<SearchSearchDomainsInner>? domains,
    List<SearchSearchGravityInner>? gravity,
    SearchSearchParameters? parameters,
    SearchSearchResults? results,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchSearch.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchSearch.copyWith.fieldName(...)`
class _$SearchSearchCWProxyImpl implements _$SearchSearchCWProxy {
  const _$SearchSearchCWProxyImpl(this._value);

  final SearchSearch _value;

  @override
  SearchSearch domains(List<SearchSearchDomainsInner>? domains) =>
      this(domains: domains);

  @override
  SearchSearch gravity(List<SearchSearchGravityInner>? gravity) =>
      this(gravity: gravity);

  @override
  SearchSearch parameters(SearchSearchParameters? parameters) =>
      this(parameters: parameters);

  @override
  SearchSearch results(SearchSearchResults? results) => this(results: results);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearch(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearch(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearch call({
    Object? domains = const $CopyWithPlaceholder(),
    Object? gravity = const $CopyWithPlaceholder(),
    Object? parameters = const $CopyWithPlaceholder(),
    Object? results = const $CopyWithPlaceholder(),
  }) {
    return SearchSearch(
      domains: domains == const $CopyWithPlaceholder()
          ? _value.domains
          // ignore: cast_nullable_to_non_nullable
          : domains as List<SearchSearchDomainsInner>?,
      gravity: gravity == const $CopyWithPlaceholder()
          ? _value.gravity
          // ignore: cast_nullable_to_non_nullable
          : gravity as List<SearchSearchGravityInner>?,
      parameters: parameters == const $CopyWithPlaceholder()
          ? _value.parameters
          // ignore: cast_nullable_to_non_nullable
          : parameters as SearchSearchParameters?,
      results: results == const $CopyWithPlaceholder()
          ? _value.results
          // ignore: cast_nullable_to_non_nullable
          : results as SearchSearchResults?,
    );
  }
}

extension $SearchSearchCopyWith on SearchSearch {
  /// Returns a callable class that can be used as follows: `instanceOfSearchSearch.copyWith(...)` or like so:`instanceOfSearchSearch.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchSearchCWProxy get copyWith => _$SearchSearchCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSearch _$SearchSearchFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchSearch', json, ($checkedConvert) {
  final val = SearchSearch(
    domains: $checkedConvert(
      'domains',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SearchSearchDomainsInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    gravity: $checkedConvert(
      'gravity',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SearchSearchGravityInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    parameters: $checkedConvert(
      'parameters',
      (v) => v == null
          ? null
          : SearchSearchParameters.fromJson(v as Map<String, dynamic>),
    ),
    results: $checkedConvert(
      'results',
      (v) => v == null
          ? null
          : SearchSearchResults.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SearchSearchToJson(SearchSearch instance) =>
    <String, dynamic>{
      'domains': ?instance.domains?.map((e) => e.toJson()).toList(),
      'gravity': ?instance.gravity?.map((e) => e.toJson()).toList(),
      'parameters': ?instance.parameters?.toJson(),
      'results': ?instance.results?.toJson(),
    };
