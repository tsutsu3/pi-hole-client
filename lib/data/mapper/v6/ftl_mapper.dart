import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v6/ftl/client.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/ftl.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/host.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/messages.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/metrics.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/sensors.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/system.dart' as s;
import 'package:pi_hole_client/data/model/v6/ftl/version.dart' as s;
import 'package:pi_hole_client/domain/model/ftl/client.dart' as d;
import 'package:pi_hole_client/domain/model/ftl/ftl.dart' as d;
import 'package:pi_hole_client/domain/model/ftl/host.dart' as d;
import 'package:pi_hole_client/domain/model/ftl/message.dart' as d;
import 'package:pi_hole_client/domain/model/ftl/metrics.dart' as d;
import 'package:pi_hole_client/domain/model/ftl/sensor.dart' as d;
import 'package:pi_hole_client/domain/model/ftl/system.dart' as d;
import 'package:pi_hole_client/domain/model/ftl/version.dart' as d;

extension InfoVersionMapper on s.InfoVersion {
  d.FtlVersion toDomain() {
    return d.FtlVersion(
      core: d.ComponentVersion(
        local: d.VersionDetail(
          version: version.core.local.version ?? '',
          branch: version.core.local.branch,
        ),
        remote: d.VersionDetail(version: version.core.remote.version ?? ''),
        canUpdate: _canUpdate(
          version.core.local.version,
          version.core.remote.version,
        ),
      ),
      web: d.ComponentVersion(
        local: d.VersionDetail(
          version: version.web.local.version ?? '',
          branch: version.web.local.branch,
        ),
        remote: d.VersionDetail(version: version.web.remote.version ?? ''),
        canUpdate: _canUpdate(
          version.web.local.version,
          version.web.remote.version,
        ),
      ),
      ftl: d.ComponentVersion(
        local: d.VersionDetail(
          version: version.ftl.local.version ?? '',
          branch: version.ftl.local.branch,
        ),
        remote: d.VersionDetail(version: version.ftl.remote.version ?? ''),
        canUpdate: _canUpdate(
          version.ftl.local.version,
          version.ftl.remote.version,
        ),
      ),
      docker: d.ComponentVersion(
        local: d.VersionDetail(version: version.docker.local ?? ''),
        remote: d.VersionDetail(version: version.docker.remote ?? ''),
        canUpdate: _canUpdate(version.docker.local, version.docker.remote),
      ),
    );
  }

  bool _canUpdate(String? local, String? remote) {
    if (local == null || remote == null) {
      return false;
    }
    return local != remote;
  }
}

extension InfoSensorsMapper on s.InfoSensors {
  d.FtlSensor toDomain() {
    return d.FtlSensor(
      hotLimit: sensors.hotLimit,
      unit: sensors.unit,
      cpuTemp: sensors.cpuTemp,
    );
  }
}

extension InfoClientMapper on s.InfoClient {
  d.FtlClient toDomain() {
    return d.FtlClient(addr: remoteAddr);
  }
}

extension InfoMessagesMapper on s.InfoMessages {
  List<d.FtlMessage> toDomain() {
    return messages
        .map(
          (message) => _tryParsePlain(
            id: message.id,
            timestamp: message.timestamp,
            plain: message.plain,
          ),
        )
        .nonNulls
        .toList();
  }

  d.FtlMessage? _tryParsePlain({
    required int id,
    required int timestamp,
    required String plain,
  }) {
    // Ref: pi-hole/FTL src/database/message-table.c: format_inaccessible_adlist_message
    final regex = RegExp(
      r'List with ID (\d+) \((.+)\) was inaccessible during last gravity run',
    );
    final match = regex.firstMatch(plain);
    if (match == null) return null;

    final listId = match.group(1);
    final listUrl = match.group(2);

    return d.FtlMessage(
      id: id,
      timestamp: DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
      message: 'List with ID $listId was inaccessible during last gravity run',
      url: listUrl ?? '',
    );
  }
}

extension InfoHostMapper on s.InfoHost {
  d.FtlHost toDomain() {
    return d.FtlHost(
      domainName: host.uname.domainname,
      arch: host.uname.machine,
      hostName: host.uname.nodename,
      release: host.uname.release,
      sysName: host.uname.sysname,
      version: host.uname.version,
      model: host.model,
    );
  }
}

extension InfoFtlMapper on s.InfoFtl {
  d.FtlInfo toDomain() {
    return d.FtlInfo(privacyLevel: ftl.privacyLevel);
  }
}

extension InfoMetricsMapper on s.InfoMetrics {
  d.FtlDnsMetrics toDomain() {
    return d.FtlDnsMetrics(
      cache: metrics.dns.cache.toDomain(),
      replies: metrics.dns.replies.toDomain(),
    );
  }
}

extension DnsCacheMapper on s.DnsCache {
  d.DnsCache toDomain() {
    return d.DnsCache(
      size: size,
      records: _calculateRecords(content),
      inserted: inserted,
      evicted: evicted,
      expired: expired,
      immortal: immortal,
      typePercentages: _calculateTypePercentages(content, size),
    );
  }

  int _calculateRecords(List<s.DnsCacheEntry> entries) {
    return entries.fold(
      0,
      (total, item) => total + item.count.valid + item.count.stale,
    );
  }

  List<d.DnsTypePercentage> _calculateTypePercentages(
    List<s.DnsCacheEntry> entries,
    int size,
  ) {
    final percentages = <d.DnsTypePercentage>[];

    for (final item in entries) {
      final valid = item.count.valid;
      final stale = item.count.stale;
      final name = item.name;

      if (size > 0) {
        percentages.add(
          d.DnsTypePercentage(
            type: convertDnsRecordType(name),
            isStale: false,
            percentage: (valid / size) * 100,
          ),
        );
        percentages.add(
          d.DnsTypePercentage(
            type: convertDnsRecordType(name),
            isStale: true,
            percentage: (stale / size) * 100,
          ),
        );
      } else {
        percentages.add(
          d.DnsTypePercentage(
            type: convertDnsRecordType(name),
            isStale: false,
            percentage: 0.0,
          ),
        );
        percentages.add(
          d.DnsTypePercentage(
            type: convertDnsRecordType(name),
            isStale: true,
            percentage: 0.0,
          ),
        );
      }
    }
    final total = percentages.fold(0.0, (sum, item) => sum + item.percentage);
    percentages.add(
      d.DnsTypePercentage(
        type: convertDnsRecordType('empty'),
        isStale: false,
        percentage: (100.0 - total).clamp(0.0, 100.0),
      ),
    );

    return percentages;
  }
}

extension DnsRepliesMapper on s.DnsReplies {
  d.DnsReplies toDomain() {
    return d.DnsReplies(
      forwarded: forwarded,
      unanswered: unanswered,
      local: local,
      optimized: optimized,
      auth: auth,
      sum: sum,
    );
  }
}

extension InfoSystemMapper on s.InfoSystem {
  d.FtlSystem toDomain() {
    return d.FtlSystem(
      uptime: system.uptime,
      ramUsage: system.memory.ram.percentUsed,
      cpuUsage: system.cpu.percentCpu ?? _average(system.cpu.load.percent),
    );
  }

  double _average(List<double> list) {
    if (list.isEmpty) return 0.0;
    return list.reduce((a, b) => a + b) / list.length;
  }
}
