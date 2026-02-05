//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_iface_v6.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddIfaceV6 {
  /// Returns a new [PaddIfaceV6] instance.
  PaddIfaceV6({

     this.addr,

     this.numAddrs,

     this.name,

     this.gwAddr,
  });

      /// Primary address
  @JsonKey(
    
    name: r'addr',
    required: false,
    includeIfNull: false,
  )


  final String? addr;



      /// Number of addresses on the interface
  @JsonKey(
    
    name: r'num_addrs',
    required: false,
    includeIfNull: false,
  )


  final int? numAddrs;



      /// Interface name
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Gateway address
  @JsonKey(
    
    name: r'gw_addr',
    required: false,
    includeIfNull: false,
  )


  final String? gwAddr;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaddIfaceV6 &&
      other.addr == addr &&
      other.numAddrs == numAddrs &&
      other.name == name &&
      other.gwAddr == gwAddr;

    @override
    int get hashCode =>
        (addr == null ? 0 : addr.hashCode) +
        numAddrs.hashCode +
        name.hashCode +
        (gwAddr == null ? 0 : gwAddr.hashCode);

  factory PaddIfaceV6.fromJson(Map<String, dynamic> json) => _$PaddIfaceV6FromJson(json);

  Map<String, dynamic> toJson() => _$PaddIfaceV6ToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

