import 'package:pi_hole_client/data/model/v6/lists/search.dart' as v6_search;

class AdlistSearchResult {
  AdlistSearchResult({required this.entry, required this.matchingDomains});

  final v6_search.GravityEntry entry;
  final List<String> matchingDomains;
}
