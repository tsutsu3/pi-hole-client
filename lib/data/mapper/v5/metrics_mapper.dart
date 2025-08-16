import 'package:pi_hole_client/config/mapper.dart';
import 'package:pi_hole_client/data/model/v5/over_time_data.dart' as s;
import 'package:pi_hole_client/data/model/v5/queries.dart' as s;
import 'package:pi_hole_client/domain/model/metrics/clients.dart' as d;
import 'package:pi_hole_client/domain/model/metrics/history.dart' as d;
import 'package:pi_hole_client/domain/model/metrics/queries.dart' as d;
import 'package:pi_hole_client/domain/model/overtime/overtime.dart' as d;

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
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (int.tryParse(key) ?? 0) * 1000,
      ),
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
      time: DateTime.fromMillisecondsSinceEpoch(
        (int.tryParse(key) ?? 0) * 1000,
      ),
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
    final tsSec = _tryParseInt(_at(0));
    final type = _at(1);
    final url = _at(2);
    final device = _at(3);

    final status = _at(4);

    final replyIndex = _tryParseInt(_at(6));
    final replyType = convertReplyTypeV5(replyIndex);

    final replyTime = _tryParseBigInt(_at(7));

    final answeredBy = (status == '2') ? _at(10) : null;

    return d.Log(
      dateTime: DateTime.fromMillisecondsSinceEpoch((tsSec ?? 0) * 1000),
      type: convertDnsRecordTypeV5(type),
      url: url ?? '',
      device: device ?? '',
      replyTime: replyTime ?? BigInt.zero,
      status: convertQueryStatusTypeV5(_tryParseInt(status)),
      replyType: replyType,
      answeredBy: answeredBy,
    );
  }

  // ---- Helpers ----

  /// Safe element access: returns null when out of range.
  String? _at(int index) => (index >= 0 && index < length) ? this[index] : null;

  int? _tryParseInt(String? s) => (s == null) ? null : int.tryParse(s);

  BigInt? _tryParseBigInt(String? s) => (s == null) ? null : BigInt.tryParse(s);
}
