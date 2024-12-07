import 'package:pi_hole_client/models/domain.dart';

List<Domain> parseDomainList(dynamic jsonList) {
  return (jsonList as List<dynamic>)
      .map((item) => Domain.fromJson(item as Map<String, dynamic>))
      .toList();
}
