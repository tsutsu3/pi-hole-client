//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/padd_queries.dart';
import 'package:pihole_v6_api/src/model/padd_config.dart';
import 'package:pihole_v6_api/src/model/system_system.dart';
import 'package:pihole_v6_api/src/model/padd_iface.dart';
import 'package:pihole_v6_api/src/model/padd_sensors.dart';
import 'package:pihole_v6_api/src/model/padd_cache.dart';
import 'package:pihole_v6_api/src/model/version_version.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_padd200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetPadd200Response {
  /// Returns a new [GetPadd200Response] instance.
  GetPadd200Response({

     this.recentBlocked,

     this.topDomain,

     this.topBlocked,

     this.topClient,

     this.activeClients,

     this.gravitySize,

     this.blocking,

     this.queries,

     this.cache,

     this.iface,

     this.nodeName,

     this.hostModel,

     this.config,

     this.percentCpu,

     this.percentMem,

     this.pid,

     this.sensors,

     this.system,

     this.version,

     this.took,
  });

      /// Most recent blocked domain
  @JsonKey(
    
    name: r'recent_blocked',
    required: false,
    includeIfNull: false,
  )


  final String? recentBlocked;



      /// Most requested domain
  @JsonKey(
    
    name: r'top_domain',
    required: false,
    includeIfNull: false,
  )


  final String? topDomain;



      /// Most blocked domain
  @JsonKey(
    
    name: r'top_blocked',
    required: false,
    includeIfNull: false,
  )


  final String? topBlocked;



      /// Most active client
  @JsonKey(
    
    name: r'top_client',
    required: false,
    includeIfNull: false,
  )


  final String? topClient;



      /// Number of active clients
  @JsonKey(
    
    name: r'active_clients',
    required: false,
    includeIfNull: false,
  )


  final int? activeClients;



      /// Gravity list size
  @JsonKey(
    
    name: r'gravity_size',
    required: false,
    includeIfNull: false,
  )


  final int? gravitySize;



      /// Blocking status
  @JsonKey(
    
    name: r'blocking',
    required: false,
    includeIfNull: false,
  )


  final String? blocking;



  @JsonKey(
    
    name: r'queries',
    required: false,
    includeIfNull: false,
  )


  final PaddQueries? queries;



  @JsonKey(
    
    name: r'cache',
    required: false,
    includeIfNull: false,
  )


  final PaddCache? cache;



  @JsonKey(
    
    name: r'iface',
    required: false,
    includeIfNull: false,
  )


  final PaddIface? iface;



      /// Pi-hole host's name
  @JsonKey(
    
    name: r'node_name',
    required: false,
    includeIfNull: false,
  )


  final String? nodeName;



      /// Host model
  @JsonKey(
    
    name: r'host_model',
    required: false,
    includeIfNull: false,
  )


  final String? hostModel;



  @JsonKey(
    
    name: r'config',
    required: false,
    includeIfNull: false,
  )


  final PaddConfig? config;



      /// CPU usage
  @JsonKey(
    
    name: r'%cpu',
    required: false,
    includeIfNull: false,
  )


  final num? percentCpu;



      /// Memory usage
  @JsonKey(
    
    name: r'%mem',
    required: false,
    includeIfNull: false,
  )


  final num? percentMem;



      /// FTL's process ID
  @JsonKey(
    
    name: r'pid',
    required: false,
    includeIfNull: false,
  )


  final int? pid;



  @JsonKey(
    
    name: r'sensors',
    required: false,
    includeIfNull: false,
  )


  final PaddSensors? sensors;



  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final SystemSystem? system;



  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final VersionVersion? version;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetPadd200Response &&
      other.recentBlocked == recentBlocked &&
      other.topDomain == topDomain &&
      other.topBlocked == topBlocked &&
      other.topClient == topClient &&
      other.activeClients == activeClients &&
      other.gravitySize == gravitySize &&
      other.blocking == blocking &&
      other.queries == queries &&
      other.cache == cache &&
      other.iface == iface &&
      other.nodeName == nodeName &&
      other.hostModel == hostModel &&
      other.config == config &&
      other.percentCpu == percentCpu &&
      other.percentMem == percentMem &&
      other.pid == pid &&
      other.sensors == sensors &&
      other.system == system &&
      other.version == version &&
      other.took == took;

    @override
    int get hashCode =>
        (recentBlocked == null ? 0 : recentBlocked.hashCode) +
        (topDomain == null ? 0 : topDomain.hashCode) +
        (topBlocked == null ? 0 : topBlocked.hashCode) +
        (topClient == null ? 0 : topClient.hashCode) +
        activeClients.hashCode +
        gravitySize.hashCode +
        blocking.hashCode +
        queries.hashCode +
        cache.hashCode +
        iface.hashCode +
        nodeName.hashCode +
        (hostModel == null ? 0 : hostModel.hashCode) +
        config.hashCode +
        percentCpu.hashCode +
        percentMem.hashCode +
        pid.hashCode +
        sensors.hashCode +
        system.hashCode +
        version.hashCode +
        took.hashCode;

  factory GetPadd200Response.fromJson(Map<String, dynamic> json) => _$GetPadd200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPadd200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

