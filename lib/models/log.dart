import 'package:pi_hole_client/models/api/v6/metrics/query.dart';

class Log {
  final DateTime dateTime;
  final String type;
  final String url;
  final String device;
  final String? status;
  final String? replyType;
  final BigInt replyTime;
  final String? answeredBy;

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

  static const List<String> replyTypes = [
    "N/A",
    "NODATA",
    "NXDOMAIN",
    "CNAME",
    "IP",
    "DOMAIN",
    "RRNAME",
    "SERVFAIL",
    "REFUSED",
    "NOTIMP",
    "upstream error",
    "DNSSEC",
    "NONE",
    "BLOB",
  ];

  // Must be in the same order as FilterV6._logStatusString
  static const List<String> logStatusV6 = [
    // OKs
    "FORWARDED",
    "CACHE",
    // NGs
    "REGEX",
    "GRAVITY",
    "DENYLIST",
    "EXTERNAL_BLOCKED_IP",
    "EXTERNAL_BLOCKED_NULL",
    "EXTERNAL_BLOCKED_NXRA",
    "EXTERNAL_BLOCKED_EDE15",
    "DENYLIST_CNAME",
    "GRAVITY_CNAME",
    "REGEX_CNAME",
    // Others
    "CACHE_STALE",
    "RETRIED",
    "RETRIED_DNSSEC",
    "IN_PROGRESS",
    "SPECIAL_DOMAIN",
    "UNKNOWN",
    // Not a status
    "DBBUSY",
  ];

  factory Log.fromJson(List data) => Log(
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
          : null);

  factory Log.fromV6(Query query) {
    return Log(
      dateTime: DateTime.fromMillisecondsSinceEpoch(query.time * 1000),
      type: query.type,
      url: query.domain,
      device: query.client.name ?? query.client.ip,
      status: query.status != null
          ? logStatusV6.indexOf(query.status!).toString()
          : null,
      replyType: query.reply.type,
      replyTime: BigInt.from(query.reply.time * 1000 * 10),
      answeredBy: query.upstream,
    );
  }

  //toJson
  Map<String, dynamic> toJson() => {
        'dateTime': dateTime.toIso8601String(),
        'type': type,
        'url': url,
        'device': device,
        'status': status,
        'replyType': replyType,
        'replyTime': replyTime.toString(),
        'answeredBy': answeredBy,
      };
}
