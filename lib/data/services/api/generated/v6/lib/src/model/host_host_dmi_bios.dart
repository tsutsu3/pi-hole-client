//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_host_dmi_bios.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HostHostDmiBios {
  /// Returns a new [HostHostDmiBios] instance.
  HostHostDmiBios({

     this.vendor,
  });

      /// BIOS vendor (if available, `null` otherwise)
  @JsonKey(
    
    name: r'vendor',
    required: false,
    includeIfNull: false,
  )


  final String? vendor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HostHostDmiBios &&
      other.vendor == vendor;

    @override
    int get hashCode =>
        (vendor == null ? 0 : vendor.hashCode);

  factory HostHostDmiBios.fromJson(Map<String, dynamic> json) => _$HostHostDmiBiosFromJson(json);

  Map<String, dynamic> toJson() => _$HostHostDmiBiosToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

