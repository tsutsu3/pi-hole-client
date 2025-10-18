import 'package:freezed_annotation/freezed_annotation.dart';

part 'ftl.freezed.dart';
part 'ftl.g.dart';

@freezed
sealed class InfoFtl with _$InfoFtl {
  @JsonSerializable(explicitToJson: true)
  const factory InfoFtl({required Ftl ftl, required double took}) = _InfoFtl;

  factory InfoFtl.fromJson(Map<String, dynamic> json) =>
      _$InfoFtlFromJson(json);
}

@freezed
sealed class Ftl with _$Ftl {
  @JsonSerializable(explicitToJson: true)
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
sealed class Database with _$Database {
  @JsonSerializable(explicitToJson: true)
  const factory Database({
    required int gravity,
    required int groups,
    required int lists,
    required int clients,
    required Domains domains,
    required Regex regex,
  }) = _Database;

  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);
}

@freezed
sealed class Domains with _$Domains {
  const factory Domains({
    @IntOrPairConverter() required IntOrPair allowed,
    @IntOrPairConverter() required IntOrPair denied,
  }) = _Domains;

  factory Domains.fromJson(Map<String, dynamic> json) =>
      _$DomainsFromJson(json);
}

@freezed
sealed class Regex with _$Regex {
  const factory Regex({
    @IntOrPairConverter() required IntOrPair allowed,
    @IntOrPairConverter() required IntOrPair denied,
  }) = _Regex;

  factory Regex.fromJson(Map<String, dynamic> json) => _$RegexFromJson(json);
}

@freezed
sealed class Clients with _$Clients {
  const factory Clients({required int total, required int active}) = _Clients;

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);
}

@freezed
sealed class Dnsmasq with _$Dnsmasq {
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

// ========== FTL v6.3+ ===========

/// FTL v6.3 or later only
@freezed
sealed class CountPair with _$CountPair {
  const factory CountPair({required int total, required int enabled}) =
      _CountPair;

  factory CountPair.fromJson(Map<String, dynamic> json) =>
      _$CountPairFromJson(json);
}

/// A union to absorb the dual types of v6.2 (int) or v6.3 (CountPair)
@freezed
sealed class IntOrPair with _$IntOrPair {
  const IntOrPair._();

  const factory IntOrPair.intValue(int value) = _IntValue;
  const factory IntOrPair.pairValue(CountPair pair) = _PairValue;

  /// Normalize and always return total/enabled (for domains)
  /// For v6.2 int, treating "total=enabled=value"
  CountPair asPair() => when(
    intValue: (v) => CountPair(total: v, enabled: v),
    pairValue: (p) => p,
  );

  int get total => asPair().total;
  int get enabled => asPair().enabled;
}

/// JSON <-> IntOrPair converter
class IntOrPairConverter implements JsonConverter<IntOrPair, Object?> {
  const IntOrPairConverter();

  @override
  IntOrPair fromJson(Object? json) {
    if (json is num) {
      // v6.2 style: int
      return IntOrPair.intValue(json.toInt());
    }

    if (json is Map<String, dynamic>) {
      // v6.3 style: { "total": 123, "enabled": 120 }
      final total = json['total'];
      final enabled = json['enabled'];

      if (total is num && enabled is num) {
        return IntOrPair.pairValue(
          CountPair(total: total.toInt(), enabled: enabled.toInt()),
        );
      }
    }

    // Fallback: should not happen
    return const IntOrPair.pairValue(CountPair(total: 0, enabled: 0));
  }

  @override
  Object? toJson(IntOrPair object) => object.when(
    // v6.2 int conversion to v6.3 map style
    intValue: (v) => {'total': v, 'enabled': v},
    pairValue: (p) => {'total': p.total, 'enabled': p.enabled},
  );
}
