import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_log.freezed.dart';

@freezed
sealed class AppLog with _$AppLog {
  const factory AppLog({
    required String type,
    required DateTime dateTime,

    /// A short summary, e.g. `Failed to connect`.
    required String message,

    /// The address of the server the log is about.
    String? serverAddress,

    /// The error, e.g. the exception text.
    String? details,

    /// If the log is about an HTTP request, the status code of the response.
    String? statusCode,
  }) = _AppLog;
}
