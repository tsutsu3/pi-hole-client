import 'package:pi_hole_client/data/services/api/model/v6/lists/search.dart';

class SearchInfo {
  SearchInfo({
    required this.domains,
    required this.gravity,
    required this.parameters,
    required this.results,
  });

  factory SearchInfo.fromV6(Search search) {
    final s = search.search;
    return SearchInfo(
      domains: s.domains,
      gravity: s.gravity,
      parameters: SearchParametersInfo.fromV6(s.parameters),
      results: SearchResultsInfo.fromV6(s.results),
    );
  }

  final List<DomainEntry> domains;
  final List<GravityEntry> gravity;
  final SearchParametersInfo parameters;
  final SearchResultsInfo results;

  Map<String, dynamic> toJson() {
    return {
      'domains': domains.map((e) => e.toJson()).toList(),
      'gravity': gravity.map((e) => e.toJson()).toList(),
      'parameters': parameters.toJson(),
      'results': results.toJson(),
    };
  }
}

class SearchParametersInfo {
  SearchParametersInfo({
    required this.partial,
    required this.maxResults,
    required this.domain,
    required this.debug,
  });

  factory SearchParametersInfo.fromV6(SearchParameters p) {
    return SearchParametersInfo(
      partial: p.partial,
      maxResults: p.N,
      domain: p.domain,
      debug: p.debug,
    );
  }

  final bool partial;
  final int maxResults;
  final String domain;
  final bool debug;

  Map<String, dynamic> toJson() {
    return {
      'partial': partial,
      'max_results': maxResults,
      'domain': domain,
      'debug': debug,
    };
  }
}

class SearchResultsInfo {
  SearchResultsInfo({
    required this.domainsExact,
    required this.domainsRegex,
    required this.gravityAllow,
    required this.gravityBlock,
    required this.total,
  });

  factory SearchResultsInfo.fromV6(SearchResults r) {
    return SearchResultsInfo(
      domainsExact: r.domains.exact,
      domainsRegex: r.domains.regex,
      gravityAllow: r.gravity.allow,
      gravityBlock: r.gravity.block,
      total: r.total,
    );
  }

  final int domainsExact;
  final int domainsRegex;
  final int gravityAllow;
  final int gravityBlock;
  final int total;

  Map<String, dynamic> toJson() {
    return {
      'domains_exact': domainsExact,
      'domains_regex': domainsRegex,
      'gravity_allow': gravityAllow,
      'gravity_block': gravityBlock,
      'total': total,
    };
  }
}
