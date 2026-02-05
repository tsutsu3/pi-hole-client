//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_ntp_sync.dart';
import 'package:pihole_v6_api/src/model/config_config_ntp_ipv4.dart';
import 'package:pihole_v6_api/src/model/config_config_ntp_ipv6.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_ntp.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigNtp {
  /// Returns a new [ConfigConfigNtp] instance.
  ConfigConfigNtp({

     this.ipv4,

     this.ipv6,

     this.sync_,
  });

  @JsonKey(
    
    name: r'ipv4',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigNtpIpv4? ipv4;



  @JsonKey(
    
    name: r'ipv6',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigNtpIpv6? ipv6;



  @JsonKey(
    
    name: r'sync',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigNtpSync? sync_;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigNtp &&
      other.ipv4 == ipv4 &&
      other.ipv6 == ipv6 &&
      other.sync_ == sync_;

    @override
    int get hashCode =>
        ipv4.hashCode +
        ipv6.hashCode +
        sync_.hashCode;

  factory ConfigConfigNtp.fromJson(Map<String, dynamic> json) => _$ConfigConfigNtpFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigNtpToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

