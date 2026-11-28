import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

/// Label for a disable duration, e.g. "30 seconds", "1 minute", "2 hours".
String disableDurationLabel(int seconds, AppLocalizations loc) {
  if (seconds % 3600 == 0) return loc.durationHours(seconds ~/ 3600);
  if (seconds % 60 == 0) return loc.durationMinutes(seconds ~/ 60);
  return loc.durationSeconds(seconds);
}

/// Short label for a time left, rounded up to the minute: "3h 05m", "12m".
String remainingTimeLabel(Duration remaining) {
  final totalMinutes = (remaining.inSeconds + 59) ~/ 60;
  final minutes = totalMinutes < 1 ? 1 : totalMinutes;
  final h = minutes ~/ 60;
  final m = minutes % 60;
  if (h > 0) return '${h}h ${m.toString().padLeft(2, '0')}m';
  return '${m}m';
}
