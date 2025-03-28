import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
sealed class Search with _$Search {
  const factory Search({
    required SearchData search,
    required double took,
  }) = _Search;

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);
}

@freezed
sealed class SearchData with _$SearchData {
  const factory SearchData({
    required List<DomainEntry> domains,
    required List<GravityEntry> gravity,
    required SearchParameters parameters,
    required SearchResults results,
  }) = _SearchData;

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);
}

@freezed
sealed class DomainEntry with _$DomainEntry {
  const factory DomainEntry({
    required String domain,
    required bool enabled,
    required DomainType type,
    required DomainKind kind,
    required int id,
    @JsonKey(name: 'date_added') required int dateAdded,
    @JsonKey(name: 'date_modified') required int dateModified,
    required List<int> groups,
    String? comment,
  }) = _DomainEntry;

  factory DomainEntry.fromJson(Map<String, dynamic> json) =>
      _$DomainEntryFromJson(json);
}

@freezed
sealed class GravityEntry with _$GravityEntry {
  const factory GravityEntry({
    required String domain,
    required String address,
    required bool enabled,
    required int id,
    required GravityType type,
    @JsonKey(name: 'date_added') required int dateAdded,
    @JsonKey(name: 'date_modified') required int dateModified,
    @JsonKey(name: 'date_updated') required int dateUpdated,
    required int number,
    @JsonKey(name: 'invalid_domains') required int invalidDomains,
    @JsonKey(name: 'abp_entries') required int abpEntries,
    required int status,
    required List<int> groups,
    String? comment,
  }) = _GravityEntry;

  factory GravityEntry.fromJson(Map<String, dynamic> json) =>
      _$GravityEntryFromJson(json);
}

@freezed
sealed class SearchParameters with _$SearchParameters {
  const factory SearchParameters({
    required bool partial,
    required int N,
    required String domain,
    required bool debug,
  }) = _SearchParameters;

  factory SearchParameters.fromJson(Map<String, dynamic> json) =>
      _$SearchParametersFromJson(json);
}

@freezed
sealed class SearchResults with _$SearchResults {
  const factory SearchResults({
    required DomainMatchCount domains,
    required GravityMatchCount gravity,
    required int total,
  }) = _SearchResults;

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);
}

@freezed
sealed class DomainMatchCount with _$DomainMatchCount {
  const factory DomainMatchCount({
    required int exact,
    required int regex,
  }) = _DomainMatchCount;

  factory DomainMatchCount.fromJson(Map<String, dynamic> json) =>
      _$DomainMatchCountFromJson(json);
}

@freezed
sealed class GravityMatchCount with _$GravityMatchCount {
  const factory GravityMatchCount({
    required int allow,
    required int block,
  }) = _GravityMatchCount;

  factory GravityMatchCount.fromJson(Map<String, dynamic> json) =>
      _$GravityMatchCountFromJson(json);
}

// ENUMS

enum DomainType {
  @JsonValue('allow')
  allow,
  @JsonValue('deny')
  deny,
}

enum DomainKind {
  @JsonValue('exact')
  exact,
  @JsonValue('regex')
  regex,
}

enum GravityType {
  @JsonValue('allow')
  allow,
  @JsonValue('block')
  block,
}
