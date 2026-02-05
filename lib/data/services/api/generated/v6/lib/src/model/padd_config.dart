//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_config.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddConfig {
  /// Returns a new [PaddConfig] instance.
  PaddConfig({

     this.dhcpActive,

     this.dhcpStart,

     this.dhcpEnd,

     this.dhcpIpv6,

     this.dnsDomain,

     this.dnsPort,

     this.dnsNumUpstreams,

     this.dnsDnssec,

     this.dnsRevServerActive,

     this.privacyLevel,
  });

      /// DHCP server status
  @JsonKey(
    
    name: r'dhcp_active',
    required: false,
    includeIfNull: false,
  )


  final bool? dhcpActive;



      /// DHCP start address
  @JsonKey(
    
    name: r'dhcp_start',
    required: false,
    includeIfNull: false,
  )


  final String? dhcpStart;



      /// DHCP end address
  @JsonKey(
    
    name: r'dhcp_end',
    required: false,
    includeIfNull: false,
  )


  final String? dhcpEnd;



      /// DHCPv6 server status
  @JsonKey(
    
    name: r'dhcp_ipv6',
    required: false,
    includeIfNull: false,
  )


  final bool? dhcpIpv6;



      /// DNS domain
  @JsonKey(
    
    name: r'dns_domain',
    required: false,
    includeIfNull: false,
  )


  final String? dnsDomain;



      /// DNS port
  @JsonKey(
    
    name: r'dns_port',
    required: false,
    includeIfNull: false,
  )


  final int? dnsPort;



      /// Number of upstream DNS servers
  @JsonKey(
    
    name: r'dns_num_upstreams',
    required: false,
    includeIfNull: false,
  )


  final int? dnsNumUpstreams;



      /// DNSSEC status
  @JsonKey(
    
    name: r'dns_dnssec',
    required: false,
    includeIfNull: false,
  )


  final bool? dnsDnssec;



      /// Reverse DNS server status
  @JsonKey(
    
    name: r'dns_revServer_active',
    required: false,
    includeIfNull: false,
  )


  final bool? dnsRevServerActive;



      /// Privacy level
  @JsonKey(
    
    name: r'privacy_level',
    required: false,
    includeIfNull: false,
  )


  final int? privacyLevel;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaddConfig &&
      other.dhcpActive == dhcpActive &&
      other.dhcpStart == dhcpStart &&
      other.dhcpEnd == dhcpEnd &&
      other.dhcpIpv6 == dhcpIpv6 &&
      other.dnsDomain == dnsDomain &&
      other.dnsPort == dnsPort &&
      other.dnsNumUpstreams == dnsNumUpstreams &&
      other.dnsDnssec == dnsDnssec &&
      other.dnsRevServerActive == dnsRevServerActive &&
      other.privacyLevel == privacyLevel;

    @override
    int get hashCode =>
        dhcpActive.hashCode +
        dhcpStart.hashCode +
        dhcpEnd.hashCode +
        dhcpIpv6.hashCode +
        dnsDomain.hashCode +
        dnsPort.hashCode +
        dnsNumUpstreams.hashCode +
        dnsDnssec.hashCode +
        dnsRevServerActive.hashCode +
        privacyLevel.hashCode;

  factory PaddConfig.fromJson(Map<String, dynamic> json) => _$PaddConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PaddConfigToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

