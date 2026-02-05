//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_ntp_ipv4.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigNtpIpv4 {
  /// Returns a new [ConfigConfigNtpIpv4] instance.
  ConfigConfigNtpIpv4({

     this.active,

     this.address,
  });

  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final bool? active;



  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigNtpIpv4 &&
      other.active == active &&
      other.address == address;

    @override
    int get hashCode =>
        active.hashCode +
        address.hashCode;

  factory ConfigConfigNtpIpv4.fromJson(Map<String, dynamic> json) => _$ConfigConfigNtpIpv4FromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigNtpIpv4ToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

