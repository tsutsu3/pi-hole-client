import 'package:freezed_annotation/freezed_annotation.dart';

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
    // TODO: nullable or not? (status, replyType, id, answeredBy)
    required DateTime dateTime,
    required String type,
    required String url,
    required String device,
    required BigInt replyTime,
    String? status,
    String? replyType,
    int? id,
    String? answeredBy,
  }) = _Log;

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
}
