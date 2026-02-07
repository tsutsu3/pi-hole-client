//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/client_history_history_inner.dart';
import 'package:pihole_v6_api/src/model/client_history_clients_value.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_client_metrics200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetClientMetrics200Response {
  /// Returns a new [GetClientMetrics200Response] instance.
  GetClientMetrics200Response({

     this.clients,

     this.history,

     this.took,
  });

      /// Data corresponding to the individual clients
  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final Map<String, ClientHistoryClientsValue>? clients;



      /// Data array
  @JsonKey(
    
    name: r'history',
    required: false,
    includeIfNull: false,
  )


  final List<ClientHistoryHistoryInner>? history;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetClientMetrics200Response &&
      other.clients == clients &&
      other.history == history &&
      other.took == took;

    @override
    int get hashCode =>
        clients.hashCode +
        history.hashCode +
        took.hashCode;

  factory GetClientMetrics200Response.fromJson(Map<String, dynamic> json) => _$GetClientMetrics200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetClientMetrics200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

