import 'dart:async';

import 'package:pi_hole_client/data/repositories/local/interfaces/app_log_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';

/// Keeps the app logs in memory. They are lost when the app closes.
class LocalAppLogRepository implements AppLogRepository {
  LocalAppLogRepository({DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final List<AppLog> _logs = [];
  final StreamController<List<AppLog>> _controller =
      StreamController<List<AppLog>>.broadcast();

  @override
  List<AppLog> get logs => List.unmodifiable(_logs);

  @override
  Stream<List<AppLog>> get logsStream => _controller.stream;

  @override
  void add({
    required AppLogType type,
    required String message,
    int? statusCode,
  }) {
    _logs.add(
      AppLog(
        type: type.name,
        dateTime: _now(),
        message: message,
        statusCode: statusCode?.toString(),
      ),
    );
    _controller.add(logs);
  }
}
