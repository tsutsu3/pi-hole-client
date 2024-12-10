import 'package:freezed_annotation/freezed_annotation.dart';

part 'domains.freezed.dart';
part 'domains.g.dart';

@freezed
class Domains with _$Domains {
  const factory Domains({
    required List<Domain> domains,
    required double took, // Time in seconds
  }) = _Domains;

  factory Domains.fromJson(Map<String, dynamic> json) =>
      _$DomainsFromJson(json);
}

@freezed
class AddDomains with _$AddDomains {
  const factory AddDomains({
    required List<Domain> domains,
    required Processed processed,
    required double took, // Time in seconds
  }) = _AddDomains;

  factory AddDomains.fromJson(Map<String, dynamic> json) =>
      _$AddDomainsFromJson(json);
}

@freezed
class Domain with _$Domain {
  const factory Domain({
    required String domain, // Domain
    required String unicode, // Unicode domain
    required String type, // Domain type (allow | deny)
    required String kind, // Domain kind (exact | regex)
    required String? comment, // Optional user-provided comment
    required List<int> groups, // Array of group IDs
    required bool enabled, // Status of domain (default true)
    required int id, // Database ID
    @JsonKey(name: 'date_added') required int dateAdded,
    @JsonKey(name: 'date_modified') required int dateModified,
  }) = _Domain;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
}

@freezed
class Processed with _$Processed {
  const factory Processed({
    required List<ProcessedItem> success,
    required List<ProcessedError> errors,
  }) = _Processed;

  factory Processed.fromJson(Map<String, dynamic> json) =>
      _$ProcessedFromJson(json);
}

@freezed
class ProcessedItem with _$ProcessedItem {
  const factory ProcessedItem({
    required String item,
  }) = _ProcessedItem;

  factory ProcessedItem.fromJson(Map<String, dynamic> json) =>
      _$ProcessedItemFromJson(json);
}

@freezed
class ProcessedError with _$ProcessedError {
  const factory ProcessedError({
    required String item,
    required String error,
  }) = _ProcessedError;

  factory ProcessedError.fromJson(Map<String, dynamic> json) =>
      _$ProcessedErrorFromJson(json);
}
