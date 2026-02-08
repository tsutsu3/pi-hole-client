import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_domains.freezed.dart';
part 'top_domains.g.dart';

@freezed
sealed class TopDomains with _$TopDomains {
  @JsonSerializable(explicitToJson: true)
  const factory TopDomains({
    required List<QueryStat> topQueries,
    required List<QueryStat> topAds,
    // v6-only fields
    int? totalQueries,
    int? blockedQueries,
  }) = _TopDomains;

  factory TopDomains.fromJson(Map<String, dynamic> json) =>
      _$TopDomainsFromJson(json);
}

@freezed
sealed class QueryStat with _$QueryStat {
  const factory QueryStat({required String domain, required int count}) =
      _QueryStat;

  factory QueryStat.fromJson(Map<String, dynamic> json) =>
      _$QueryStatFromJson(json);
}
