//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/metrics_metrics_dns_cache.dart';
import 'package:pihole_v6_api/src/model/metrics_metrics_dns_replies.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics_metrics_dns.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MetricsMetricsDns {
  /// Returns a new [MetricsMetricsDns] instance.
  MetricsMetricsDns({

     this.cache,

     this.replies,
  });

  @JsonKey(
    
    name: r'cache',
    required: false,
    includeIfNull: false,
  )


  final MetricsMetricsDnsCache? cache;



  @JsonKey(
    
    name: r'replies',
    required: false,
    includeIfNull: false,
  )


  final MetricsMetricsDnsReplies? replies;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MetricsMetricsDns &&
      other.cache == cache &&
      other.replies == replies;

    @override
    int get hashCode =>
        cache.hashCode +
        replies.hashCode;

  factory MetricsMetricsDns.fromJson(Map<String, dynamic> json) => _$MetricsMetricsDnsFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsMetricsDnsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

