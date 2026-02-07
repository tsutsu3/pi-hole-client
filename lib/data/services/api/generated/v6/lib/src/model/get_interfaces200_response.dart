//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_interfaces200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetInterfaces200Response {
  /// Returns a new [GetInterfaces200Response] instance.
  GetInterfaces200Response({

     this.interfaces,

     this.took,
  });

      /// Interface information
  @JsonKey(
    
    name: r'interfaces',
    required: false,
    includeIfNull: false,
  )


  final List<InterfacesInterfacesInner>? interfaces;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetInterfaces200Response &&
      other.interfaces == interfaces &&
      other.took == took;

    @override
    int get hashCode =>
        interfaces.hashCode +
        took.hashCode;

  factory GetInterfaces200Response.fromJson(Map<String, dynamic> json) => _$GetInterfaces200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetInterfaces200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

