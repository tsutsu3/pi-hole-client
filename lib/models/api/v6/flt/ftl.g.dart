// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfoFtlImpl _$$InfoFtlImplFromJson(Map<String, dynamic> json) =>
    _$InfoFtlImpl(
      ftl: Ftl.fromJson(json['ftl'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$InfoFtlImplToJson(_$InfoFtlImpl instance) =>
    <String, dynamic>{
      'ftl': instance.ftl,
      'took': instance.took,
    };

_$FtlImpl _$$FtlImplFromJson(Map<String, dynamic> json) => _$FtlImpl(
      database: Database.fromJson(json['database'] as Map<String, dynamic>),
      privacyLevel: (json['privacy_level'] as num).toInt(),
      clients: Clients.fromJson(json['clients'] as Map<String, dynamic>),
      pid: (json['pid'] as num).toInt(),
      uptime: (json['uptime'] as num).toInt(),
      memPercentage: (json['%mem'] as num).toDouble(),
      cpuPercentage: (json['%cpu'] as num).toDouble(),
      allowDestructive: json['allow_destructive'] as bool,
      dnsmasq: Dnsmasq.fromJson(json['dnsmasq'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FtlImplToJson(_$FtlImpl instance) => <String, dynamic>{
      'database': instance.database,
      'privacy_level': instance.privacyLevel,
      'clients': instance.clients,
      'pid': instance.pid,
      'uptime': instance.uptime,
      '%mem': instance.memPercentage,
      '%cpu': instance.cpuPercentage,
      'allow_destructive': instance.allowDestructive,
      'dnsmasq': instance.dnsmasq,
    };

_$DatabaseImpl _$$DatabaseImplFromJson(Map<String, dynamic> json) =>
    _$DatabaseImpl(
      gravity: (json['gravity'] as num).toInt(),
      groups: (json['groups'] as num).toInt(),
      lists: (json['lists'] as num).toInt(),
      clients: (json['clients'] as num).toInt(),
      domains: Domains.fromJson(json['domains'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DatabaseImplToJson(_$DatabaseImpl instance) =>
    <String, dynamic>{
      'gravity': instance.gravity,
      'groups': instance.groups,
      'lists': instance.lists,
      'clients': instance.clients,
      'domains': instance.domains,
    };

_$DomainsImpl _$$DomainsImplFromJson(Map<String, dynamic> json) =>
    _$DomainsImpl(
      allowed: (json['allowed'] as num).toInt(),
      denied: (json['denied'] as num).toInt(),
    );

Map<String, dynamic> _$$DomainsImplToJson(_$DomainsImpl instance) =>
    <String, dynamic>{
      'allowed': instance.allowed,
      'denied': instance.denied,
    };

_$ClientsImpl _$$ClientsImplFromJson(Map<String, dynamic> json) =>
    _$ClientsImpl(
      total: (json['total'] as num).toInt(),
      active: (json['active'] as num).toInt(),
    );

Map<String, dynamic> _$$ClientsImplToJson(_$ClientsImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
    };

_$DnsmasqImpl _$$DnsmasqImplFromJson(Map<String, dynamic> json) =>
    _$DnsmasqImpl(
      dnsCacheInserted: (json['dns_cache_inserted'] as num).toInt(),
      dnsCacheLiveFreed: (json['dns_cache_live_freed'] as num).toInt(),
      dnsQueriesForwarded: (json['dns_queries_forwarded'] as num).toInt(),
      dnsAuthAnswered: (json['dns_auth_answered'] as num).toInt(),
      dnsLocalAnswered: (json['dns_local_answered'] as num).toInt(),
      dnsStaleAnswered: (json['dns_stale_answered'] as num).toInt(),
      dnsUnanswered: (json['dns_unanswered'] as num).toInt(),
      bootp: (json['bootp'] as num).toInt(),
      pxe: (json['pxe'] as num).toInt(),
      dhcpAck: (json['dhcp_ack'] as num).toInt(),
      dhcpDecline: (json['dhcp_decline'] as num).toInt(),
      dhcpDiscover: (json['dhcp_discover'] as num).toInt(),
      dhcpInform: (json['dhcp_inform'] as num).toInt(),
      dhcpNak: (json['dhcp_nak'] as num).toInt(),
      dhcpOffer: (json['dhcp_offer'] as num).toInt(),
      dhcpRelease: (json['dhcp_release'] as num).toInt(),
      dhcpRequest: (json['dhcp_request'] as num).toInt(),
      noAnswer: (json['noanswer'] as num).toInt(),
      leasesAllocated4: (json['leases_allocated_4'] as num).toInt(),
      leasesPruned4: (json['leases_pruned_4'] as num).toInt(),
      leasesAllocated6: (json['leases_allocated_6'] as num).toInt(),
      leasesPruned6: (json['leases_pruned_6'] as num).toInt(),
      tcpConnections: (json['tcp_connections'] as num).toInt(),
      dnssecMaxCryptoUse: (json['dnssec_max_crypto_use'] as num).toInt(),
      dnssecMaxSigFail: (json['dnssec_max_sig_fail'] as num).toInt(),
      dnssecMaxWork: (json['dnssec_max_work'] as num).toInt(),
    );

Map<String, dynamic> _$$DnsmasqImplToJson(_$DnsmasqImpl instance) =>
    <String, dynamic>{
      'dns_cache_inserted': instance.dnsCacheInserted,
      'dns_cache_live_freed': instance.dnsCacheLiveFreed,
      'dns_queries_forwarded': instance.dnsQueriesForwarded,
      'dns_auth_answered': instance.dnsAuthAnswered,
      'dns_local_answered': instance.dnsLocalAnswered,
      'dns_stale_answered': instance.dnsStaleAnswered,
      'dns_unanswered': instance.dnsUnanswered,
      'bootp': instance.bootp,
      'pxe': instance.pxe,
      'dhcp_ack': instance.dhcpAck,
      'dhcp_decline': instance.dhcpDecline,
      'dhcp_discover': instance.dhcpDiscover,
      'dhcp_inform': instance.dhcpInform,
      'dhcp_nak': instance.dhcpNak,
      'dhcp_offer': instance.dhcpOffer,
      'dhcp_release': instance.dhcpRelease,
      'dhcp_request': instance.dhcpRequest,
      'noanswer': instance.noAnswer,
      'leases_allocated_4': instance.leasesAllocated4,
      'leases_pruned_4': instance.leasesPruned4,
      'leases_allocated_6': instance.leasesAllocated6,
      'leases_pruned_6': instance.leasesPruned6,
      'tcp_connections': instance.tcpConnections,
      'dnssec_max_crypto_use': instance.dnssecMaxCryptoUse,
      'dnssec_max_sig_fail': instance.dnssecMaxSigFail,
      'dnssec_max_work': instance.dnssecMaxWork,
    };
