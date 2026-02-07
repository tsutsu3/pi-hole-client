//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/padd_iface_v6.dart';
import 'package:pihole_v6_api/src/model/padd_iface_v4.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_iface.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddIface {
  /// Returns a new [PaddIface] instance.
  PaddIface({

     this.v4,

     this.v6,
  });

  @JsonKey(
    
    name: r'v4',
    required: false,
    includeIfNull: false,
  )


  final PaddIfaceV4? v4;



  @JsonKey(
    
    name: r'v6',
    required: false,
    includeIfNull: false,
  )


  final PaddIfaceV6? v6;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaddIface &&
      other.v4 == v4 &&
      other.v6 == v6;

    @override
    int get hashCode =>
        v4.hashCode +
        v6.hashCode;

  factory PaddIface.fromJson(Map<String, dynamic> json) => _$PaddIfaceFromJson(json);

  Map<String, dynamic> toJson() => _$PaddIfaceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

