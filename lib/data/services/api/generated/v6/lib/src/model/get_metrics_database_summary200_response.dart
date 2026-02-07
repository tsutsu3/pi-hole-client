//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metrics_database_summary200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMetricsDatabaseSummary200Response {
  /// Returns a new [GetMetricsDatabaseSummary200Response] instance.
  GetMetricsDatabaseSummary200Response({

     this.sumQueries,

     this.sumBlocked,

     this.percentBlocked,

     this.totalClients,

     this.took,
  });

      /// Total number of queries
  @JsonKey(
    
    name: r'sum_queries',
    required: false,
    includeIfNull: false,
  )


  final int? sumQueries;



      /// Total number of blocked queries
  @JsonKey(
    
    name: r'sum_blocked',
    required: false,
    includeIfNull: false,
  )


  final int? sumBlocked;



      /// Percentage of blocked queries
  @JsonKey(
    
    name: r'percent_blocked',
    required: false,
    includeIfNull: false,
  )


  final num? percentBlocked;



      /// Total number of clients
  @JsonKey(
    
    name: r'total_clients',
    required: false,
    includeIfNull: false,
  )


  final int? totalClients;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMetricsDatabaseSummary200Response &&
      other.sumQueries == sumQueries &&
      other.sumBlocked == sumBlocked &&
      other.percentBlocked == percentBlocked &&
      other.totalClients == totalClients &&
      other.took == took;

    @override
    int get hashCode =>
        sumQueries.hashCode +
        sumBlocked.hashCode +
        percentBlocked.hashCode +
        totalClients.hashCode +
        took.hashCode;

  factory GetMetricsDatabaseSummary200Response.fromJson(Map<String, dynamic> json) => _$GetMetricsDatabaseSummary200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMetricsDatabaseSummary200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

