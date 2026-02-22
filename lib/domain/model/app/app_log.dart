import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_log.freezed.dart';

@freezed
sealed class AppLog with _$AppLog {
  const factory AppLog({
    required String type,
    required DateTime dateTime,
    required String message,
    String? statusCode,
    String? resBody,
  }) = _AppLog;
}
