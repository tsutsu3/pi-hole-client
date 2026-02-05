//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl_dnsmasq.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtlDnsmasq {
  /// Returns a new [FtlFtlDnsmasq] instance.
  FtlFtlDnsmasq({

     this.dnsCacheInserted,

     this.dnsCacheLiveFreed,

     this.dnsQueriesForwarded,

     this.dnsAuthAnswered,

     this.dnsLocalAnswered,

     this.dnsStaleAnswered,

     this.dnsUnanswered,

     this.bootp,

     this.pxe,

     this.dhcpAck,

     this.dhcpDecline,

     this.dhcpDiscover,

     this.dhcpInform,

     this.dhcpNak,

     this.dhcpOffer,

     this.dhcpRelease,

     this.dhcpRequest,

     this.noanswer,

     this.leasesAllocated4,

     this.leasesPruned4,

     this.leasesAllocated6,

     this.leasesPruned6,

     this.tcpConnections,

     this.dhcpLeasequery,

     this.dhcpLeaseUnassigned,

     this.dhcpLeaseActve,

     this.dhcpLeaseUnknown,

     this.dnssecMaxCryptoUse,

     this.dnssecMaxSigFail,

     this.dnssecMaxWork,
  });

      /// Number of inserted entries in DNS cache
  @JsonKey(
    
    name: r'dns_cache_inserted',
    required: false,
    includeIfNull: false,
  )


  final int? dnsCacheInserted;



      /// Number of freed live entries in DNS cache
  @JsonKey(
    
    name: r'dns_cache_live_freed',
    required: false,
    includeIfNull: false,
  )


  final int? dnsCacheLiveFreed;



      /// Number of forwarded DNS queries
  @JsonKey(
    
    name: r'dns_queries_forwarded',
    required: false,
    includeIfNull: false,
  )


  final int? dnsQueriesForwarded;



      /// Number of DNS queries for authoritative zones
  @JsonKey(
    
    name: r'dns_auth_answered',
    required: false,
    includeIfNull: false,
  )


  final int? dnsAuthAnswered;



      /// Number of DNS queries answered from local cache
  @JsonKey(
    
    name: r'dns_local_answered',
    required: false,
    includeIfNull: false,
  )


  final int? dnsLocalAnswered;



      /// Number of DNS queries answered from local cache (stale entries)
  @JsonKey(
    
    name: r'dns_stale_answered',
    required: false,
    includeIfNull: false,
  )


  final int? dnsStaleAnswered;



      /// Number of unanswered DNS queries
  @JsonKey(
    
    name: r'dns_unanswered',
    required: false,
    includeIfNull: false,
  )


  final int? dnsUnanswered;



      /// Number of BOOTP requests
  @JsonKey(
    
    name: r'bootp',
    required: false,
    includeIfNull: false,
  )


  final int? bootp;



      /// Number of PXE requests
  @JsonKey(
    
    name: r'pxe',
    required: false,
    includeIfNull: false,
  )


  final int? pxe;



      /// Number of DHCP ACK
  @JsonKey(
    
    name: r'dhcp_ack',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpAck;



      /// Number of DHCP DECLINE
  @JsonKey(
    
    name: r'dhcp_decline',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpDecline;



      /// Number of DHCP DISCOVER
  @JsonKey(
    
    name: r'dhcp_discover',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpDiscover;



      /// Number of DHCP INFORM
  @JsonKey(
    
    name: r'dhcp_inform',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpInform;



      /// Number of DHCP NAK
  @JsonKey(
    
    name: r'dhcp_nak',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpNak;



      /// Number of DHCP OFFER
  @JsonKey(
    
    name: r'dhcp_offer',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpOffer;



      /// Number of DHCP RELEASE
  @JsonKey(
    
    name: r'dhcp_release',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpRelease;



      /// Number of DHCP REQUEST
  @JsonKey(
    
    name: r'dhcp_request',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpRequest;



      /// Number of DHCP requests without answer (rapid commit)
  @JsonKey(
    
    name: r'noanswer',
    required: false,
    includeIfNull: false,
  )


  final int? noanswer;



      /// Number of allocated IPv4 leases
  @JsonKey(
    
    name: r'leases_allocated_4',
    required: false,
    includeIfNull: false,
  )


  final int? leasesAllocated4;



      /// Number of pruned IPv4 leases
  @JsonKey(
    
    name: r'leases_pruned_4',
    required: false,
    includeIfNull: false,
  )


  final int? leasesPruned4;



      /// Number of allocated IPv6 leases
  @JsonKey(
    
    name: r'leases_allocated_6',
    required: false,
    includeIfNull: false,
  )


  final int? leasesAllocated6;



      /// Number of pruned IPv6 leases
  @JsonKey(
    
    name: r'leases_pruned_6',
    required: false,
    includeIfNull: false,
  )


  final int? leasesPruned6;



      /// Number of dedicated TCP workers
  @JsonKey(
    
    name: r'tcp_connections',
    required: false,
    includeIfNull: false,
  )


  final int? tcpConnections;



      /// Number of DHCP lease queries
  @JsonKey(
    
    name: r'dhcp_leasequery',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpLeasequery;



      /// Number of DHCP lease unassigned
  @JsonKey(
    
    name: r'dhcp_lease_unassigned',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpLeaseUnassigned;



      /// Number of DHCP lease active
  @JsonKey(
    
    name: r'dhcp_lease_actve',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpLeaseActve;



      /// Number of DHCP lease unknown
  @JsonKey(
    
    name: r'dhcp_lease_unknown',
    required: false,
    includeIfNull: false,
  )


  final int? dhcpLeaseUnknown;



      /// DNSSEC per-query crypto work HWM
  @JsonKey(
    
    name: r'dnssec_max_crypto_use',
    required: false,
    includeIfNull: false,
  )


  final int? dnssecMaxCryptoUse;



      /// DNSSEC per-RRSet signature fails HWM
  @JsonKey(
    
    name: r'dnssec_max_sig_fail',
    required: false,
    includeIfNull: false,
  )


  final int? dnssecMaxSigFail;



      /// DNSSEC per-query subqueries HWM
  @JsonKey(
    
    name: r'dnssec_max_work',
    required: false,
    includeIfNull: false,
  )


  final int? dnssecMaxWork;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtlDnsmasq &&
      other.dnsCacheInserted == dnsCacheInserted &&
      other.dnsCacheLiveFreed == dnsCacheLiveFreed &&
      other.dnsQueriesForwarded == dnsQueriesForwarded &&
      other.dnsAuthAnswered == dnsAuthAnswered &&
      other.dnsLocalAnswered == dnsLocalAnswered &&
      other.dnsStaleAnswered == dnsStaleAnswered &&
      other.dnsUnanswered == dnsUnanswered &&
      other.bootp == bootp &&
      other.pxe == pxe &&
      other.dhcpAck == dhcpAck &&
      other.dhcpDecline == dhcpDecline &&
      other.dhcpDiscover == dhcpDiscover &&
      other.dhcpInform == dhcpInform &&
      other.dhcpNak == dhcpNak &&
      other.dhcpOffer == dhcpOffer &&
      other.dhcpRelease == dhcpRelease &&
      other.dhcpRequest == dhcpRequest &&
      other.noanswer == noanswer &&
      other.leasesAllocated4 == leasesAllocated4 &&
      other.leasesPruned4 == leasesPruned4 &&
      other.leasesAllocated6 == leasesAllocated6 &&
      other.leasesPruned6 == leasesPruned6 &&
      other.tcpConnections == tcpConnections &&
      other.dhcpLeasequery == dhcpLeasequery &&
      other.dhcpLeaseUnassigned == dhcpLeaseUnassigned &&
      other.dhcpLeaseActve == dhcpLeaseActve &&
      other.dhcpLeaseUnknown == dhcpLeaseUnknown &&
      other.dnssecMaxCryptoUse == dnssecMaxCryptoUse &&
      other.dnssecMaxSigFail == dnssecMaxSigFail &&
      other.dnssecMaxWork == dnssecMaxWork;

    @override
    int get hashCode =>
        dnsCacheInserted.hashCode +
        dnsCacheLiveFreed.hashCode +
        dnsQueriesForwarded.hashCode +
        dnsAuthAnswered.hashCode +
        dnsLocalAnswered.hashCode +
        dnsStaleAnswered.hashCode +
        dnsUnanswered.hashCode +
        bootp.hashCode +
        pxe.hashCode +
        dhcpAck.hashCode +
        dhcpDecline.hashCode +
        dhcpDiscover.hashCode +
        dhcpInform.hashCode +
        dhcpNak.hashCode +
        dhcpOffer.hashCode +
        dhcpRelease.hashCode +
        dhcpRequest.hashCode +
        noanswer.hashCode +
        leasesAllocated4.hashCode +
        leasesPruned4.hashCode +
        leasesAllocated6.hashCode +
        leasesPruned6.hashCode +
        tcpConnections.hashCode +
        dhcpLeasequery.hashCode +
        dhcpLeaseUnassigned.hashCode +
        dhcpLeaseActve.hashCode +
        dhcpLeaseUnknown.hashCode +
        dnssecMaxCryptoUse.hashCode +
        dnssecMaxSigFail.hashCode +
        dnssecMaxWork.hashCode;

  factory FtlFtlDnsmasq.fromJson(Map<String, dynamic> json) => _$FtlFtlDnsmasqFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlDnsmasqToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

