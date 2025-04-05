import 'package:pi_hole_client/constants/query_types.dart';
import 'package:pi_hole_client/models/api/v6/metrics/query.dart';

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
