import 'package:pi_hole_client/domain/model/client/pihole_client.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

/// Maps [ClientsGetClientsInner] (OpenAPI-generated) to [PiholeClient]
/// (domain model).
extension ClientsGetClientsInnerMapper on ClientsGetClientsInner {
  PiholeClient toDomain() {
    return PiholeClient(
      id: id ?? 0,
      client: client ?? '',
      name: name,
      groups: groups ?? [0],
      enabled: true,
      dateAdded: DateTime.fromMillisecondsSinceEpoch((dateAdded ?? 0) * 1000),
      dateModified:
          DateTime.fromMillisecondsSinceEpoch((dateModified ?? 0) * 1000),
      comment: comment,
    );
  }
}

/// Maps [GetClients200Response] (OpenAPI-generated) to domain model list.
extension GetClients200ResponseMapper on GetClients200Response {
  List<PiholeClient> toDomainList() {
    return (clients ?? []).map((c) => c.toDomain()).toList();
  }
}
