import 'package:pi_hole_client/data/services/api/model/v5/over_time_data.dart'
    as s;
import 'package:pi_hole_client/domain/models/metrics/clients.dart' as d;
import 'package:pi_hole_client/domain/models/metrics/history.dart' as d;
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
