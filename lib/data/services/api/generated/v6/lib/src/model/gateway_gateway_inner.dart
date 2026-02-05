//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gateway_gateway_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GatewayGatewayInner {
  /// Returns a new [GatewayGatewayInner] instance.
  GatewayGatewayInner({

     this.family,

     this.interface_,

     this.address,

     this.local,
  });

      /// Address family
  @JsonKey(
    
    name: r'family',
    required: false,
    includeIfNull: false,
  )


  final String? family;



      /// Interface name
  @JsonKey(
    
    name: r'interface',
    required: false,
    includeIfNull: false,
  )


  final String? interface_;



      /// Gateway address
  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;



      /// Local interface addresses
  @JsonKey(
    
    name: r'local',
    required: false,
    includeIfNull: false,
  )


  final List<String>? local;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GatewayGatewayInner &&
      other.family == family &&
      other.interface_ == interface_ &&
      other.address == address &&
      other.local == local;

    @override
    int get hashCode =>
        family.hashCode +
        interface_.hashCode +
        address.hashCode +
        local.hashCode;

  factory GatewayGatewayInner.fromJson(Map<String, dynamic> json) => _$GatewayGatewayInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GatewayGatewayInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

