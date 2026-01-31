import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';
// import 'package:pi_hole_client/config/enums.dart';

part 'queries.freezed.dart';
part 'queries.g.dart';

@freezed
sealed class Logs with _$Logs {
  @JsonSerializable(explicitToJson: true)
  const factory Logs({
    required List<Log> logs,
    int? cursor,
    int? recordsTotal,
    int? recordsFiltered,
  }) = _Logs;

  factory Logs.fromJson(Map<String, dynamic> json) => _$LogsFromJson(json);
}

@freezed
sealed class Log with _$Log {
  const factory Log({
    required DateTime dateTime,
    required DnsRecordType type,
    required String url,
    required String device,
    required BigInt replyTime,
    QueryStatusType? status,
    ReplyType? replyType,
    int? id,
    String? answeredBy,
  }) = _Log;

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
}
