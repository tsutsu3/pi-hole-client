import 'package:pi_hole_client/config2/query_types.dart';
import 'package:pi_hole_client/models/api/v6/metrics/query.dart';

class LogsInfo {
  const LogsInfo({
    required this.logs,
    this.cursor,
    this.recordsTotal,
    this.recordsFiltered,
  });

  factory LogsInfo.fromJson(Map<String, dynamic> json) => LogsInfo(
        logs: (json['data'] as List<dynamic>)
            .map((log) => Log.fromJson(log as List<dynamic>))
            .toList(),
      );

  factory LogsInfo.fromV6(Queries queries) => LogsInfo(
        logs: queries.queries.map(Log.fromV6).toList(),
        cursor: queries.cursor,
        recordsTotal: queries.recordsTotal,
        recordsFiltered: queries.recordsFiltered,
      );

  final List<Log> logs;
  final int? cursor;
  final int? recordsTotal;
  final int? recordsFiltered;
}

class Log {
  const Log({
    required this.dateTime,
    required this.type,
    required this.url,
    required this.device,
    required this.status,
    required this.replyType,
    required this.replyTime,
    this.answeredBy,
    this.id,
  });

  factory Log.fromJson(List<dynamic> data) => Log(
        dateTime:
            DateTime.fromMillisecondsSinceEpoch((int.parse(data[0])) * 1000),
        type: data[1],
        url: data[2],
        device: data[3],
        status: data[4],
        replyType: data[6] != null ? replyTypes[int.parse(data[6])] : null,
        replyTime: BigInt.parse(data[7]),
        answeredBy: data[4] == '2'
            ? data.length >= 10
                ? data[10]
                : null
            : null,
      );

  factory Log.fromV6(Query query) {
    return Log(
      id: query.id,
      //double to int
      dateTime:
          DateTime.fromMillisecondsSinceEpoch((query.time * 1000).toInt()),
      type: query.type,
      url: query.domain,
      device: query.client.name ?? query.client.ip,
      status: queryStatusesV6
          .firstWhere((status) => status.key == query.status)
          .index
          .toString(), // TODO: Use query.status
      replyType: query.reply.type,
      replyTime: BigInt.from(query.reply.time * 1000 * 10),
      answeredBy: query.upstream,
    );
  }

  final int? id;
  final DateTime dateTime;
  final String type;
  final String url;
  final String device;
  final String? status;
  final String? replyType;
  final BigInt replyTime;
  final String? answeredBy;

  static const List<String> replyTypes = [
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

  //toJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'dateTime': dateTime.toUtc().toIso8601String(),
        'type': type,
        'url': url,
        'device': device,
        'status': status,
        'replyType': replyType,
        'replyTime': replyTime.toString(),
        'answeredBy': answeredBy,
      };
}
