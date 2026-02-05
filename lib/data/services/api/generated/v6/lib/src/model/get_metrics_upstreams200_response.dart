//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/upstreams_upstreams_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metrics_upstreams200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMetricsUpstreams200Response {
  /// Returns a new [GetMetricsUpstreams200Response] instance.
  GetMetricsUpstreams200Response({

     this.upstreams,

     this.forwardedQueries,

     this.totalQueries,

     this.took,
  });

      /// Array of upstream destinations
  @JsonKey(
    
    name: r'upstreams',
    required: false,
    includeIfNull: false,
  )


  final List<UpstreamsUpstreamsInner>? upstreams;



      /// Number of forwarded queries
  @JsonKey(
    
    name: r'forwarded_queries',
    required: false,
    includeIfNull: false,
  )


  final int? forwardedQueries;



      /// Total number of queries
  @JsonKey(
    
    name: r'total_queries',
    required: false,
    includeIfNull: false,
  )


  final int? totalQueries;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMetricsUpstreams200Response &&
      other.upstreams == upstreams &&
      other.forwardedQueries == forwardedQueries &&
      other.totalQueries == totalQueries &&
      other.took == took;

    @override
    int get hashCode =>
        upstreams.hashCode +
        forwardedQueries.hashCode +
        totalQueries.hashCode +
        took.hashCode;

  factory GetMetricsUpstreams200Response.fromJson(Map<String, dynamic> json) => _$GetMetricsUpstreams200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMetricsUpstreams200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

