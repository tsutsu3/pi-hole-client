//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_dns_cache.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_reply.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_rate_limit.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_domain.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_special_domains.dart';
import 'package:pihole_v6_api/src/model/config_config_dns_blocking.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_dns.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDns {
  /// Returns a new [ConfigConfigDns] instance.
  ConfigConfigDns({

     this.upstreams,

     this.cNAMEdeepInspect,

     this.blockESNI,

     this.eDNS0ECS,

     this.ignoreLocalhost,

     this.showDNSSEC,

     this.analyzeOnlyAandAAAA,

     this.piholePTR,

     this.replyWhenBusy,

     this.blockTTL,

     this.hosts,

     this.domainNeeded,

     this.expandHosts,

     this.domain,

     this.bogusPriv,

     this.dnssec,

     this.interface_,

     this.hostRecord,

     this.listeningMode,

     this.queryLogging,

     this.cnameRecords,

     this.port,

     this.localise,

     this.cache,

     this.revServers,

     this.blocking,

     this.specialDomains,

     this.reply,

     this.rateLimit,
  });

  @JsonKey(
    
    name: r'upstreams',
    required: false,
    includeIfNull: false,
  )


  final List<String>? upstreams;



  @JsonKey(
    
    name: r'CNAMEdeepInspect',
    required: false,
    includeIfNull: false,
  )


  final bool? cNAMEdeepInspect;



  @JsonKey(
    
    name: r'blockESNI',
    required: false,
    includeIfNull: false,
  )


  final bool? blockESNI;



  @JsonKey(
    
    name: r'EDNS0ECS',
    required: false,
    includeIfNull: false,
  )


  final bool? eDNS0ECS;



  @JsonKey(
    
    name: r'ignoreLocalhost',
    required: false,
    includeIfNull: false,
  )


  final bool? ignoreLocalhost;



  @JsonKey(
    
    name: r'showDNSSEC',
    required: false,
    includeIfNull: false,
  )


  final bool? showDNSSEC;



  @JsonKey(
    
    name: r'analyzeOnlyAandAAAA',
    required: false,
    includeIfNull: false,
  )


  final bool? analyzeOnlyAandAAAA;



  @JsonKey(
    
    name: r'piholePTR',
    required: false,
    includeIfNull: false,
  )


  final String? piholePTR;



  @JsonKey(
    
    name: r'replyWhenBusy',
    required: false,
    includeIfNull: false,
  )


  final String? replyWhenBusy;



  @JsonKey(
    
    name: r'blockTTL',
    required: false,
    includeIfNull: false,
  )


  final int? blockTTL;



  @JsonKey(
    
    name: r'hosts',
    required: false,
    includeIfNull: false,
  )


  final List<String>? hosts;



  @JsonKey(
    
    name: r'domainNeeded',
    required: false,
    includeIfNull: false,
  )


  final bool? domainNeeded;



  @JsonKey(
    
    name: r'expandHosts',
    required: false,
    includeIfNull: false,
  )


  final bool? expandHosts;



  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDnsDomain? domain;



  @JsonKey(
    
    name: r'bogusPriv',
    required: false,
    includeIfNull: false,
  )


  final bool? bogusPriv;



  @JsonKey(
    
    name: r'dnssec',
    required: false,
    includeIfNull: false,
  )


  final bool? dnssec;



  @JsonKey(
    
    name: r'interface',
    required: false,
    includeIfNull: false,
  )


  final String? interface_;



  @JsonKey(
    
    name: r'hostRecord',
    required: false,
    includeIfNull: false,
  )


  final String? hostRecord;



  @JsonKey(
    
    name: r'listeningMode',
    required: false,
    includeIfNull: false,
  )


  final String? listeningMode;



  @JsonKey(
    
    name: r'queryLogging',
    required: false,
    includeIfNull: false,
  )


  final bool? queryLogging;



  @JsonKey(
    
    name: r'cnameRecords',
    required: false,
    includeIfNull: false,
  )


  final List<String>? cnameRecords;



  @JsonKey(
    
    name: r'port',
    required: false,
    includeIfNull: false,
  )


  final int? port;



  @JsonKey(
    
    name: r'localise',
    required: false,
    includeIfNull: false,
  )


  final bool? localise;



  @JsonKey(
    
    name: r'cache',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDnsCache? cache;



  @JsonKey(
    
    name: r'revServers',
    required: false,
    includeIfNull: false,
  )


  final List<String>? revServers;



  @JsonKey(
    
    name: r'blocking',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDnsBlocking? blocking;



  @JsonKey(
    
    name: r'specialDomains',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDnsSpecialDomains? specialDomains;



  @JsonKey(
    
    name: r'reply',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDnsReply? reply;



  @JsonKey(
    
    name: r'rateLimit',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDnsRateLimit? rateLimit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDns &&
      other.upstreams == upstreams &&
      other.cNAMEdeepInspect == cNAMEdeepInspect &&
      other.blockESNI == blockESNI &&
      other.eDNS0ECS == eDNS0ECS &&
      other.ignoreLocalhost == ignoreLocalhost &&
      other.showDNSSEC == showDNSSEC &&
      other.analyzeOnlyAandAAAA == analyzeOnlyAandAAAA &&
      other.piholePTR == piholePTR &&
      other.replyWhenBusy == replyWhenBusy &&
      other.blockTTL == blockTTL &&
      other.hosts == hosts &&
      other.domainNeeded == domainNeeded &&
      other.expandHosts == expandHosts &&
      other.domain == domain &&
      other.bogusPriv == bogusPriv &&
      other.dnssec == dnssec &&
      other.interface_ == interface_ &&
      other.hostRecord == hostRecord &&
      other.listeningMode == listeningMode &&
      other.queryLogging == queryLogging &&
      other.cnameRecords == cnameRecords &&
      other.port == port &&
      other.localise == localise &&
      other.cache == cache &&
      other.revServers == revServers &&
      other.blocking == blocking &&
      other.specialDomains == specialDomains &&
      other.reply == reply &&
      other.rateLimit == rateLimit;

    @override
    int get hashCode =>
        upstreams.hashCode +
        cNAMEdeepInspect.hashCode +
        blockESNI.hashCode +
        eDNS0ECS.hashCode +
        ignoreLocalhost.hashCode +
        showDNSSEC.hashCode +
        analyzeOnlyAandAAAA.hashCode +
        piholePTR.hashCode +
        replyWhenBusy.hashCode +
        blockTTL.hashCode +
        hosts.hashCode +
        domainNeeded.hashCode +
        expandHosts.hashCode +
        domain.hashCode +
        bogusPriv.hashCode +
        dnssec.hashCode +
        interface_.hashCode +
        hostRecord.hashCode +
        listeningMode.hashCode +
        queryLogging.hashCode +
        cnameRecords.hashCode +
        port.hashCode +
        localise.hashCode +
        cache.hashCode +
        revServers.hashCode +
        blocking.hashCode +
        specialDomains.hashCode +
        reply.hashCode +
        rateLimit.hashCode;

  factory ConfigConfigDns.fromJson(Map<String, dynamic> json) => _$ConfigConfigDnsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDnsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

