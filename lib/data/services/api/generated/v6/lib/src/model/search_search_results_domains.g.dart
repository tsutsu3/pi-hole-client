// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_search_results_domains.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchSearchResultsDomainsCWProxy {
  SearchSearchResultsDomains exact(int? exact);

  SearchSearchResultsDomains regex(int? regex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchResultsDomains(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchResultsDomains(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchResultsDomains call({int? exact, int? regex});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchSearchResultsDomains.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchSearchResultsDomains.copyWith.fieldName(...)`
class _$SearchSearchResultsDomainsCWProxyImpl
    implements _$SearchSearchResultsDomainsCWProxy {
  const _$SearchSearchResultsDomainsCWProxyImpl(this._value);

  final SearchSearchResultsDomains _value;

  @override
  SearchSearchResultsDomains exact(int? exact) => this(exact: exact);

  @override
  SearchSearchResultsDomains regex(int? regex) => this(regex: regex);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchResultsDomains(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchResultsDomains(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchResultsDomains call({
    Object? exact = const $CopyWithPlaceholder(),
    Object? regex = const $CopyWithPlaceholder(),
  }) {
    return SearchSearchResultsDomains(
      exact: exact == const $CopyWithPlaceholder()
          ? _value.exact
          // ignore: cast_nullable_to_non_nullable
          : exact as int?,
      regex: regex == const $CopyWithPlaceholder()
          ? _value.regex
          // ignore: cast_nullable_to_non_nullable
          : regex as int?,
    );
  }
}

extension $SearchSearchResultsDomainsCopyWith on SearchSearchResultsDomains {
  /// Returns a callable class that can be used as follows: `instanceOfSearchSearchResultsDomains.copyWith(...)` or like so:`instanceOfSearchSearchResultsDomains.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchSearchResultsDomainsCWProxy get copyWith =>
      _$SearchSearchResultsDomainsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSearchResultsDomains _$SearchSearchResultsDomainsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchSearchResultsDomains', json, ($checkedConvert) {
  final val = SearchSearchResultsDomains(
    exact: $checkedConvert('exact', (v) => (v as num?)?.toInt()),
    regex: $checkedConvert('regex', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$SearchSearchResultsDomainsToJson(
  SearchSearchResultsDomains instance,
) => <String, dynamic>{'exact': ?instance.exact, 'regex': ?instance.regex};
