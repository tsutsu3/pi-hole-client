//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interfaces_interfaces_inner_addresses_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InterfacesInterfacesInnerAddressesInner {
  /// Returns a new [InterfacesInterfacesInnerAddressesInner] instance.
  InterfacesInterfacesInnerAddressesInner({

     this.address,

     this.addressType,

     this.broadcast,

     this.broadcastType,

     this.local,

     this.localType,

     this.label,

     this.family,

     this.flags,

     this.prefixlen,

     this.scope,

     this.prefered,

     this.valid,

     this.cstamp,

     this.tstamp,
  });

      /// Interface address
  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;



      /// Type of the interface address
  @JsonKey(
    
    name: r'address_type',
    required: false,
    includeIfNull: false,
  )


  final String? addressType;



      /// Interface broadcast address
  @JsonKey(
    
    name: r'broadcast',
    required: false,
    includeIfNull: false,
  )


  final String? broadcast;



      /// Type of the broadcast address
  @JsonKey(
    
    name: r'broadcast_type',
    required: false,
    includeIfNull: false,
  )


  final String? broadcastType;



      /// Local address
  @JsonKey(
    
    name: r'local',
    required: false,
    includeIfNull: false,
  )


  final String? local;



      /// Type of the local address
  @JsonKey(
    
    name: r'local_type',
    required: false,
    includeIfNull: false,
  )


  final String? localType;



      /// Interface label
  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



      /// Address family
  @JsonKey(
    
    name: r'family',
    required: false,
    includeIfNull: false,
  )


  final InterfacesInterfacesInnerAddressesInnerFamilyEnum? family;



      /// Array of address flags
  @JsonKey(
    
    name: r'flags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? flags;



      /// Prefix length of the interface address
  @JsonKey(
    
    name: r'prefixlen',
    required: false,
    includeIfNull: false,
  )


  final int? prefixlen;



      /// Address scope
  @JsonKey(
    
    name: r'scope',
    required: false,
    includeIfNull: false,
  )


  final String? scope;



      /// Preferred lifetime of the address (`4294967295` = forever)
  @JsonKey(
    
    name: r'prefered',
    required: false,
    includeIfNull: false,
  )


  final int? prefered;



      /// Valid lifetime of the address (`4294967295` = forever)
  @JsonKey(
    
    name: r'valid',
    required: false,
    includeIfNull: false,
  )


  final int? valid;



      /// Creation timestamp of the address
  @JsonKey(
    
    name: r'cstamp',
    required: false,
    includeIfNull: false,
  )


  final num? cstamp;



      /// Updated timestamp of the address
  @JsonKey(
    
    name: r'tstamp',
    required: false,
    includeIfNull: false,
  )


  final num? tstamp;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InterfacesInterfacesInnerAddressesInner &&
      other.address == address &&
      other.addressType == addressType &&
      other.broadcast == broadcast &&
      other.broadcastType == broadcastType &&
      other.local == local &&
      other.localType == localType &&
      other.label == label &&
      other.family == family &&
      other.flags == flags &&
      other.prefixlen == prefixlen &&
      other.scope == scope &&
      other.prefered == prefered &&
      other.valid == valid &&
      other.cstamp == cstamp &&
      other.tstamp == tstamp;

    @override
    int get hashCode =>
        address.hashCode +
        addressType.hashCode +
        broadcast.hashCode +
        broadcastType.hashCode +
        local.hashCode +
        localType.hashCode +
        label.hashCode +
        family.hashCode +
        flags.hashCode +
        prefixlen.hashCode +
        scope.hashCode +
        prefered.hashCode +
        valid.hashCode +
        cstamp.hashCode +
        tstamp.hashCode;

  factory InterfacesInterfacesInnerAddressesInner.fromJson(Map<String, dynamic> json) => _$InterfacesInterfacesInnerAddressesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$InterfacesInterfacesInnerAddressesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Address family
enum InterfacesInterfacesInnerAddressesInnerFamilyEnum {
    /// Address family
@JsonValue(r'inet')
inet(r'inet'),
    /// Address family
@JsonValue(r'inet6')
inet6(r'inet6'),
    /// Address family
@JsonValue(r'link')
link(r'link'),
    /// Address family
@JsonValue(r'mpls')
mpls(r'mpls'),
    /// Address family
@JsonValue(r'bridge')
bridge(r'bridge'),
    /// Address family
@JsonValue(r'???')
questionMarkQuestionMarkQuestionMark(r'???');

const InterfacesInterfacesInnerAddressesInnerFamilyEnum(this.value);

final String value;

@override
String toString() => value;
}


