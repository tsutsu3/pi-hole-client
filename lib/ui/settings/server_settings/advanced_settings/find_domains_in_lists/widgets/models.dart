import 'package:pi_hole_client/domain/model/list/adlist.dart';

class AdlistSearchGroup {
  AdlistSearchGroup({required this.adlist, required this.matchingDomains});

  final Adlist adlist;
  final List<String> matchingDomains;
}
