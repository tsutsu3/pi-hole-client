//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/ftl_ftl_database.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_dnsmasq.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_clients.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtl {
  /// Returns a new [FtlFtl] instance.
  FtlFtl({

     this.database,

     this.privacyLevel,

     this.queryFrequency,

     this.clients,

     this.pid,

     this.uptime,

     this.percentMem,

     this.percentCpu,

     this.allowDestructive,

     this.dnsmasq,
  });

  @JsonKey(
    
    name: r'database',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlDatabase? database;



      /// Currently used privacy level
  @JsonKey(
    
    name: r'privacy_level',
    required: false,
    includeIfNull: false,
  )


  final int? privacyLevel;



      /// Average number of queries per second
  @JsonKey(
    
    name: r'query_frequency',
    required: false,
    includeIfNull: false,
  )


  final num? queryFrequency;



  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlClients? clients;



      /// PID of FTL process
  @JsonKey(
    
    name: r'pid',
    required: false,
    includeIfNull: false,
  )


  final int? pid;



      /// Uptime of FTL in milliseconds
  @JsonKey(
    
    name: r'uptime',
    required: false,
    includeIfNull: false,
  )


  final num? uptime;



      /// Percentage of total RAM memory used by FTL
  @JsonKey(
    
    name: r'%mem',
    required: false,
    includeIfNull: false,
  )


  final num? percentMem;



      /// Percentage of total CPU used by FTL (ten seconds average)
  @JsonKey(
    
    name: r'%cpu',
    required: false,
    includeIfNull: false,
  )


  final num? percentCpu;



      /// Whether or not FTL is allowed to perform destructive actions
  @JsonKey(
    
    name: r'allow_destructive',
    required: false,
    includeIfNull: false,
  )


  final bool? allowDestructive;



  @JsonKey(
    
    name: r'dnsmasq',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlDnsmasq? dnsmasq;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtl &&
      other.database == database &&
      other.privacyLevel == privacyLevel &&
      other.queryFrequency == queryFrequency &&
      other.clients == clients &&
      other.pid == pid &&
      other.uptime == uptime &&
      other.percentMem == percentMem &&
      other.percentCpu == percentCpu &&
      other.allowDestructive == allowDestructive &&
      other.dnsmasq == dnsmasq;

    @override
    int get hashCode =>
        database.hashCode +
        privacyLevel.hashCode +
        queryFrequency.hashCode +
        clients.hashCode +
        pid.hashCode +
        uptime.hashCode +
        percentMem.hashCode +
        percentCpu.hashCode +
        allowDestructive.hashCode +
        dnsmasq.hashCode;

  factory FtlFtl.fromJson(Map<String, dynamic> json) => _$FtlFtlFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

