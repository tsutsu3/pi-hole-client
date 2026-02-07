//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/gateway_gateway_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gateway.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Gateway {
  /// Returns a new [Gateway] instance.
  Gateway({

     this.gateway,
  });

  @JsonKey(
    
    name: r'gateway',
    required: false,
    includeIfNull: false,
  )


  final List<GatewayGatewayInner>? gateway;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Gateway &&
      other.gateway == gateway;

    @override
    int get hashCode =>
        gateway.hashCode;

  factory Gateway.fromJson(Map<String, dynamic> json) => _$GatewayFromJson(json);

  Map<String, dynamic> toJson() => _$GatewayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

