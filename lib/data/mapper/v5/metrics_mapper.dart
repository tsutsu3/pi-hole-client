import 'package:pi_hole_client/data/services/api/model/v5/over_time_data.dart'
    as s;
import 'package:pi_hole_client/data/services/api/model/v5/queries.dart' as s;
import 'package:pi_hole_client/domain/models/metrics/clients.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/history.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/queries.dart' as d;
import 'package:pi_hole_client/domain/models/overtime/overtime.dart' as d;

extension OverTimeDataMapper on s.OverTimeData {
  d.OverTime toDomain() {
    return d.OverTime(
      domainsOverTime: domainsOverTime.entries
          .map((e) => e.toDomain())
          .toList(),
      adsOverTime: adsOverTime.entries.map((e) => e.toDomain()).toList(),
      clients: clients.map((client) => client.toDomain()).toList(),
      overTime: overTime.entries.map((e) => e.toDomain()).toList(),
    );
  }
}

extension HistoryEntryMapper on MapEntry<String, int> {
  d.HistoryEntry toDomain() {
    return d.HistoryEntry(
      timestamp: DateTime.fromMillisecondsSinceEpoch(int.parse(key) * 1000),
      count: value,
    );
  }
}

extension ClientMapper on s.Client {
  d.Client toDomain() {
    return d.Client(name: name, ip: ip);
  }
}

extension ClientOverTimeEntryMapper on MapEntry<String, List<int>> {
  d.ClientOverTimeEntry toDomain() {
    return d.ClientOverTimeEntry(
      time: DateTime.fromMillisecondsSinceEpoch(int.parse(key) * 1000),
      values: value,
    );
  }
}

extension QueriesMapper on s.Queries {
  d.Logs toDomain() {
    return d.Logs(logs: data.map((log) => log.toDomain()).toList());
  }
}

extension LogMapper on List<String> {
  d.Log toDomain() {
    return d.Log(
      dateTime: DateTime.fromMillisecondsSinceEpoch(int.parse(this[0]) * 1000),
      type: this[1],
      url: this[2],
      device: this[3],
      status: this[4],
      replyType: _replyTypes[int.parse(this[6])],
      replyTime: BigInt.parse(this[7]),
      answeredBy: this[4] == '2'
          ? length >= 10
                ? this[10]
                : null
          : null,
    );
  }

  List<String> get _replyTypes => [
    'N/A',
    'NODATA',
    'NXDOMAIN',
    'CNAME',
    'IP',
    'DOMAIN',
    'RRNAME',
    'SERVFAIL',
    'REFUSED',
    'NOTIMP',
    'upstream error',
    'DNSSEC',
    'NONE',
    'BLOB',
  ];
}
