//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/queries_clients.dart';
import 'package:pihole_v6_api/src/model/queries_gravity.dart';
import 'package:pihole_v6_api/src/model/queries_queries.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metrics_summary200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMetricsSummary200Response {
  /// Returns a new [GetMetricsSummary200Response] instance.
  GetMetricsSummary200Response({

     this.queries,

     this.clients,

     this.gravity,

     this.took,
  });

  @JsonKey(
    
    name: r'queries',
    required: false,
    includeIfNull: false,
  )


  final QueriesQueries? queries;



  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final QueriesClients? clients;



  @JsonKey(
    
    name: r'gravity',
    required: false,
    includeIfNull: false,
  )


  final QueriesGravity? gravity;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMetricsSummary200Response &&
      other.queries == queries &&
      other.clients == clients &&
      other.gravity == gravity &&
      other.took == took;

    @override
    int get hashCode =>
        queries.hashCode +
        clients.hashCode +
        gravity.hashCode +
        took.hashCode;

  factory GetMetricsSummary200Response.fromJson(Map<String, dynamic> json) => _$GetMetricsSummary200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMetricsSummary200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

