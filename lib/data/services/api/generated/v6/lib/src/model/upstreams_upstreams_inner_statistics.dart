//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upstreams_upstreams_inner_statistics.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpstreamsUpstreamsInnerStatistics {
  /// Returns a new [UpstreamsUpstreamsInnerStatistics] instance.
  UpstreamsUpstreamsInnerStatistics({

     this.response,

     this.variance,
  });

      /// Average response time of this upstream destination in seconds (0 if not applicable)
  @JsonKey(
    
    name: r'response',
    required: false,
    includeIfNull: false,
  )


  final num? response;



      /// Standard deviation of the average response time (0 if not applicable)
  @JsonKey(
    
    name: r'variance',
    required: false,
    includeIfNull: false,
  )


  final num? variance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpstreamsUpstreamsInnerStatistics &&
      other.response == response &&
      other.variance == variance;

    @override
    int get hashCode =>
        response.hashCode +
        variance.hashCode;

  factory UpstreamsUpstreamsInnerStatistics.fromJson(Map<String, dynamic> json) => _$UpstreamsUpstreamsInnerStatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$UpstreamsUpstreamsInnerStatisticsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

