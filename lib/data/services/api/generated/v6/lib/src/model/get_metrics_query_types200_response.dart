//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/query_types_types.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_metrics_query_types200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMetricsQueryTypes200Response {
  /// Returns a new [GetMetricsQueryTypes200Response] instance.
  GetMetricsQueryTypes200Response({

     this.types,

     this.took,
  });

  @JsonKey(
    
    name: r'types',
    required: false,
    includeIfNull: false,
  )


  final QueryTypesTypes? types;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMetricsQueryTypes200Response &&
      other.types == types &&
      other.took == took;

    @override
    int get hashCode =>
        types.hashCode +
        took.hashCode;

  factory GetMetricsQueryTypes200Response.fromJson(Map<String, dynamic> json) => _$GetMetricsQueryTypes200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMetricsQueryTypes200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

