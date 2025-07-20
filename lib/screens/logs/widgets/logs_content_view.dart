import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/screens/logs/widgets/log_tile.dart';
import 'package:pi_hole_client/screens/logs/widgets/no_logs_message.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/error_message.dart';

/// A widget that displays the content view for logs, handling different loading states.
///
/// Depending on the [loadStatus], this widget displays:
/// - A loading indicator and message when logs are being loaded.
/// - A refreshable list of logs when logs are loaded, with support for infinite scrolling and log selection.
/// - An error message if logs could not be loaded.
///
/// The [logs] parameter provides the list of logs to display.
/// The [isLoadingMore] flag indicates if more logs are being loaded for infinite scrolling.
/// The [onRefresh] callback is triggered when the user pulls to refresh the logs.
/// The [onLogTap] callback is called when a log is tapped.
/// The [selectedLog] parameter highlights the currently selected log.
/// The [scrollController] manages the scroll position of the log list.
/// The [logsPerQuery] parameter defines how many logs are fetched per query, which is used to display a message when no logs are available.
class LogsContentView extends StatelessWidget {
  const LogsContentView({
    required this.loadStatus,
    required this.logs,
    required this.isLoadingMore,
    required this.onRefresh,
    required this.onLogTap,
    required this.selectedLog,
    required this.scrollController,
    required this.logsPerQuery,
    super.key,
  });

  final LoadStatus loadStatus;
  final List<Log> logs;
  final bool isLoadingMore;
  final Future<void> Function() onRefresh;
  final void Function(Log) onLogTap;
  final Log? selectedLog;
  final ScrollController scrollController;
  final double logsPerQuery;

  @override
  Widget build(BuildContext context) {
    switch (loadStatus) {
      // Show a loading indicator and message when logs are being loaded
      case LoadStatus.loading:
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 50),
              Text(
                AppLocalizations.of(context)!.loadingLogs,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );

      // Show the list of logs when they are loaded
      case LoadStatus.loaded:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: logs.isNotEmpty
              ? ListView.builder(
                  controller: scrollController,
                  itemCount: isLoadingMore ? logs.length + 1 : logs.length,
                  itemBuilder: (context, index) {
                    if (isLoadingMore && index == logs.length) {
                      // Show a loading indicator at the end of the list when loading more logs
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final log = logs[index];
                    return LogTile(
                      log: logs[index],
                      showLogDetails: onLogTap,
                      isLogSelected: log == selectedLog,
                    );
                  },
                )
              : NoLogsMessage(logsPerQuery: logsPerQuery),
        );

      // Show an error message if logs could not be loaded
      case LoadStatus.error:
        return ErrorMessage(
          message: AppLocalizations.of(context)!.couldntLoadLogs,
          fontSize: 24,
          fontColor: Theme.of(context).colorScheme.onSurfaceVariant,
        );
    }
  }
}
