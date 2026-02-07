//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/schemas_suggestions_clients_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_client_suggestions200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetClientSuggestions200Response {
  /// Returns a new [GetClientSuggestions200Response] instance.
  GetClientSuggestions200Response({

     this.clients,

     this.took,
  });

  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final List<SchemasSuggestionsClientsInner>? clients;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetClientSuggestions200Response &&
      other.clients == clients &&
      other.took == took;

    @override
    int get hashCode =>
        clients.hashCode +
        took.hashCode;

  factory GetClientSuggestions200Response.fromJson(Map<String, dynamic> json) => _$GetClientSuggestions200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetClientSuggestions200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

