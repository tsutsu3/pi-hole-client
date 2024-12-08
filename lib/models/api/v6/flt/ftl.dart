import 'package:freezed_annotation/freezed_annotation.dart';

part 'ftl.freezed.dart';
part 'ftl.g.dart';

@freezed
class InfoFtl with _$InfoFtl {
  const factory InfoFtl({
    required Ftl ftl,
    required double took,
  }) = _InfoFtl;

  factory InfoFtl.fromJson(Map<String, dynamic> json) =>
      _$InfoFtlFromJson(json);
}

@freezed
class Ftl with _$Ftl {
  const factory Ftl({
    required Database database,
    @JsonKey(name: 'privacy_level') required int privacyLevel,
    required Clients clients,
    required int pid,
    required int uptime,
    @JsonKey(name: '%mem') required double memPercentage,
    @JsonKey(name: '%cpu') required double cpuPercentage,
    @JsonKey(name: 'allow_destructive') required bool allowDestructive,
    required Dnsmasq dnsmasq,
  }) = _Ftl;

  factory Ftl.fromJson(Map<String, dynamic> json) => _$FtlFromJson(json);
}

@freezed
class Database with _$Database {
  const factory Database({
    required int gravity,
    required int groups,
    required int lists,
    required int clients,
    required Domains domains,
  }) = _Database;

  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);
}

@freezed
class Domains with _$Domains {
  const factory Domains({
    required int allowed,
    required int denied,
  }) = _Domains;

  factory Domains.fromJson(Map<String, dynamic> json) =>
      _$DomainsFromJson(json);
}

@freezed
class Clients with _$Clients {
  const factory Clients({
    required int total,
    required int active,
  }) = _Clients;

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);
}

@freezed
class Dnsmasq with _$Dnsmasq {
  const factory Dnsmasq({
    @JsonKey(name: 'dns_cache_inserted') required int dnsCacheInserted,
    @JsonKey(name: 'dns_cache_live_freed') required int dnsCacheLiveFreed,
    @JsonKey(name: 'dns_queries_forwarded') required int dnsQueriesForwarded,
    @JsonKey(name: 'dns_auth_answered') required int dnsAuthAnswered,
    @JsonKey(name: 'dns_local_answered') required int dnsLocalAnswered,
    @JsonKey(name: 'dns_stale_answered') required int dnsStaleAnswered,
    @JsonKey(name: 'dns_unanswered') required int dnsUnanswered,
    @JsonKey(name: 'bootp') required int bootp,
    @JsonKey(name: 'pxe') required int pxe,
    @JsonKey(name: 'dhcp_ack') required int dhcpAck,
    @JsonKey(name: 'dhcp_decline') required int dhcpDecline,
    @JsonKey(name: 'dhcp_discover') required int dhcpDiscover,
    @JsonKey(name: 'dhcp_inform') required int dhcpInform,
    @JsonKey(name: 'dhcp_nak') required int dhcpNak,
    @JsonKey(name: 'dhcp_offer') required int dhcpOffer,
    @JsonKey(name: 'dhcp_release') required int dhcpRelease,
    @JsonKey(name: 'dhcp_request') required int dhcpRequest,
    @JsonKey(name: 'noanswer') required int noAnswer,
    @JsonKey(name: 'leases_allocated_4') required int leasesAllocated4,
    @JsonKey(name: 'leases_pruned_4') required int leasesPruned4,
    @JsonKey(name: 'leases_allocated_6') required int leasesAllocated6,
    @JsonKey(name: 'leases_pruned_6') required int leasesPruned6,
    @JsonKey(name: 'tcp_connections') required int tcpConnections,
    @JsonKey(name: 'dnssec_max_crypto_use') required int dnssecMaxCryptoUse,
    @JsonKey(name: 'dnssec_max_sig_fail') required int dnssecMaxSigFail,
    @JsonKey(name: 'dnssec_max_work') required int dnssecMaxWork,
  }) = _Dnsmasq;

  factory Dnsmasq.fromJson(Map<String, dynamic> json) =>
      _$DnsmasqFromJson(json);
}
