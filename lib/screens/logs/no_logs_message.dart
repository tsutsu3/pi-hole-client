import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/no_scroll_behavior.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:provider/provider.dart';

class NoLogsMessage extends StatelessWidget {
  const NoLogsMessage({required this.logsPerQuery, super.key});

  final double logsPerQuery;

  @override
  Widget build(BuildContext context) {
    final filtersProvider = Provider.of<FiltersProvider>(context);

    final height = MediaQuery.of(context).size.height;

    String noLogsMessage() {
      if (filtersProvider.startTime != null ||
          filtersProvider.endTime != null) {
        return '${AppLocalizations.of(context)!.noLogsDisplay} '
            '${AppLocalizations.of(context)!.between}\n'
            '${filtersProvider.startTime != null ? formatTimestamp(filtersProvider.startTime!, kUnifiedDateTimeFormat) : AppLocalizations.of(context)!.now}\n'
            '${AppLocalizations.of(context)!.and}\n'
            '${filtersProvider.startTime != null && filtersProvider.endTime != null ? formatTimestamp(filtersProvider.endTime!, kUnifiedDateTimeFormat) : AppLocalizations.of(context)!.now} ';
      } else {
        return '${AppLocalizations.of(context)!.noLogsDisplay} '
            '${AppLocalizations.of(context)!.fromLast} ${logsPerQuery == 0.5 ? '30' : logsPerQuery.toInt()} ${logsPerQuery == 0.5 ? AppLocalizations.of(context)!.minutes : AppLocalizations.of(context)!.hours}';
      }
    }

    return ScrollConfiguration(
      behavior: NoScrollBehavior(),
      child: ListView(
        children: [
          SizedBox(
            height: height - 144,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      noLogsMessage(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
