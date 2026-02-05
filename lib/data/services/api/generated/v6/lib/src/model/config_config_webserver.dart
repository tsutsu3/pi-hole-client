//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_webserver_tls.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_api.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_session.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_interface.dart';
import 'package:pihole_v6_api/src/model/config_config_webserver_paths.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_webserver.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigWebserver {
  /// Returns a new [ConfigConfigWebserver] instance.
  ConfigConfigWebserver({

     this.domain,

     this.acl,

     this.port,

     this.threads,

     this.headers,

     this.serveAll,

     this.advancedOpts,

     this.session,

     this.tls,

     this.paths,

     this.interface_,

     this.api,
  });

  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final String? domain;



  @JsonKey(
    
    name: r'acl',
    required: false,
    includeIfNull: false,
  )


  final String? acl;



  @JsonKey(
    
    name: r'port',
    required: false,
    includeIfNull: false,
  )


  final String? port;



  @JsonKey(
    
    name: r'threads',
    required: false,
    includeIfNull: false,
  )


  final int? threads;



  @JsonKey(
    
    name: r'headers',
    required: false,
    includeIfNull: false,
  )


  final List<String>? headers;



  @JsonKey(
    
    name: r'serve_all',
    required: false,
    includeIfNull: false,
  )


  final bool? serveAll;



  @JsonKey(
    
    name: r'advancedOpts',
    required: false,
    includeIfNull: false,
  )


  final List<String>? advancedOpts;



  @JsonKey(
    
    name: r'session',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigWebserverSession? session;



  @JsonKey(
    
    name: r'tls',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigWebserverTls? tls;



  @JsonKey(
    
    name: r'paths',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigWebserverPaths? paths;



  @JsonKey(
    
    name: r'interface',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigWebserverInterface? interface_;



  @JsonKey(
    
    name: r'api',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigWebserverApi? api;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigWebserver &&
      other.domain == domain &&
      other.acl == acl &&
      other.port == port &&
      other.threads == threads &&
      other.headers == headers &&
      other.serveAll == serveAll &&
      other.advancedOpts == advancedOpts &&
      other.session == session &&
      other.tls == tls &&
      other.paths == paths &&
      other.interface_ == interface_ &&
      other.api == api;

    @override
    int get hashCode =>
        domain.hashCode +
        acl.hashCode +
        port.hashCode +
        threads.hashCode +
        headers.hashCode +
        serveAll.hashCode +
        advancedOpts.hashCode +
        session.hashCode +
        tls.hashCode +
        paths.hashCode +
        interface_.hashCode +
        api.hashCode;

  factory ConfigConfigWebserver.fromJson(Map<String, dynamic> json) => _$ConfigConfigWebserverFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigWebserverToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

