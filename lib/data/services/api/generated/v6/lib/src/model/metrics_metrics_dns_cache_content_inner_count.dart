//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics_metrics_dns_cache_content_inner_count.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MetricsMetricsDnsCacheContentInnerCount {
  /// Returns a new [MetricsMetricsDnsCacheContentInnerCount] instance.
  MetricsMetricsDnsCacheContentInnerCount({

     this.valid,

     this.stale,
  });

      /// Number of valid cache entries
  @JsonKey(
    
    name: r'valid',
    required: false,
    includeIfNull: false,
  )


  final int? valid;



      /// Number of stale cache entries
  @JsonKey(
    
    name: r'stale',
    required: false,
    includeIfNull: false,
  )


  final int? stale;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MetricsMetricsDnsCacheContentInnerCount &&
      other.valid == valid &&
      other.stale == stale;

    @override
    int get hashCode =>
        valid.hashCode +
        stale.hashCode;

  factory MetricsMetricsDnsCacheContentInnerCount.fromJson(Map<String, dynamic> json) => _$MetricsMetricsDnsCacheContentInnerCountFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsMetricsDnsCacheContentInnerCountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

