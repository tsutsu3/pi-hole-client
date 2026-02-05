//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/gateway_gateway_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_gateway200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetGateway200Response {
  /// Returns a new [GetGateway200Response] instance.
  GetGateway200Response({

     this.gateway,

     this.took,
  });

  @JsonKey(
    
    name: r'gateway',
    required: false,
    includeIfNull: false,
  )


  final List<GatewayGatewayInner>? gateway;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetGateway200Response &&
      other.gateway == gateway &&
      other.took == took;

    @override
    int get hashCode =>
        gateway.hashCode +
        took.hashCode;

  factory GetGateway200Response.fromJson(Map<String, dynamic> json) => _$GetGateway200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGateway200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

