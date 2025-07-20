import 'dart:convert';

import 'package:pi_hole_client/data/services/gateways/v6/models/dns/dns.dart';
import 'package:pi_hole_client/data/services/gateways/v6/models/ftl/ftl.dart';
import 'package:pi_hole_client/data/services/gateways/v6/models/metrics/stats.dart';
import 'package:pi_hole_client/utils/charts_data_functions.dart';

RealtimeStatus realtimeStatusFromJson(String str) =>
    RealtimeStatus.fromJson(json.decode(str));

class RealtimeStatus {
  RealtimeStatus({
    required this.domainsBeingBlocked,
    required this.dnsQueriesToday,
    required this.adsBlockedToday,
    required this.adsPercentageToday,
    required this.uniqueDomains,
    required this.queriesForwarded,
    required this.queriesCached,
    required this.clientsEverSeen,
    required this.uniqueClients,
    required this.dnsQueriesAllTypes,
    required this.replyUnknown,
    required this.replyNodata,
    required this.replyNxdomain,
    required this.replyCname,
    required this.replyIp,
    required this.replyDomain,
    required this.replyRrname,
    required this.replyServfail,
    required this.replyRefused,
    required this.replyNotimp,
    required this.replyOther,
    required this.replyDnssec,
    required this.replyNone,
    required this.replyBlob,
    required this.dnsQueriesAllReplies,
    required this.privacyLevel,
    required this.status,
    required this.topQueries,
    required this.topAds,
    required this.topSources,
    required this.topSourcesBlocked,
    required this.forwardDestinations,
    required this.queryTypes,
  });

  factory RealtimeStatus.fromJson(Map<String, dynamic> json) => RealtimeStatus(
        domainsBeingBlocked: json['domains_being_blocked'],
        dnsQueriesToday: json['dns_queries_today'],
        adsBlockedToday: json['ads_blocked_today'],
        adsPercentageToday: json['ads_percentage_today'].toDouble(),
        uniqueDomains: json['unique_domains'],
        queriesForwarded: json['queries_forwarded'],
        queriesCached: json['queries_cached'],
        clientsEverSeen: json['clients_ever_seen'],
        uniqueClients: json['unique_clients'],
        dnsQueriesAllTypes: json['dns_queries_all_types'],
        replyUnknown: json['reply_UNKNOWN'],
        replyNodata: json['reply_NODATA'],
        replyNxdomain: json['reply_NXDOMAIN'],
        replyCname: json['reply_CNAME'],
        replyIp: json['reply_IP'],
        replyDomain: json['reply_DOMAIN'],
        replyRrname: json['reply_RRNAME'],
        replyServfail: json['reply_SERVFAIL'],
        replyRefused: json['reply_REFUSED'],
        replyNotimp: json['reply_NOTIMP'],
        replyOther: json['reply_OTHER'],
        replyDnssec: json['reply_DNSSEC'],
        replyNone: json['reply_NONE'],
        replyBlob: json['reply_BLOB'],
        dnsQueriesAllReplies: json['dns_queries_all_replies'],
        privacyLevel: json['privacy_level'],
        status: json['status'],
        topQueries: (json['top_queries'] is Map<String, dynamic> &&
                json['top_queries'] != null)
            ? Map.from(json['top_queries'])
                .map((k, v) => MapEntry<String, int>(k, v))
            : {},
        topAds:
            (json['top_ads'] is Map<String, dynamic> && json['top_ads'] != null)
                ? Map.from(json['top_ads'])
                    .map((k, v) => MapEntry<String, int>(k, v))
                : {},
        topSources: (json['top_sources'] is Map<String, dynamic> &&
                json['top_sources'] != null)
            ? Map.from(json['top_sources'])
                .map((k, v) => MapEntry<String, int>(k, v))
            : {},
        topSourcesBlocked:
            (json['top_sources_blocked'] is Map<String, dynamic> &&
                    json['top_sources_blocked'] != null)
                ? Map.from(json['top_sources_blocked'])
                    .map((k, v) => MapEntry<String, int>(k, v))
                : {},
        forwardDestinations: (json['forward_destinations']
                    is Map<String, dynamic> &&
                json['forward_destinations'] != null)
            ? sortValues(
                removeZeroValues(
                  Map.from(json['forward_destinations'])
                      .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
                ),
              )
            : {},
        queryTypes: (json['querytypes'] is Map<String, dynamic> &&
                json['querytypes'] != null)
            ? sortValues(
                removeZeroValues(
                  Map.from(json['querytypes'])
                      .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
                ),
              )
            : {},
      );

