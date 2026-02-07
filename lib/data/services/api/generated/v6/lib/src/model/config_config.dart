//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_ntp.dart';
import 'package:pihole_v6_api/src/model/config_config_database.dart';
import 'package:pihole_v6_api/src/model/config_config_dns.dart';
import 'package:pihole_v6_api/src/model/config_config_debug.dart';
import 'package:pihole_v6_api/src/model/config_config_files.dart';
import 'package:pihole_v6_api/src/model/config_config_dhcp.dart';
import 'package:pihole_v6_api/src/model/config_config_misc.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver.dart';
import 'package:pihole_v6_api/src/model/config_config_resolver.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfig {
  /// Returns a new [ConfigConfig] instance.
  ConfigConfig({

     this.dns,

     this.dhcp,

     this.ntp,

     this.resolver,

     this.database,

     this.webserver,

     this.files,

     this.misc,

     this.debug,
  });

  @JsonKey(
    
    name: r'dns',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDns? dns;



  @JsonKey(
    
    name: r'dhcp',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDhcp? dhcp;



  @JsonKey(
    
    name: r'ntp',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigNtp? ntp;



  @JsonKey(
    
    name: r'resolver',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigResolver? resolver;



  @JsonKey(
    
    name: r'database',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDatabase? database;



  @JsonKey(
    
    name: r'webserver',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigWebserver? webserver;



  @JsonKey(
    
    name: r'files',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigFiles? files;



  @JsonKey(
    
    name: r'misc',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigMisc? misc;



  @JsonKey(
    
    name: r'debug',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDebug? debug;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfig &&
      other.dns == dns &&
      other.dhcp == dhcp &&
      other.ntp == ntp &&
      other.resolver == resolver &&
      other.database == database &&
      other.webserver == webserver &&
      other.files == files &&
      other.misc == misc &&
      other.debug == debug;

    @override
    int get hashCode =>
        dns.hashCode +
        dhcp.hashCode +
        ntp.hashCode +
        resolver.hashCode +
        database.hashCode +
        webserver.hashCode +
        files.hashCode +
        misc.hashCode +
        debug.hashCode;

  factory ConfigConfig.fromJson(Map<String, dynamic> json) => _$ConfigConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

