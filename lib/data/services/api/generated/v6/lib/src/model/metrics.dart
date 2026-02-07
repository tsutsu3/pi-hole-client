//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/metrics_metrics.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Metrics {
  /// Returns a new [Metrics] instance.
  Metrics({

     this.metrics,
  });

  @JsonKey(
    
    name: r'metrics',
    required: false,
    includeIfNull: false,
  )


  final MetricsMetrics? metrics;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Metrics &&
      other.metrics == metrics;

    @override
    int get hashCode =>
        metrics.hashCode;

  factory Metrics.fromJson(Map<String, dynamic> json) => _$MetricsFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

