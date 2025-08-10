import 'package:pi_hole_client/config/query_types.dart';
import 'package:pi_hole_client/data/services/api/model/v6/metrics/history.dart'
    as sh;
import 'package:pi_hole_client/data/services/api/model/v6/metrics/query.dart'
    as sq;
import 'package:pi_hole_client/data/services/api/model/v6/metrics/stats.dart'
    as ss;
import 'package:pi_hole_client/domain/models/metrics/clients.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/history.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/queries.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/summary.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/top_clients.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/top_domains.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/upstreams.dart' as d;

extension HistoryMapper on sh.History {
  d.History toDomain() {
    return d.History(
      domainsOverTime: history.map((e) => e.toAllowDomain()).toList(),
      adsOverTime: history.map((e) => e.toBlockDomain()).toList(),
    );
  }
}

extension HistoryDataMapper on sh.HistoryData {
  d.HistoryEntry toAllowDomain() {
    return d.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(timestamp.toInt() * 1000),
      count: total,
    );
  }

  d.HistoryEntry toBlockDomain() {
    return d.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(timestamp.toInt() * 1000),
      count: blocked,
    );
  }
}

// extension ClientsMapper on s.HistoryClients {
//   d.Clients toDomain() {
//     return d.Clients(
//       history: history.map((e) => e.toDomain()).toList(),
//       clients: clients.map((e) => e.toDomain()).toList(),
//     );
//   }
// }

// extension ClientMapper on s.Client {
//   d.Client toDomain() {
//     return d.Client(name: name ?? '', ip: ip);
//   }
// }

// extension HistoryClientsMapper on s.HistoryClients {
//   d.Client toDomain() {
//     return d.HistoryClients(
//       history: history.map((e) => e.toDomain()).toList(),
//       clients: clients.map((e) => e.toDomain()).toList(),
//     );
//   }
// }

extension QueriesMapper on sq.Queries {
  d.Logs toDomain() {
    return d.Logs(
      logs: queries.map((e) => e.toDomain()).toList(),
      cursor: cursor,
      recordsTotal: recordsTotal,
      recordsFiltered: recordsFiltered,
    );
  }
}

extension QueryMapper on sq.Query {
  d.Log toDomain() {
    return d.Log(
      dateTime: DateTime.fromMillisecondsSinceEpoch(time.toInt() * 1000),
      type: type,
      url: domain,
      device: client.name ?? client.ip,
      status: queryStatusesV6
          .firstWhere((s) => s.key == status)
          .index
          .toString(),
      replyTime: BigInt.from(reply.time * 1000 * 10),
      replyType: reply.type,
      id: id,
      answeredBy: upstream,
    );
  }
}

extension StatsSummaryMapper on ss.StatsSummary {
  d.Summary toDomain() {
    return d.Summary(
      domainsBeingBlocked: gravity.domainsBeingBlocked,
      dnsQueriesToday: queries.total,
      adsBlockedToday: queries.blocked,
      adsPercentageToday: queries.percentBlocked,
      uniqueDomains: queries.uniqueDomains,
      queriesForwarded: queries.forwarded,
      queriesCached: queries.cached,
      clientsEverSeen: clients.total,
      uniqueClients: clients.active,
      dnsQueriesAllTypes: queries.total,
      replyUnknown: queries.replies.unknown,
      replyNodata: queries.replies.nodata,
      replyNxdomain: queries.replies.nxdomain,
      replyCname: queries.replies.cname,
      replyIp: queries.replies.ip,
      replyDomain: queries.replies.domain,
      replyRrname: queries.replies.rrname,
      replyServfail: queries.replies.servfail,
      replyRefused: queries.replies.refused,
      replyNotimp: queries.replies.notimp,
      replyOther: queries.replies.other,
      replyDnssec: queries.replies.dnssec,
      replyNone: queries.replies.none,
      replyBlob: queries.replies.blob,
      dnsQueriesAllReplies: queries.total,
      queryTypes: queries.types.toDomain(),
    );
  }
}

extension TypesMapper on ss.Types {
  List<d.QueryTypeStat> toDomain() {
    final total = toJson().values.reduce((a, b) => a + b);
    return toJson().entries.map((e) {
      return d.QueryTypeStat(
        type: e.key,
        percentage: total > 0 ? e.value / total * 100 : 0.0,
      );
    }).toList();
  }
}

extension StatsUpstreamsMapper on ss.StatsUpstreams {
  List<d.DestinationStat> toDomain() {
    if (upstreams.isEmpty) return [];

    final total = upstreams
        .map((upstream) => upstream.count)
        .reduce((a, b) => a + b);

    return upstreams.map((upstream) {
      final destination = upstream.port == -1
          ? '${upstream.name}|${upstream.ip}'
          : '${upstream.name}#${upstream.port}|${upstream.ip}#${upstream.port}';

      final percentage = total == 0.0 ? 0.0 : (upstream.count / total) * 100.0;

      return d.DestinationStat(
        destination: destination,
        percentage: percentage,
      );
    }).toList();
  }
}

extension DomainMapper on ss.Domain {
  d.QueryStat toDomain() {
    return d.QueryStat(domain: domain, count: count);
  }
}

extension ClientMapper on ss.Client {
  d.SourceStat toDomain() {
    return d.SourceStat(
      source: name.isNotEmpty ? '$name|$ip' : ip,
      count: count,
    );
  }
}

extension HistoryClientsMapper on sh.HistoryClients {
  d.Clients toDomain() {
    return d.Clients(clients: clients.toDomain(), overTime: history.toDomain());
  }
}

extension MapStringClientMapper on Map<String, sh.Client> {
  List<d.Client> toDomain() {
    return entries.map((entry) {
      return d.Client(name: entry.value.name ?? '', ip: entry.key);
    }).toList();
  }
}

// TODO: Is it sorted? Should it be stored as a Map instead of a List?
extension ListHistoryEntryMapper on List<sh.HistoryEntry> {
  List<d.ClientOverTimeEntry> toDomain() {
    return map((entry) {
      return d.ClientOverTimeEntry(
        time: DateTime.fromMillisecondsSinceEpoch(
          entry.timestamp.toInt() * 1000,
        ),
        values: entry.data.values.toList(),
      );
    }).toList();
  }
}
