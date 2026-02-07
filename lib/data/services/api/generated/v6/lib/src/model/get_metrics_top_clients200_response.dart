//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/top_clients_clients_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metrics_top_clients200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMetricsTopClients200Response {
  /// Returns a new [GetMetricsTopClients200Response] instance.
  GetMetricsTopClients200Response({

     this.clients,

     this.totalQueries,

     this.blockedQueries,

     this.took,
  });

      /// Array of clients
  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final List<TopClientsClientsInner>? clients;



      /// Total number of queries
  @JsonKey(
    
    name: r'total_queries',
    required: false,
    includeIfNull: false,
  )


  final int? totalQueries;



      /// Number of blocked queries
  @JsonKey(
    
    name: r'blocked_queries',
    required: false,
    includeIfNull: false,
  )


  final int? blockedQueries;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMetricsTopClients200Response &&
      other.clients == clients &&
      other.totalQueries == totalQueries &&
      other.blockedQueries == blockedQueries &&
      other.took == took;

    @override
    int get hashCode =>
        clients.hashCode +
        totalQueries.hashCode +
        blockedQueries.hashCode +
        took.hashCode;

  factory GetMetricsTopClients200Response.fromJson(Map<String, dynamic> json) => _$GetMetricsTopClients200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMetricsTopClients200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

