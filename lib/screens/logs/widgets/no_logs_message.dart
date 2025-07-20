import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/behavior/no_scroll_behavior.dart';
import 'package:provider/provider.dart';

/// A widget that displays a message when no logs are available.
///
/// The message changes depending on the current filter settings:
/// - If a time range filter is active (via [FiltersProvider]), it shows the range with no logs found.
/// - If no filter is active, it shows a message based on the recent period defined by [logsPerQuery].
///
/// Parameters:
/// - [logsPerQuery]: The duration (in hours or 0.5 for 30 minutes) used to describe
///   the default log range when no custom time filter is applied.
class NoLogsMessage extends StatelessWidget {
  const NoLogsMessage({required this.logsPerQuery, super.key});

  final double logsPerQuery;

  @override
  Widget build(BuildContext context) {
    final startTime = context.select<FiltersProvider, DateTime?>(
      (provider) => provider.startTime,
    );
    final endTime = context.select<FiltersProvider, DateTime?>(
      (provider) => provider.endTime,
    );

    final height = MediaQuery.of(context).size.height;

    return ScrollConfiguration(
      behavior: NoScrollBehavior(),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: height - 144,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                _buildNoLogsMessage(context, startTime, endTime),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a localized message indicating that no logs are available,
  /// based on the selected time filter or the recent query period.
  ///
  /// Parameters:
  /// - [context]: The current build context, used for localization.
  /// - [startTime]: The start of the time range filter. Can be null.
  /// - [endTime]: The end of the time range filter. Can be null.
  ///
  /// Returns:
  /// A localized message string describing the absence of logs in the specified range or period.
  String _buildNoLogsMessage(
    BuildContext context,
    DateTime? startTime,
    DateTime? endTime,
  ) {
    final loc = AppLocalizations.of(context)!;

    if (startTime != null || endTime != null) {
      final start = startTime != null
          ? formatTimestamp(startTime, kUnifiedDateTimeFormat)
          : loc.now;
      final end = endTime != null
          ? formatTimestamp(endTime, kUnifiedDateTimeFormat)
          : loc.now;

      return '${loc.noLogsDisplay} ${loc.between}\n$start\n${loc.and}\n$end';
    } else {
      final value = logsPerQuery == 0.5 ? '30' : logsPerQuery.toInt();
      final unit = logsPerQuery == 0.5 ? loc.minutes : loc.hours;
      return '${loc.noLogsDisplay} ${loc.fromLast} $value $unit';
    }
  }
}
