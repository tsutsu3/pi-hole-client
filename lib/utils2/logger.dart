import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pi_hole_client/config2/formats.dart';

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
  CustomLogFilter(this.minLevel);

  final Level minLevel;

  @override
  bool shouldLog(LogEvent event) {
    return event.level.index >= minLevel.index;
  }
}

class TimeStampedPrinter extends LogPrinter {
  final PrettyPrinter _prettyPrinter = PrettyPrinter();

  @override
  List<String> log(LogEvent event) {
    final timestamp =
        DateFormat(kUnifiedDateTimeLogFormat).format(DateTime.now());
    return _prettyPrinter
        .log(event)
        .map((line) => '[$timestamp] $line')
        .toList();
  }
}

final Logger logger = Logger(
  filter: CustomLogFilter(getLogLevel()),
  // printer: PrettyPrinter(),
  printer: TimeStampedPrinter(),
);
