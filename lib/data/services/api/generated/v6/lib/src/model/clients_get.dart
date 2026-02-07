//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/clients_get_clients_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clients_get.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientsGet {
  /// Returns a new [ClientsGet] instance.
  ClientsGet({

     this.clients,
  });

      /// Array of clients
  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final List<ClientsGetClientsInner>? clients;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientsGet &&
      other.clients == clients;

    @override
    int get hashCode =>
        clients.hashCode;

  factory ClientsGet.fromJson(Map<String, dynamic> json) => _$ClientsGetFromJson(json);

  Map<String, dynamic> toJson() => _$ClientsGetToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

