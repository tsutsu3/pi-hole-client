//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/metrics_metrics_dns_cache_content_inner_count.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics_metrics_dns_cache_content_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MetricsMetricsDnsCacheContentInner {
  /// Returns a new [MetricsMetricsDnsCacheContentInner] instance.
  MetricsMetricsDnsCacheContentInner({

     this.type,

     this.name,

     this.count,
  });

      /// RR type of cache entry
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final int? type;



      /// RR name of cache entry
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final MetricsMetricsDnsCacheContentInnerCount? count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MetricsMetricsDnsCacheContentInner &&
      other.type == type &&
      other.name == name &&
      other.count == count;

    @override
    int get hashCode =>
        type.hashCode +
        name.hashCode +
        count.hashCode;

  factory MetricsMetricsDnsCacheContentInner.fromJson(Map<String, dynamic> json) => _$MetricsMetricsDnsCacheContentInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsMetricsDnsCacheContentInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

