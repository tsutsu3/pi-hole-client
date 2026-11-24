import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/app_log_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';

/// ViewModel for the App Logs screen.
class AppLogsViewModel extends ChangeNotifier {
  AppLogsViewModel({required AppLogRepository repository})
    : _logs = _newestFirst(repository.logs) {
    _subscription = repository.logsStream.listen((logs) {
      _logs = _newestFirst(logs);
      notifyListeners();
    });
  }

  late final StreamSubscription<List<AppLog>> _subscription;
  List<AppLog> _logs;

  /// The logs, newest first.
  List<AppLog> get logs => _logs;

  /// The logs grouped by day, newest day first. Each day keeps the order of
  /// [logs].
  List<({DateTime day, List<AppLog> logs})> get logsByDay {
    final groups = <({DateTime day, List<AppLog> logs})>[];

    for (final log in _logs) {
      final dateTime = log.dateTime;
      final day = DateTime(dateTime.year, dateTime.month, dateTime.day);
      if (groups.isEmpty || groups.last.day != day) {
        groups.add((day: day, logs: []));
      }
      groups.last.logs.add(log);
    }

    return groups;
  }

  // The repository keeps the logs in the order they were added.
  static List<AppLog> _newestFirst(List<AppLog> logs) =>
      List.unmodifiable(logs.reversed);

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
