import 'package:freezed_annotation/freezed_annotation.dart';

part 'clients.freezed.dart';
part 'clients.g.dart';

@freezed
sealed class Clients with _$Clients {
  @JsonSerializable(explicitToJson: true)
  const factory Clients({
    required List<Client> clients,
    required double took,
    Processed? processed,
  }) = _Clients;

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);
}

@freezed
sealed class Client with _$Client {
  const factory Client({
    required String client,
    required int id,
    required List<int> groups,
    @JsonKey(name: 'date_added') required int dateAdded,
    @JsonKey(name: 'date_modified') required int dateModified,
    String? name,
    String? comment,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
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
  const factory ProcessedSuccess({required String item}) = _ProcessedSuccess;

  factory ProcessedSuccess.fromJson(Map<String, dynamic> json) =>
      _$ProcessedSuccessFromJson(json);
}

@freezed
sealed class ProcessedError with _$ProcessedError {
  const factory ProcessedError({required String item, required String error}) =
      _ProcessedError;

  factory ProcessedError.fromJson(Map<String, dynamic> json) =>
      _$ProcessedErrorFromJson(json);
}
