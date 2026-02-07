//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/metrics_metrics_dns_cache_content_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics_metrics_dns_cache.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MetricsMetricsDnsCache {
  /// Returns a new [MetricsMetricsDnsCache] instance.
  MetricsMetricsDnsCache({

     this.size,

     this.inserted,

     this.evicted,

     this.expired,

     this.immortal,

     this.content,
  });

      /// Cache size
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Number of inserted entries
  @JsonKey(
    
    name: r'inserted',
    required: false,
    includeIfNull: false,
  )


  final int? inserted;



      /// Number of evicted entries
  @JsonKey(
    
    name: r'evicted',
    required: false,
    includeIfNull: false,
  )


  final int? evicted;



      /// Number of expired entries
  @JsonKey(
    
    name: r'expired',
    required: false,
    includeIfNull: false,
  )


  final int? expired;



      /// Number of immortal entries
  @JsonKey(
    
    name: r'immortal',
    required: false,
    includeIfNull: false,
  )


  final int? immortal;



      /// Array of valid DNS cache entries
  @JsonKey(
    
    name: r'content',
    required: false,
    includeIfNull: false,
  )


  final List<MetricsMetricsDnsCacheContentInner>? content;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MetricsMetricsDnsCache &&
      other.size == size &&
      other.inserted == inserted &&
      other.evicted == evicted &&
      other.expired == expired &&
      other.immortal == immortal &&
      other.content == content;

    @override
    int get hashCode =>
        size.hashCode +
        inserted.hashCode +
        evicted.hashCode +
        expired.hashCode +
        immortal.hashCode +
        content.hashCode;

  factory MetricsMetricsDnsCache.fromJson(Map<String, dynamic> json) => _$MetricsMetricsDnsCacheFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsMetricsDnsCacheToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