  factory RealtimeStatus.fromV6(
    StatsSummary summary,
    InfoFtl infoFtl,
    Blocking blocking,
    StatsTopDomains topPermittedDomains,
    StatsTopDomains topBlockedDomains,
    StatsTopClients topClients,
    StatsTopClients topClientsBlocked,
    StatsUpstreams upstreams,
  ) {
    // Calculate the percentage of each query type
    final totalQueryTypes =
        summary.queries.types.toJson().values.reduce((a, b) => a + b);
    final queryTypes = sortValues(
      removeZeroValues(
        summary.queries.types.toJson().map(
              (key, value) => MapEntry(key, (value / totalQueryTypes) * 100),
            ),
      ),
    );

    final topQueries = topPermittedDomains.domains.isNotEmpty
        ? Map.fromEntries(
            topPermittedDomains.domains.map(
              (domain) => MapEntry<String, int>(domain.domain, domain.count),
            ),
          )
        : <String, int>{};

    final topAds = topBlockedDomains.domains.isNotEmpty
        ? Map.fromEntries(
            topBlockedDomains.domains.map(
              (domain) => MapEntry<String, int>(domain.domain, domain.count),
            ),
          )
        : <String, int>{};

    final topSources = topClients.clients.isNotEmpty
        ? Map.fromEntries(
            topClients.clients.map(
              (client) => MapEntry<String, int>(
                client.name.isNotEmpty
                    ? '${client.name}|${client.ip}'
                    : client.ip,
                client.count,
              ),
            ),
          )
        : <String, int>{};

    final topSourcesBlocked = topClientsBlocked.clients.isNotEmpty
        ? Map.fromEntries(
            topClientsBlocked.clients.map(
              (client) => MapEntry<String, int>(
                client.name.isNotEmpty
                    ? '${client.name}|${client.ip}'
                    : client.ip,
                client.count,
              ),
            ),
          )
        : <String, int>{};

    final totalForwardDestinations = upstreams.upstreams.isNotEmpty
        ? upstreams.upstreams
            .map((upstream) => upstream.count)
            .reduce((a, b) => a + b)
        : 0;
    final forwardDestinations = upstreams.upstreams.isNotEmpty
        ? sortValues(
            removeZeroValues(
              Map.fromEntries(
                upstreams.upstreams.map(
                  (upstream) => MapEntry<String, double>(
                    upstream.port == -1
                        ? '${upstream.name}|${upstream.ip}'
                        : '${upstream.name}#${upstream.port}|${upstream.ip}#${upstream.port}',
                    upstream.count / totalForwardDestinations * 100,
                  ),
                ),
              ),
            ),
          )
        : <String, double>{};

    // memo:
    // dnsQueriesAllTypes: v5 same as dnsQueriesToday number
    // dnsQueriesAllReplies: v5 same as dnsQueriesToday number
    return RealtimeStatus(
      domainsBeingBlocked: summary.gravity.domainsBeingBlocked,
      dnsQueriesToday: summary.queries.total,
      adsBlockedToday: summary.queries.blocked,
      adsPercentageToday: summary.queries.percentBlocked,
      uniqueDomains: summary.queries.uniqueDomains,
      queriesForwarded: summary.queries.forwarded,
      queriesCached: summary.queries.cached,
      clientsEverSeen: summary.clients.total,
      uniqueClients: summary.clients.active,
      dnsQueriesAllTypes: summary.queries.total,
      replyUnknown: summary.queries.replies.unknown,
      replyNodata: summary.queries.replies.nodata,
      replyNxdomain: summary.queries.replies.nxdomain,
      replyCname: summary.queries.replies.cname,
      replyIp: summary.queries.replies.ip,
      replyDomain: summary.queries.replies.domain,
      replyRrname: summary.queries.replies.rrname,
      replyServfail: summary.queries.replies.servfail,
      replyRefused: summary.queries.replies.refused,
      replyNotimp: summary.queries.replies.notimp,
      replyOther: summary.queries.replies.other,
      replyDnssec: summary.queries.replies.dnssec,
      replyNone: summary.queries.replies.none,
      replyBlob: summary.queries.replies.blob,
      dnsQueriesAllReplies: summary.queries.total,
      privacyLevel: infoFtl.ftl.privacyLevel,
      status: blocking.blocking,
      topQueries: topQueries,
      topAds: topAds,
      topSources: topSources,
      topSourcesBlocked: topSourcesBlocked,
      forwardDestinations: forwardDestinations,
      queryTypes: queryTypes,
    );
  }

  final int domainsBeingBlocked;
  final int dnsQueriesToday;
  final int adsBlockedToday;
  final double adsPercentageToday;
  final int uniqueDomains;
  final int queriesForwarded;
  final int queriesCached;
  final int clientsEverSeen;
  final int uniqueClients;
  final int dnsQueriesAllTypes;
  final int replyUnknown;
  final int replyNodata;
  final int replyNxdomain;
  final int replyCname;
  final int replyIp;
  final int replyDomain;
  final int replyRrname;
  final int replyServfail;
  final int replyRefused;
  final int replyNotimp;
  final int replyOther;
  final int replyDnssec;
  final int replyNone;
  final int replyBlob;
  final int dnsQueriesAllReplies;
  final int privacyLevel;
  final String status;
  final Map<String, int> topQueries;
  final Map<String, int> topAds;
  final Map<String, int> topSources;
  final Map<String, int> topSourcesBlocked;
  final Map<String, double> forwardDestinations;
  final Map<String, double> queryTypes;
}
