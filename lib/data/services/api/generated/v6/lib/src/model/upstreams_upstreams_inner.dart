//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/upstreams_upstreams_inner_statistics.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upstreams_upstreams_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpstreamsUpstreamsInner {
  /// Returns a new [UpstreamsUpstreamsInner] instance.
  UpstreamsUpstreamsInner({

     this.ip,

     this.name,

     this.port,

     this.count,

     this.statistics,
  });

      /// Upstream destination's IP address (can be either IPv4 or IPv6)
  @JsonKey(
    
    name: r'ip',
    required: false,
    includeIfNull: false,
  )


  final String? ip;



      /// Upstream destination's hostname (if available)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Upstream destination's destination port (-1 if not applicable, e.g., for the local cache)
  @JsonKey(
    
    name: r'port',
    required: false,
    includeIfNull: false,
  )


  final int? port;



      /// Number of queries this upstream destination has been used for
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



  @JsonKey(
    
    name: r'statistics',
    required: false,
    includeIfNull: false,
  )


  final UpstreamsUpstreamsInnerStatistics? statistics;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpstreamsUpstreamsInner &&
      other.ip == ip &&
      other.name == name &&
      other.port == port &&
      other.count == count &&
      other.statistics == statistics;

    @override
    int get hashCode =>
        (ip == null ? 0 : ip.hashCode) +
        (name == null ? 0 : name.hashCode) +
        port.hashCode +
        count.hashCode +
        statistics.hashCode;

  factory UpstreamsUpstreamsInner.fromJson(Map<String, dynamic> json) => _$UpstreamsUpstreamsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$UpstreamsUpstreamsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

