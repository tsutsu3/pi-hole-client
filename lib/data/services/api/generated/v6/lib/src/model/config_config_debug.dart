//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_debug.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDebug {
  /// Returns a new [ConfigConfigDebug] instance.
  ConfigConfigDebug({

     this.database,

     this.networking,

     this.locks,

     this.queries,

     this.flags,

     this.shmem,

     this.gc,

     this.arp,

     this.regex,

     this.api,

     this.tls,

     this.overtime,

     this.status,

     this.caps,

     this.dnssec,

     this.vectors,

     this.resolver,

     this.edns0,

     this.clients,

     this.aliasclients,

     this.events,

     this.helper,

     this.config,

     this.inotify,

     this.webserver,

     this.extra,

     this.reserved,

     this.ntp,

     this.netlink,

     this.timing,

     this.all,
  });

  @JsonKey(
    
    name: r'database',
    required: false,
    includeIfNull: false,
  )


  final bool? database;



  @JsonKey(
    
    name: r'networking',
    required: false,
    includeIfNull: false,
  )


  final bool? networking;



  @JsonKey(
    
    name: r'locks',
    required: false,
    includeIfNull: false,
  )


  final bool? locks;



  @JsonKey(
    
    name: r'queries',
    required: false,
    includeIfNull: false,
  )


  final bool? queries;



  @JsonKey(
    
    name: r'flags',
    required: false,
    includeIfNull: false,
  )


  final bool? flags;



  @JsonKey(
    
    name: r'shmem',
    required: false,
    includeIfNull: false,
  )


  final bool? shmem;



  @JsonKey(
    
    name: r'gc',
    required: false,
    includeIfNull: false,
  )


  final bool? gc;



  @JsonKey(
    
    name: r'arp',
    required: false,
    includeIfNull: false,
  )


  final bool? arp;



  @JsonKey(
    
    name: r'regex',
    required: false,
    includeIfNull: false,
  )


  final bool? regex;



  @JsonKey(
    
    name: r'api',
    required: false,
    includeIfNull: false,
  )


  final bool? api;



  @JsonKey(
    
    name: r'tls',
    required: false,
    includeIfNull: false,
  )


  final bool? tls;



  @JsonKey(
    
    name: r'overtime',
    required: false,
    includeIfNull: false,
  )


  final bool? overtime;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final bool? status;



  @JsonKey(
    
    name: r'caps',
    required: false,
    includeIfNull: false,
  )


  final bool? caps;



  @JsonKey(
    
    name: r'dnssec',
    required: false,
    includeIfNull: false,
  )


  final bool? dnssec;



  @JsonKey(
    
    name: r'vectors',
    required: false,
    includeIfNull: false,
  )


  final bool? vectors;



  @JsonKey(
    
    name: r'resolver',
    required: false,
    includeIfNull: false,
  )


  final bool? resolver;



  @JsonKey(
    
    name: r'edns0',
    required: false,
    includeIfNull: false,
  )


  final bool? edns0;



  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final bool? clients;



  @JsonKey(
    
    name: r'aliasclients',
    required: false,
    includeIfNull: false,
  )


  final bool? aliasclients;



  @JsonKey(
    
    name: r'events',
    required: false,
    includeIfNull: false,
  )


  final bool? events;



  @JsonKey(
    
    name: r'helper',
    required: false,
    includeIfNull: false,
  )


  final bool? helper;



  @JsonKey(
    
    name: r'config',
    required: false,
    includeIfNull: false,
  )


  final bool? config;



  @JsonKey(
    
    name: r'inotify',
    required: false,
    includeIfNull: false,
  )


  final bool? inotify;



  @JsonKey(
    
    name: r'webserver',
    required: false,
    includeIfNull: false,
  )


  final bool? webserver;



  @JsonKey(
    
    name: r'extra',
    required: false,
    includeIfNull: false,
  )


  final bool? extra;



  @JsonKey(
    
    name: r'reserved',
    required: false,
    includeIfNull: false,
  )


  final bool? reserved;



  @JsonKey(
    
    name: r'ntp',
    required: false,
    includeIfNull: false,
  )


  final bool? ntp;



  @JsonKey(
    
    name: r'netlink',
    required: false,
    includeIfNull: false,
  )


  final bool? netlink;



  @JsonKey(
    
    name: r'timing',
    required: false,
    includeIfNull: false,
  )


  final bool? timing;



  @JsonKey(
    
    name: r'all',
    required: false,
    includeIfNull: false,
  )


  final bool? all;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDebug &&
      other.database == database &&
      other.networking == networking &&
      other.locks == locks &&
      other.queries == queries &&
      other.flags == flags &&
      other.shmem == shmem &&
      other.gc == gc &&
      other.arp == arp &&
      other.regex == regex &&
      other.api == api &&
      other.tls == tls &&
      other.overtime == overtime &&
      other.status == status &&
      other.caps == caps &&
      other.dnssec == dnssec &&
      other.vectors == vectors &&
      other.resolver == resolver &&
      other.edns0 == edns0 &&
      other.clients == clients &&
      other.aliasclients == aliasclients &&
      other.events == events &&
      other.helper == helper &&
      other.config == config &&
      other.inotify == inotify &&
      other.webserver == webserver &&
      other.extra == extra &&
      other.reserved == reserved &&
      other.ntp == ntp &&
      other.netlink == netlink &&
      other.timing == timing &&
      other.all == all;

    @override
    int get hashCode =>
        database.hashCode +
        networking.hashCode +
        locks.hashCode +
        queries.hashCode +
        flags.hashCode +
        shmem.hashCode +
        gc.hashCode +
        arp.hashCode +
        regex.hashCode +
        api.hashCode +
        tls.hashCode +
        overtime.hashCode +
        status.hashCode +
        caps.hashCode +
        dnssec.hashCode +
        vectors.hashCode +
        resolver.hashCode +
        edns0.hashCode +
        clients.hashCode +
        aliasclients.hashCode +
        events.hashCode +
        helper.hashCode +
        config.hashCode +
        inotify.hashCode +
        webserver.hashCode +
        extra.hashCode +
        reserved.hashCode +
        ntp.hashCode +
        netlink.hashCode +
        timing.hashCode +
        all.hashCode;

  factory ConfigConfigDebug.fromJson(Map<String, dynamic> json) => _$ConfigConfigDebugFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDebugToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

