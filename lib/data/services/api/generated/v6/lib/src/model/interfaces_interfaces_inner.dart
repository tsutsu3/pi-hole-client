//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner_addresses_inner.dart';
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner_stats.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interfaces_interfaces_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InterfacesInterfacesInner {
  /// Returns a new [InterfacesInterfacesInner] instance.
  InterfacesInterfacesInner({

     this.name,

     this.speed,

     this.carrier,

     this.type,

     this.flags,

     this.state,

     this.protoDown,

     this.address,

     this.broadcast,

     this.permAddress,

     this.stats,

     this.addresses,
  });

      /// Interface name
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Speed of the interface in Mbit/s (`null` if not applicable)
  @JsonKey(
    
    name: r'speed',
    required: false,
    includeIfNull: false,
  )


  final int? speed;



      /// Whether the interface is connected
  @JsonKey(
    
    name: r'carrier',
    required: false,
    includeIfNull: false,
  )


  final bool? carrier;



      /// Type of the interface
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Array of address flags
  @JsonKey(
    
    name: r'flags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? flags;



      /// State of the interface
  @JsonKey(
    
    name: r'state',
    required: false,
    includeIfNull: false,
  )


  final String? state;



      /// Whether the interface is administratively down
  @JsonKey(
    
    name: r'proto_down',
    required: false,
    includeIfNull: false,
  )


  final bool? protoDown;



      /// Interface hardware address
  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;



      /// Interface broadcast address
  @JsonKey(
    
    name: r'broadcast',
    required: false,
    includeIfNull: false,
  )


  final String? broadcast;



      /// Interface permanent hardware address
  @JsonKey(
    
    name: r'perm_address',
    required: false,
    includeIfNull: false,
  )


  final String? permAddress;



  @JsonKey(
    
    name: r'stats',
    required: false,
    includeIfNull: false,
  )


  final InterfacesInterfacesInnerStats? stats;



      /// Array of associated IPv addresses
  @JsonKey(
    
    name: r'addresses',
    required: false,
    includeIfNull: false,
  )


  final List<InterfacesInterfacesInnerAddressesInner>? addresses;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InterfacesInterfacesInner &&
      other.name == name &&
      other.speed == speed &&
      other.carrier == carrier &&
      other.type == type &&
      other.flags == flags &&
      other.state == state &&
      other.protoDown == protoDown &&
      other.address == address &&
      other.broadcast == broadcast &&
      other.permAddress == permAddress &&
      other.stats == stats &&
      other.addresses == addresses;

    @override
    int get hashCode =>
        name.hashCode +
        (speed == null ? 0 : speed.hashCode) +
        carrier.hashCode +
        type.hashCode +
        flags.hashCode +
        state.hashCode +
        protoDown.hashCode +
        address.hashCode +
        broadcast.hashCode +
        permAddress.hashCode +
        stats.hashCode +
        (addresses == null ? 0 : addresses.hashCode);

  factory InterfacesInterfacesInner.fromJson(Map<String, dynamic> json) => _$InterfacesInterfacesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$InterfacesInterfacesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

