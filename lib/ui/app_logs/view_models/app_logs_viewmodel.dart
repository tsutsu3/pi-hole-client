import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/app_log_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';

/// ViewModel for the App Logs screen.
class AppLogsViewModel extends ChangeNotifier {
  AppLogsViewModel({required AppLogRepository repository})
    : _logs = repository.logs {
    _subscription = repository.logsStream.listen((logs) {
      _logs = logs;
      notifyListeners();
    });
  }

  late final StreamSubscription<List<AppLog>> _subscription;
  List<AppLog> _logs;

  List<AppLog> get logs => _logs;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
