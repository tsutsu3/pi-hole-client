import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

/// Label for a disable duration, e.g. "30 seconds", "1 minute", "2 hours".
String disableDurationLabel(int seconds, AppLocalizations loc) {
  if (seconds % 3600 == 0) return loc.durationHours(seconds ~/ 3600);
  if (seconds % 60 == 0) return loc.durationMinutes(seconds ~/ 60);
  return loc.durationSeconds(seconds);
}
