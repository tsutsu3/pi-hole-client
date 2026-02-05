//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/top_domains_domains_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metrics_top_domains200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMetricsTopDomains200Response {
  /// Returns a new [GetMetricsTopDomains200Response] instance.
  GetMetricsTopDomains200Response({

     this.domains,

     this.totalQueries,

     this.blockedQueries,

     this.took,
  });

      /// Array of domains
  @JsonKey(
    
    name: r'domains',
    required: false,
    includeIfNull: false,
  )


  final List<TopDomainsDomainsInner>? domains;



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
    bool operator ==(Object other) => identical(this, other) || other is GetMetricsTopDomains200Response &&
      other.domains == domains &&
      other.totalQueries == totalQueries &&
      other.blockedQueries == blockedQueries &&
      other.took == took;

    @override
    int get hashCode =>
        domains.hashCode +
        totalQueries.hashCode +
        blockedQueries.hashCode +
        took.hashCode;

  factory GetMetricsTopDomains200Response.fromJson(Map<String, dynamic> json) => _$GetMetricsTopDomains200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMetricsTopDomains200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

