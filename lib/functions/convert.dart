import 'package:pi_hole_client/models/domain.dart';

List<Domain> parseDomainList(List<Map<String, dynamic>> jsonList) {
  return jsonList.map((item) => Domain.fromJson(item)).toList();
}
