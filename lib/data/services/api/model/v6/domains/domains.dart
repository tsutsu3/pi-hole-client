import 'package:freezed_annotation/freezed_annotation.dart';

part 'domains.freezed.dart';
part 'domains.g.dart';

@freezed
sealed class Domains with _$Domains {
  @JsonSerializable(explicitToJson: true)
  const factory Domains({
    required List<DomainData> domains,
    required Processed? processed,
    required double took, // Time in seconds
  }) = _Domains;

  factory Domains.fromJson(Map<String, dynamic> json) =>
      _$DomainsFromJson(json);
}

@freezed
sealed class DomainData with _$DomainData {
  const factory DomainData({
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
  }) = _DomainData;

  factory DomainData.fromJson(Map<String, dynamic> json) =>
      _$DomainDataFromJson(json);
}

@freezed
sealed class Processed with _$Processed {
  @JsonSerializable(explicitToJson: true)
  const factory Processed({
    required List<ProcessedItem> success,
    required List<ProcessedError> errors,
  }) = _Processed;

  factory Processed.fromJson(Map<String, dynamic> json) =>
      _$ProcessedFromJson(json);
}

@freezed
sealed class ProcessedItem with _$ProcessedItem {
  const factory ProcessedItem({
    required String item,
  }) = _ProcessedItem;

  factory ProcessedItem.fromJson(Map<String, dynamic> json) =>
      _$ProcessedItemFromJson(json);
}

@freezed
sealed class ProcessedError with _$ProcessedError {
  const factory ProcessedError({
    required String item,
    required String error,
  }) = _ProcessedError;

  factory ProcessedError.fromJson(Map<String, dynamic> json) =>
      _$ProcessedErrorFromJson(json);
}
