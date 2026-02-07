//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/metrics_metrics_dhcp.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dns.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics_metrics.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MetricsMetrics {
  /// Returns a new [MetricsMetrics] instance.
  MetricsMetrics({

     this.dns,

     this.dhcp,
  });

  @JsonKey(
    
    name: r'dns',
    required: false,
    includeIfNull: false,
  )


  final MetricsMetricsDns? dns;



  @JsonKey(
    
    name: r'dhcp',
    required: false,
    includeIfNull: false,
  )


  final MetricsMetricsDhcp? dhcp;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MetricsMetrics &&
      other.dns == dns &&
      other.dhcp == dhcp;

    @override
    int get hashCode =>
        dns.hashCode +
        dhcp.hashCode;

  factory MetricsMetrics.fromJson(Map<String, dynamic> json) => _$MetricsMetricsFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsMetricsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

