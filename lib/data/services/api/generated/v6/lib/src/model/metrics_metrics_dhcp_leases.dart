//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics_metrics_dhcp_leases.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MetricsMetricsDhcpLeases {
  /// Returns a new [MetricsMetricsDhcpLeases] instance.
  MetricsMetricsDhcpLeases({

     this.allocated4,

     this.pruned4,

     this.allocated6,

     this.pruned6,
  });

      /// Number of allocated IPv4 leases
  @JsonKey(
    
    name: r'allocated_4',
    required: false,
    includeIfNull: false,
  )


  final int? allocated4;



      /// Number of pruned IPv4 leases
  @JsonKey(
    
    name: r'pruned_4',
    required: false,
    includeIfNull: false,
  )


  final int? pruned4;



      /// Number of allocated IPv6 leases
  @JsonKey(
    
    name: r'allocated_6',
    required: false,
    includeIfNull: false,
  )


  final int? allocated6;



      /// Number of pruned IPv6 leases
  @JsonKey(
    
    name: r'pruned_6',
    required: false,
    includeIfNull: false,
  )


  final int? pruned6;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MetricsMetricsDhcpLeases &&
      other.allocated4 == allocated4 &&
      other.pruned4 == pruned4 &&
      other.allocated6 == allocated6 &&
      other.pruned6 == pruned6;

    @override
    int get hashCode =>
        allocated4.hashCode +
        pruned4.hashCode +
        allocated6.hashCode +
        pruned6.hashCode;

  factory MetricsMetricsDhcpLeases.fromJson(Map<String, dynamic> json) => _$MetricsMetricsDhcpLeasesFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsMetricsDhcpLeasesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

