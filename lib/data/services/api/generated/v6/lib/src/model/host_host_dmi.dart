//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/host_host_dmi_board.dart';
import 'package:pihole_v6_api/src/model/host_host_dmi_sys.dart';
import 'package:pihole_v6_api/src/model/host_host_dmi_product.dart';
import 'package:pihole_v6_api/src/model/host_host_dmi_bios.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_host_dmi.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HostHostDmi {
  /// Returns a new [HostHostDmi] instance.
  HostHostDmi({

     this.bios,

     this.board,

     this.product,

     this.sys,
  });

  @JsonKey(
    
    name: r'bios',
    required: false,
    includeIfNull: false,
  )


  final HostHostDmiBios? bios;



  @JsonKey(
    
    name: r'board',
    required: false,
    includeIfNull: false,
  )


  final HostHostDmiBoard? board;



  @JsonKey(
    
    name: r'product',
    required: false,
    includeIfNull: false,
  )


  final HostHostDmiProduct? product;



  @JsonKey(
    
    name: r'sys',
    required: false,
    includeIfNull: false,
  )


  final HostHostDmiSys? sys;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HostHostDmi &&
      other.bios == bios &&
      other.board == board &&
      other.product == product &&
      other.sys == sys;

    @override
    int get hashCode =>
        bios.hashCode +
        board.hashCode +
        product.hashCode +
        sys.hashCode;

  factory HostHostDmi.fromJson(Map<String, dynamic> json) => _$HostHostDmiFromJson(json);

  Map<String, dynamic> toJson() => _$HostHostDmiToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

