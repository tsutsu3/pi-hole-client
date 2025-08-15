import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data/model/v5/json_converter.dart';

part 'domains.freezed.dart';
part 'domains.g.dart';

@freezed
sealed class Domains with _$Domains {
  @JsonSerializable(explicitToJson: true)
  const factory Domains({
    @MapOrEmptyListConverter() required List<Domain> data,
  }) = _Domains;

  factory Domains.fromJson(Map<String, dynamic> json) =>
      _$DomainsFromJson(json);
}

@freezed
sealed class Domain with _$Domain {
  const factory Domain({
    required int id,
    required int type,
    required String domain,
    required int enabled,
    @JsonKey(name: 'date_added') required int dateAdded,
    @JsonKey(name: 'date_modified') required int dateModified,
    required String comment,
    required List<int> groups,
  }) = _Domain;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
}

@freezed
sealed class DomainResponse with _$DomainResponse {
  const factory DomainResponse({required bool success, String? message}) =
      _DomainResponse;

  factory DomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DomainResponseFromJson(json);
}
