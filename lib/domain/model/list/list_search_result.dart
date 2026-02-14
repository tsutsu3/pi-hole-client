import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';

part 'list_search_result.freezed.dart';

/// Search result from the Pi-hole lists/search API.
@freezed
sealed class ListSearchResult with _$ListSearchResult {
  const factory ListSearchResult({
    required List<Domain> domains,
    required List<GravityMatch> gravityMatches,
    required ListSearchMeta meta,
  }) = _ListSearchResult;
}

/// An adlist paired with the domain name that matched the search query.
@freezed
sealed class GravityMatch with _$GravityMatch {
  const factory GravityMatch({
    required Adlist adlist,
    required String matchedDomain,
  }) = _GravityMatch;
}

/// Metadata about the search results (counts for summary display).
@freezed
sealed class ListSearchMeta with _$ListSearchMeta {
  const factory ListSearchMeta({
    required int domainsExact,
    required int domainsRegex,
    required int gravityAllow,
    required int gravityBlock,
    required int total,
  }) = _ListSearchMeta;
}
