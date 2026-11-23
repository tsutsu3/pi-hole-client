import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations_en.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/disable_duration_label.dart';

void main() {
  final loc = AppLocalizationsEn();

  group('disableDurationLabel', () {
    test('uses the biggest exact unit', () {
      expect(disableDurationLabel(30, loc), '30 seconds');
      expect(disableDurationLabel(60, loc), '1 minute');
      expect(disableDurationLabel(1200, loc), '20 minutes');
      expect(disableDurationLabel(7200, loc), '2 hours');
      expect(disableDurationLabel(90, loc), '90 seconds');
    });
  });

  group('remainingTimeLabel', () {
    test('rounds up to the minute', () {
      expect(remainingTimeLabel(const Duration(seconds: 1)), '1m');
      expect(remainingTimeLabel(const Duration(minutes: 12)), '12m');
      expect(
        remainingTimeLabel(const Duration(minutes: 11, seconds: 1)),
        '12m',
      );
    });

    test('shows hours with two-digit minutes', () {
      expect(
        remainingTimeLabel(const Duration(hours: 3, minutes: 5)),
        '3h 05m',
      );
      expect(remainingTimeLabel(const Duration(hours: 1)), '1h 00m');
    });
  });
}
