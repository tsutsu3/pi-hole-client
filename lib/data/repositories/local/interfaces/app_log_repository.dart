import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';

/// Keeps the app logs shown on the App Logs page.
abstract interface class AppLogRepository {
  /// The current logs, oldest first.
  List<AppLog> get logs;

  /// Emits the new [logs] each time a log is added.
  Stream<List<AppLog>> get logsStream;

  /// Adds a log entry.
  void add({
    required AppLogType type,
    required String message,
    int? statusCode,
  });
}
