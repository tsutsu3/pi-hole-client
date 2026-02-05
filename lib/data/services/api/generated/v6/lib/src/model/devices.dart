//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/devices_devices_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'devices.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Devices {
  /// Returns a new [Devices] instance.
  Devices({

     this.devices,
  });

      /// Array of devices
  @JsonKey(
    
    name: r'devices',
    required: false,
    includeIfNull: false,
  )


  final List<DevicesDevicesInner>? devices;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Devices &&
      other.devices == devices;

    @override
    int get hashCode =>
        devices.hashCode;

  factory Devices.fromJson(Map<String, dynamic> json) => _$DevicesFromJson(json);

  Map<String, dynamic> toJson() => _$DevicesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

