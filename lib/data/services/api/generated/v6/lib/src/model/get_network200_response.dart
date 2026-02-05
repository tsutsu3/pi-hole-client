//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/devices_devices_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_network200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetNetwork200Response {
  /// Returns a new [GetNetwork200Response] instance.
  GetNetwork200Response({

     this.devices,

     this.took,
  });

      /// Array of devices
  @JsonKey(
    
    name: r'devices',
    required: false,
    includeIfNull: false,
  )


  final List<DevicesDevicesInner>? devices;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetNetwork200Response &&
      other.devices == devices &&
      other.took == took;

    @override
    int get hashCode =>
        devices.hashCode +
        took.hashCode;

  factory GetNetwork200Response.fromJson(Map<String, dynamic> json) => _$GetNetwork200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNetwork200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

