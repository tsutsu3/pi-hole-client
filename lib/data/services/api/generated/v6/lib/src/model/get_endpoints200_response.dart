//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/endpoints_endpoints.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_endpoints200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetEndpoints200Response {
  /// Returns a new [GetEndpoints200Response] instance.
  GetEndpoints200Response({

     this.endpoints,

     this.took,
  });

  @JsonKey(
    
    name: r'endpoints',
    required: false,
    includeIfNull: false,
  )


  final EndpointsEndpoints? endpoints;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetEndpoints200Response &&
      other.endpoints == endpoints &&
      other.took == took;

    @override
    int get hashCode =>
        endpoints.hashCode +
        took.hashCode;

  factory GetEndpoints200Response.fromJson(Map<String, dynamic> json) => _$GetEndpoints200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetEndpoints200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

