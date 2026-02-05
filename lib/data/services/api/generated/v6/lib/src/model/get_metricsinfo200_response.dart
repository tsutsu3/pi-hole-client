//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/metrics_metrics.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metricsinfo200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMetricsinfo200Response {
  /// Returns a new [GetMetricsinfo200Response] instance.
  GetMetricsinfo200Response({

     this.metrics,

     this.took,
  });

  @JsonKey(
    
    name: r'metrics',
    required: false,
    includeIfNull: false,
  )


  final MetricsMetrics? metrics;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMetricsinfo200Response &&
      other.metrics == metrics &&
      other.took == took;

    @override
    int get hashCode =>
        metrics.hashCode +
        took.hashCode;

  factory GetMetricsinfo200Response.fromJson(Map<String, dynamic> json) => _$GetMetricsinfo200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMetricsinfo200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

