// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_search_results.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchSearchResultsCWProxy {
  SearchSearchResults domains(SearchSearchResultsDomains? domains);

  SearchSearchResults gravity(SearchSearchResultsGravity? gravity);

  SearchSearchResults total(int? total);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchResults(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchResults(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchResults call({
    SearchSearchResultsDomains? domains,
    SearchSearchResultsGravity? gravity,
    int? total,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchSearchResults.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchSearchResults.copyWith.fieldName(...)`
class _$SearchSearchResultsCWProxyImpl implements _$SearchSearchResultsCWProxy {
  const _$SearchSearchResultsCWProxyImpl(this._value);

  final SearchSearchResults _value;

  @override
  SearchSearchResults domains(SearchSearchResultsDomains? domains) =>
      this(domains: domains);

  @override
  SearchSearchResults gravity(SearchSearchResultsGravity? gravity) =>
      this(gravity: gravity);

  @override
  SearchSearchResults total(int? total) => this(total: total);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchResults(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchResults(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchResults call({
    Object? domains = const $CopyWithPlaceholder(),
    Object? gravity = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
  }) {
    return SearchSearchResults(
      domains: domains == const $CopyWithPlaceholder()
          ? _value.domains
          // ignore: cast_nullable_to_non_nullable
          : domains as SearchSearchResultsDomains?,
      gravity: gravity == const $CopyWithPlaceholder()
          ? _value.gravity
          // ignore: cast_nullable_to_non_nullable
          : gravity as SearchSearchResultsGravity?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
    );
  }
}

extension $SearchSearchResultsCopyWith on SearchSearchResults {
  /// Returns a callable class that can be used as follows: `instanceOfSearchSearchResults.copyWith(...)` or like so:`instanceOfSearchSearchResults.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchSearchResultsCWProxy get copyWith =>
      _$SearchSearchResultsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSearchResults _$SearchSearchResultsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SearchSearchResults', json, ($checkedConvert) {
      final val = SearchSearchResults(
        domains: $checkedConvert(
          'domains',
          (v) => v == null
              ? null
              : SearchSearchResultsDomains.fromJson(v as Map<String, dynamic>),
        ),
        gravity: $checkedConvert(
          'gravity',
          (v) => v == null
              ? null
              : SearchSearchResultsGravity.fromJson(v as Map<String, dynamic>),
        ),
        total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$SearchSearchResultsToJson(
  SearchSearchResults instance,
) => <String, dynamic>{
  'domains': ?instance.domains?.toJson(),
  'gravity': ?instance.gravity?.toJson(),
  'total': ?instance.total,
};
