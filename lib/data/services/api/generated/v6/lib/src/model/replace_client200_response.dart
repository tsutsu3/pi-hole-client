//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/components_schemas_lists_processed_processed.dart';
import 'package:pihole_v6_api/src/model/clients_get_clients_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'replace_client200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReplaceClient200Response {
  /// Returns a new [ReplaceClient200Response] instance.
  ReplaceClient200Response({

     this.clients,

     this.processed,

     this.took,
  });

      /// Array of clients
  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final List<ClientsGetClientsInner>? clients;



  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final ComponentsSchemasListsProcessedProcessed? processed;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReplaceClient200Response &&
      other.clients == clients &&
      other.processed == processed &&
      other.took == took;

    @override
    int get hashCode =>
        clients.hashCode +
        (processed == null ? 0 : processed.hashCode) +
        took.hashCode;

  factory ReplaceClient200Response.fromJson(Map<String, dynamic> json) => _$ReplaceClient200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReplaceClient200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

