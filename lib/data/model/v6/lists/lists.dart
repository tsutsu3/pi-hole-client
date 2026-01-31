import 'package:freezed_annotation/freezed_annotation.dart';

part 'lists.freezed.dart';
part 'lists.g.dart';

@freezed
sealed class Lists with _$Lists {
  @JsonSerializable(explicitToJson: true)
  const factory Lists({
    required List<ListItem> lists,
    required double took,
    Processed? processed,
  }) = _Lists;

  factory Lists.fromJson(Map<String, dynamic> json) => _$ListsFromJson(json);
}

@freezed
sealed class ListItem with _$ListItem {
  const factory ListItem({
    required String address,
    required String type,
    required List<int> groups,
    required bool enabled,
    required int id,
    @JsonKey(name: 'date_added') required int dateAdded,
    @JsonKey(name: 'date_modified') required int dateModified,
    @JsonKey(name: 'date_updated') required int dateUpdated,
    required int number,
    @JsonKey(name: 'invalid_domains') required int invalidDomains,
    @JsonKey(name: 'abp_entries') required int abpEntries,
    required int status,
    String? comment,
  }) = _ListItem;

  factory ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);
}

@freezed
sealed class Processed with _$Processed {
  @JsonSerializable(explicitToJson: true)
  const factory Processed({
    required List<SuccessItem> success,
    required List<ErrorItem> errors,
  }) = _Processed;

  factory Processed.fromJson(Map<String, dynamic> json) =>
      _$ProcessedFromJson(json);
}

@freezed
sealed class SuccessItem with _$SuccessItem {
  const factory SuccessItem({required String item}) = _SuccessItem;

  factory SuccessItem.fromJson(Map<String, dynamic> json) =>
      _$SuccessItemFromJson(json);
}

@freezed
sealed class ErrorItem with _$ErrorItem {
  const factory ErrorItem({required String item, required String error}) =
      _ErrorItem;

  factory ErrorItem.fromJson(Map<String, dynamic> json) =>
      _$ErrorItemFromJson(json);
}
