//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metrics_recent_blocked200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMetricsRecentBlocked200Response {
  /// Returns a new [GetMetricsRecentBlocked200Response] instance.
  GetMetricsRecentBlocked200Response({

     this.blocked,

     this.took,
  });

      /// List of blocked domains
  @JsonKey(
    
    name: r'blocked',
    required: false,
    includeIfNull: false,
  )


  final List<String>? blocked;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMetricsRecentBlocked200Response &&
      other.blocked == blocked &&
      other.took == took;

    @override
    int get hashCode =>
        blocked.hashCode +
        took.hashCode;

  factory GetMetricsRecentBlocked200Response.fromJson(Map<String, dynamic> json) => _$GetMetricsRecentBlocked200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMetricsRecentBlocked200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

