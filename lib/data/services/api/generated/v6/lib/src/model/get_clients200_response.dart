//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/clients_get_clients_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_clients200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetClients200Response {
  /// Returns a new [GetClients200Response] instance.
  GetClients200Response({

     this.clients,

     this.took,
  });

      /// Array of clients
  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final List<ClientsGetClientsInner>? clients;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetClients200Response &&
      other.clients == clients &&
      other.took == took;

    @override
    int get hashCode =>
        clients.hashCode +
        took.hashCode;

  factory GetClients200Response.fromJson(Map<String, dynamic> json) => _$GetClients200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetClients200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

