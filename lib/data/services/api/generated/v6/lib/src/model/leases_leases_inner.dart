//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leases_leases_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LeasesLeasesInner {
  /// Returns a new [LeasesLeasesInner] instance.
  LeasesLeasesInner({

     this.expires,

     this.name,

     this.hwaddr,

     this.ip,

     this.clientid,
  });

      /// Expiration time (0 = infinite lease, never expires)
  @JsonKey(
    
    name: r'expires',
    required: false,
    includeIfNull: false,
  )


  final int? expires;



      /// Hostname
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Hardware (MAC) address
  @JsonKey(
    
    name: r'hwaddr',
    required: false,
    includeIfNull: false,
  )


  final String? hwaddr;



      /// IP address
  @JsonKey(
    
    name: r'ip',
    required: false,
    includeIfNull: false,
  )


  final String? ip;



      /// Client ID
  @JsonKey(
    
    name: r'clientid',
    required: false,
    includeIfNull: false,
  )


  final String? clientid;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LeasesLeasesInner &&
      other.expires == expires &&
      other.name == name &&
      other.hwaddr == hwaddr &&
      other.ip == ip &&
      other.clientid == clientid;

    @override
    int get hashCode =>
        expires.hashCode +
        name.hashCode +
        hwaddr.hashCode +
        ip.hashCode +
        clientid.hashCode;

  factory LeasesLeasesInner.fromJson(Map<String, dynamic> json) => _$LeasesLeasesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$LeasesLeasesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

