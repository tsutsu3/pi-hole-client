import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';

part 'domain.freezed.dart';
part 'domain.g.dart';

@freezed
sealed class DomainLists with _$DomainLists {
  @JsonSerializable(explicitToJson: true)
  const factory DomainLists({
    required List<Domain> whitelist,
    required List<Domain> whitelistRegex,
    required List<Domain> blacklist,
    required List<Domain> blacklistRegex,
  }) = _DomainLists;

  factory DomainLists.fromJson(Map<String, dynamic> json) =>
      _$DomainListsFromJson(json);
}

@freezed
sealed class Domain with _$Domain {
  const factory Domain({
    required int id,
    required String name,
    required DomainType type,
    required DomainKind kind,
    required String? comment,
    required List<int> groups,
    required bool enabled,
    required DateTime dateAdded,
    required DateTime dateModified,
  }) = _Domain;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
}
