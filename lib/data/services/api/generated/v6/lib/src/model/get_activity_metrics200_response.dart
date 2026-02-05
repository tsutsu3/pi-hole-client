//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/total_history_history_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_activity_metrics200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetActivityMetrics200Response {
  /// Returns a new [GetActivityMetrics200Response] instance.
  GetActivityMetrics200Response({

     this.history,

     this.took,
  });

      /// Data array
  @JsonKey(
    
    name: r'history',
    required: false,
    includeIfNull: false,
  )


  final List<TotalHistoryHistoryInner>? history;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetActivityMetrics200Response &&
      other.history == history &&
      other.took == took;

    @override
    int get hashCode =>
        history.hashCode +
        took.hashCode;

  factory GetActivityMetrics200Response.fromJson(Map<String, dynamic> json) => _$GetActivityMetrics200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetActivityMetrics200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

