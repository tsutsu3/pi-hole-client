import 'package:freezed_annotation/freezed_annotation.dart';

part 'groups.freezed.dart';
part 'groups.g.dart';

@freezed
sealed class Groups with _$Groups {
  @JsonSerializable(explicitToJson: true)
  const factory Groups({
    required List<Group> groups,
    required double took,
    Processed? processed,
  }) = _Groups;

  factory Groups.fromJson(Map<String, dynamic> json) => _$GroupsFromJson(json);
}

@freezed
sealed class Group with _$Group {
  const factory Group({
    required String name,
    required int id,
    required bool enabled,
    @JsonKey(name: 'date_added') required int dateAdded,
    @JsonKey(name: 'date_modified') required int dateModified,
    String? comment,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@freezed
sealed class Processed with _$Processed {
  @JsonSerializable(explicitToJson: true)
  const factory Processed({
    required List<ProcessedSuccess> success,
    required List<ProcessedError> errors,
  }) = _Processed;

  factory Processed.fromJson(Map<String, dynamic> json) =>
      _$ProcessedFromJson(json);
}

@freezed
sealed class ProcessedSuccess with _$ProcessedSuccess {
  const factory ProcessedSuccess({
    required String item,
  }) = _ProcessedSuccess;

  factory ProcessedSuccess.fromJson(Map<String, dynamic> json) =>
      _$ProcessedSuccessFromJson(json);
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
