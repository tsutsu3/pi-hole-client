import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

Level getLogLevel() {
  if (kReleaseMode) {
    return Level.off; // Disable logging in release mode
  }

  final logLevel = dotenv.env['LOG_LEVEL']?.toLowerCase() ?? 'info';
  switch (logLevel) {
    case 'debug':
      return Level.debug;
    case 'info':
      return Level.info;
    case 'warning':
      return Level.warning;
    case 'error':
      return Level.error;
    case 'off':
      return Level.off;
    default:
      return Level.info;
  }
}

class CustomLogFilter extends LogFilter {
  final Level minLevel;

  CustomLogFilter(this.minLevel);

  @override
  bool shouldLog(LogEvent event) {
    return event.level.index >= minLevel.index;
  }
}

final Logger logger = Logger(
  filter: CustomLogFilter(getLogLevel()),
  printer: PrettyPrinter(),
);
