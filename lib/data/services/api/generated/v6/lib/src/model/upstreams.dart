//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/upstreams_upstreams_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upstreams.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Upstreams {
  /// Returns a new [Upstreams] instance.
  Upstreams({

     this.upstreams,

     this.forwardedQueries,

     this.totalQueries,
  });

      /// Array of upstream destinations
  @JsonKey(
    
    name: r'upstreams',
    required: false,
    includeIfNull: false,
  )


  final List<UpstreamsUpstreamsInner>? upstreams;



      /// Number of forwarded queries
  @JsonKey(
    
    name: r'forwarded_queries',
    required: false,
    includeIfNull: false,
  )


  final int? forwardedQueries;



      /// Total number of queries
  @JsonKey(
    
    name: r'total_queries',
    required: false,
    includeIfNull: false,
  )


  final int? totalQueries;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Upstreams &&
      other.upstreams == upstreams &&
      other.forwardedQueries == forwardedQueries &&
      other.totalQueries == totalQueries;

    @override
    int get hashCode =>
        upstreams.hashCode +
        forwardedQueries.hashCode +
        totalQueries.hashCode;

  factory Upstreams.fromJson(Map<String, dynamic> json) => _$UpstreamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpstreamsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

