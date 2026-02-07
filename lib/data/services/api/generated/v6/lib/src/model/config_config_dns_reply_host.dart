//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_dns_reply_host.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDnsReplyHost {
  /// Returns a new [ConfigConfigDnsReplyHost] instance.
  ConfigConfigDnsReplyHost({

     this.force4,

     this.force6,

     this.iPv4,

     this.iPv6,
  });

  @JsonKey(
    
    name: r'force4',
    required: false,
    includeIfNull: false,
  )


  final bool? force4;



  @JsonKey(
    
    name: r'force6',
    required: false,
    includeIfNull: false,
  )


  final bool? force6;



  @JsonKey(
    
    name: r'IPv4',
    required: false,
    includeIfNull: false,
  )


  final String? iPv4;



  @JsonKey(
    
    name: r'IPv6',
    required: false,
    includeIfNull: false,
  )


  final String? iPv6;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDnsReplyHost &&
      other.force4 == force4 &&
      other.force6 == force6 &&
      other.iPv4 == iPv4 &&
      other.iPv6 == iPv6;

    @override
    int get hashCode =>
        force4.hashCode +
        force6.hashCode +
        iPv4.hashCode +
        iPv6.hashCode;

  factory ConfigConfigDnsReplyHost.fromJson(Map<String, dynamic> json) => _$ConfigConfigDnsReplyHostFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDnsReplyHostToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

