//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routes_routes_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RoutesRoutesInner {
  /// Returns a new [RoutesRoutesInner] instance.
  RoutesRoutesInner({

     this.gateway,

     this.family,

     this.table,

     this.protocol,

     this.scope,

     this.type,

     this.flags,

     this.oif,

     this.iif,

     this.dst,

     this.src,

     this.prefsrc,

     this.priority,

     this.pref,
  });

      /// Gateway address
  @JsonKey(
    
    name: r'gateway',
    required: false,
    includeIfNull: false,
  )


  final String? gateway;



      /// Address family
  @JsonKey(
    
    name: r'family',
    required: false,
    includeIfNull: false,
  )


  final RoutesRoutesInnerFamilyEnum? family;



      /// Routing table ID (0 = unspecified, 253 = default, 254 = local, 255 = local, other = user-defined)
  @JsonKey(
    
    name: r'table',
    required: false,
    includeIfNull: false,
  )


  final int? table;



      /// Routing protocol
  @JsonKey(
    
    name: r'protocol',
    required: false,
    includeIfNull: false,
  )


  final String? protocol;



      /// Routing scope
  @JsonKey(
    
    name: r'scope',
    required: false,
    includeIfNull: false,
  )


  final String? scope;



      /// Routing type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Array of route flags
  @JsonKey(
    
    name: r'flags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? flags;



      /// Outgoing interface
  @JsonKey(
    
    name: r'oif',
    required: false,
    includeIfNull: false,
  )


  final String? oif;



      /// Incoming interface
  @JsonKey(
    
    name: r'iif',
    required: false,
    includeIfNull: false,
  )


  final String? iif;



      /// Destination address (or \"default\" for the default route)
  @JsonKey(
    
    name: r'dst',
    required: false,
    includeIfNull: false,
  )


  final String? dst;



      /// Source address
  @JsonKey(
    
    name: r'src',
    required: false,
    includeIfNull: false,
  )


  final String? src;



      /// Preferred source address
  @JsonKey(
    
    name: r'prefsrc',
    required: false,
    includeIfNull: false,
  )


  final String? prefsrc;



      /// Route priority
  @JsonKey(
    
    name: r'priority',
    required: false,
    includeIfNull: false,
  )


  final int? priority;



      /// Route preference
  @JsonKey(
    
    name: r'pref',
    required: false,
    includeIfNull: false,
  )


  final int? pref;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RoutesRoutesInner &&
      other.gateway == gateway &&
      other.family == family &&
      other.table == table &&
      other.protocol == protocol &&
      other.scope == scope &&
      other.type == type &&
      other.flags == flags &&
      other.oif == oif &&
      other.iif == iif &&
      other.dst == dst &&
      other.src == src &&
      other.prefsrc == prefsrc &&
      other.priority == priority &&
      other.pref == pref;

    @override
    int get hashCode =>
        gateway.hashCode +
        family.hashCode +
        table.hashCode +
        protocol.hashCode +
        scope.hashCode +
        type.hashCode +
        flags.hashCode +
        oif.hashCode +
        iif.hashCode +
        dst.hashCode +
        src.hashCode +
        prefsrc.hashCode +
        priority.hashCode +
        pref.hashCode;

  factory RoutesRoutesInner.fromJson(Map<String, dynamic> json) => _$RoutesRoutesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$RoutesRoutesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Address family
enum RoutesRoutesInnerFamilyEnum {
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

const RoutesRoutesInnerFamilyEnum(this.value);

final String value;

@override
String toString() => value;
}


