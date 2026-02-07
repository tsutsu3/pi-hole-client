//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics_metrics_dns_replies.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MetricsMetricsDnsReplies {
  /// Returns a new [MetricsMetricsDnsReplies] instance.
  MetricsMetricsDnsReplies({

     this.forwarded,

     this.unanswered,

     this.local,

     this.optimized,

     this.auth,

     this.sum,
  });

      /// Number of forwarded queries
  @JsonKey(
    
    name: r'forwarded',
    required: false,
    includeIfNull: false,
  )


  final int? forwarded;



      /// Number of unanswered queries
  @JsonKey(
    
    name: r'unanswered',
    required: false,
    includeIfNull: false,
  )


  final int? unanswered;



      /// Number of queries answered from local cache
  @JsonKey(
    
    name: r'local',
    required: false,
    includeIfNull: false,
  )


  final int? local;



      /// Number of queries answered from local cache (stale entries)
  @JsonKey(
    
    name: r'optimized',
    required: false,
    includeIfNull: false,
  )


  final int? optimized;



      /// Number of queries for authoritative zones
  @JsonKey(
    
    name: r'auth',
    required: false,
    includeIfNull: false,
  )


  final int? auth;



      /// Total number of queries
  @JsonKey(
    
    name: r'sum',
    required: false,
    includeIfNull: false,
  )


  final int? sum;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MetricsMetricsDnsReplies &&
      other.forwarded == forwarded &&
      other.unanswered == unanswered &&
      other.local == local &&
      other.optimized == optimized &&
      other.auth == auth &&
      other.sum == sum;

    @override
    int get hashCode =>
        forwarded.hashCode +
        unanswered.hashCode +
        local.hashCode +
        optimized.hashCode +
        auth.hashCode +
        sum.hashCode;

  factory MetricsMetricsDnsReplies.fromJson(Map<String, dynamic> json) => _$MetricsMetricsDnsRepliesFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsMetricsDnsRepliesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

