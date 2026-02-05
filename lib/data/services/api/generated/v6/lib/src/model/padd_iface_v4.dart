//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/padd_iface_v4_rx_bytes.dart';
import 'package:pihole_v6_api/src/model/padd_iface_v4_tx_bytes.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_iface_v4.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddIfaceV4 {
  /// Returns a new [PaddIfaceV4] instance.
  PaddIfaceV4({

     this.addr,

     this.rxBytes,

     this.txBytes,

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



  @JsonKey(
    
    name: r'rx_bytes',
    required: false,
    includeIfNull: false,
  )


  final PaddIfaceV4RxBytes? rxBytes;



  @JsonKey(
    
    name: r'tx_bytes',
    required: false,
    includeIfNull: false,
  )


  final PaddIfaceV4TxBytes? txBytes;



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
    bool operator ==(Object other) => identical(this, other) || other is PaddIfaceV4 &&
      other.addr == addr &&
      other.rxBytes == rxBytes &&
      other.txBytes == txBytes &&
      other.numAddrs == numAddrs &&
      other.name == name &&
      other.gwAddr == gwAddr;

    @override
    int get hashCode =>
        (addr == null ? 0 : addr.hashCode) +
        rxBytes.hashCode +
        txBytes.hashCode +
        numAddrs.hashCode +
        name.hashCode +
        (gwAddr == null ? 0 : gwAddr.hashCode);

  factory PaddIfaceV4.fromJson(Map<String, dynamic> json) => _$PaddIfaceV4FromJson(json);

  Map<String, dynamic> toJson() => _$PaddIfaceV4ToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

