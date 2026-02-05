//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'devices_devices_inner_ips_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DevicesDevicesInnerIpsInner {
  /// Returns a new [DevicesDevicesInnerIpsInner] instance.
  DevicesDevicesInnerIpsInner({

     this.ip,

     this.name,

     this.lastSeen,

     this.nameUpdated,
  });

      /// Associated IP address (can be IPv4 or IPv6)
  @JsonKey(
    
    name: r'ip',
    required: false,
    includeIfNull: false,
  )


  final String? ip;



      /// Associated hostname (can be null)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Unix timestamp when your Pi-hole has seen this address the last time
  @JsonKey(
    
    name: r'lastSeen',
    required: false,
    includeIfNull: false,
  )


  final int? lastSeen;



      /// Unix timestamp when device updated its hostname the last time
  @JsonKey(
    
    name: r'nameUpdated',
    required: false,
    includeIfNull: false,
  )


  final int? nameUpdated;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DevicesDevicesInnerIpsInner &&
      other.ip == ip &&
      other.name == name &&
      other.lastSeen == lastSeen &&
      other.nameUpdated == nameUpdated;

    @override
    int get hashCode =>
        ip.hashCode +
        (name == null ? 0 : name.hashCode) +
        lastSeen.hashCode +
        nameUpdated.hashCode;

  factory DevicesDevicesInnerIpsInner.fromJson(Map<String, dynamic> json) => _$DevicesDevicesInnerIpsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DevicesDevicesInnerIpsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

