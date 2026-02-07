//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/devices_devices_inner_ips_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'devices_devices_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DevicesDevicesInner {
  /// Returns a new [DevicesDevicesInner] instance.
  DevicesDevicesInner({

     this.id,

     this.hwaddr,

     this.interface_,

     this.firstSeen,

     this.lastQuery,

     this.numQueries,

     this.macVendor,

     this.ips,
  });

      /// Device network table ID
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// MAC address of this device
  @JsonKey(
    
    name: r'hwaddr',
    required: false,
    includeIfNull: false,
  )


  final String? hwaddr;



      /// Interface this device is connected to
  @JsonKey(
    
    name: r'interface',
    required: false,
    includeIfNull: false,
  )


  final String? interface_;



      /// Unix timestamp when this device was first seen by your Pi-hole
  @JsonKey(
    
    name: r'firstSeen',
    required: false,
    includeIfNull: false,
  )


  final int? firstSeen;



      /// Unix timestamp when your Pi-hole received the last query from this device
  @JsonKey(
    
    name: r'lastQuery',
    required: false,
    includeIfNull: false,
  )


  final int? lastQuery;



      /// Total number of queries your Pi-hole has received from this device
  @JsonKey(
    
    name: r'numQueries',
    required: false,
    includeIfNull: false,
  )


  final int? numQueries;



      /// Vendor name associated with the device's MAC address (if available)
  @JsonKey(
    
    name: r'macVendor',
    required: false,
    includeIfNull: false,
  )


  final String? macVendor;



  @JsonKey(
    
    name: r'ips',
    required: false,
    includeIfNull: false,
  )


  final List<DevicesDevicesInnerIpsInner>? ips;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DevicesDevicesInner &&
      other.id == id &&
      other.hwaddr == hwaddr &&
      other.interface_ == interface_ &&
      other.firstSeen == firstSeen &&
      other.lastQuery == lastQuery &&
      other.numQueries == numQueries &&
      other.macVendor == macVendor &&
      other.ips == ips;

    @override
    int get hashCode =>
        id.hashCode +
        hwaddr.hashCode +
        interface_.hashCode +
        firstSeen.hashCode +
        lastQuery.hashCode +
        numQueries.hashCode +
        (macVendor == null ? 0 : macVendor.hashCode) +
        ips.hashCode;

  factory DevicesDevicesInner.fromJson(Map<String, dynamic> json) => _$DevicesDevicesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DevicesDevicesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

