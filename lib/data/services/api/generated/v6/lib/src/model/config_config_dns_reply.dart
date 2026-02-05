//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_dns_reply_host.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_dns_reply.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDnsReply {
  /// Returns a new [ConfigConfigDnsReply] instance.
  ConfigConfigDnsReply({

     this.host,

     this.blocking,
  });

  @JsonKey(
    
    name: r'host',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDnsReplyHost? host;



  @JsonKey(
    
    name: r'blocking',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDnsReplyHost? blocking;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDnsReply &&
      other.host == host &&
      other.blocking == blocking;

    @override
    int get hashCode =>
        host.hashCode +
        blocking.hashCode;

  factory ConfigConfigDnsReply.fromJson(Map<String, dynamic> json) => _$ConfigConfigDnsReplyFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDnsReplyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

