import 'dart:async';

import 'package:pi_hole_client/data/repositories/local/interfaces/app_log_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';

/// Keeps the app logs in memory. They are lost when the app closes.
class LocalAppLogRepository implements AppLogRepository {
  LocalAppLogRepository({DateTime Function()? now})
    : _now = now ?? DateTime.now;

  /// The most logs kept. The oldest logs are removed first.
  static const maxLogs = 500;

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
    String? serverAddress,
    String? details,
    int? statusCode,
  }) {
    _logs.add(
      AppLog(
        type: type.name,
        dateTime: _now(),
        message: redactSecrets(message),
        serverAddress: serverAddress,
        details: details == null ? null : redactSecrets(details),
        statusCode: statusCode?.toString(),
      ),
    );
    if (_logs.length > maxLogs) {
      _logs.removeRange(0, _logs.length - maxLogs);
    }
    _controller.add(logs);
  }
}

final _secretPatterns = [
  // Query parameters, e.g. `?auth=<v5 token>`.
  RegExp(
    r'(?<=[?&](?:auth|sid|password|token|totp)=)[^&\s#]+',
    caseSensitive: false,
  ),
  // JSON values, e.g. `"sid": "..."`.
  RegExp(
    r'(?<="(?:sid|password|totp|token)"\s*:\s*)(?:"(?:[^"\\]|\\.)*"|\d+)',
    caseSensitive: false,
  ),
  // Header values, e.g. `X-FTL-SID: ...`.
  RegExp(
    r'(?<=(?:X-FTL-SID|Set-Cookie|Cookie|Authorization)\s*[:=]\s*)[^\s,}][^\r\n,}]*',
    caseSensitive: false,
  ),
];

/// Replaces passwords, tokens, session IDs and cookies in [text] with `***`.
String redactSecrets(String text) {
  var result = text;
  for (final pattern in _secretPatterns) {
    result = result.replaceAll(pattern, '***');
  }

  return result;
}
