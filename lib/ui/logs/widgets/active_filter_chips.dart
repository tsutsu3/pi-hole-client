import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/models_old/log.dart';
import 'package:pi_hole_client/domain/use_cases/logs_screen_service.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

/// A widget that displays active filter chips for the logs screen.
///
/// The [ActiveFilterChips] widget shows a set of chips representing the currently
/// applied filters, such as time range, status, selected clients, and selected domain.
/// Each chip allows the user to remove the corresponding filter by tapping on it,
/// which triggers the appropriate reset actions and callbacks.
///
/// Required parameters:
/// - [filtersProvider]: Provides the current filter states.
/// - [serversProvider]: Provides server-related information, such as the number of servers shown.
/// - [logsSvc]: Service for handling log-related actions, such as scrolling.
/// - [logsListDisplay]: The current list of logs being displayed.
/// - [onResetFilters]: Callback invoked when general filters are reset.
/// - [onResetTimeFilters]: Callback invoked specifically when time filters are reset.
class ActiveFilterChips extends StatelessWidget {
  const ActiveFilterChips({
    required this.filtersProvider,
    required this.serversProvider,
    required this.logsSvc,
    required this.logsListDisplay,
    required this.onResetFilters,
    required this.onResetTimeFilters,
    super.key,
  });

  final FiltersProvider filtersProvider;
  final ServersProvider serversProvider;
  final LogsScreenService logsSvc;
  final List<Log> logsListDisplay;
  final VoidCallback onResetFilters;
  final VoidCallback onResetTimeFilters;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final chips = <Widget>[];

    if (filtersProvider.startTime != null || filtersProvider.endTime != null) {
      chips.add(
        _buildChip(
          context,
          loc.time,
          const Icon(Icons.access_time_rounded),
          () {
            filtersProvider.resetTime();
            onResetTimeFilters();
          },
        ),
      );
    }

    if (filtersProvider.statusSelected.length < serversProvider.numShown - 1) {
      final label = filtersProvider.statusSelected.length == 1
          ? filtersProvider.statusSelectedString
          : '${filtersProvider.statusSelected.length} ${loc.statusSelected}';

      chips.add(
        _buildChip(
          context,
          label,
          const Icon(Icons.shield),
          () {
            logsSvc.scrollToTop(logsListDisplay);
            filtersProvider.resetStatus();
            onResetFilters();
          },
        ),
      );
    }

    if (filtersProvider.selectedClients.isNotEmpty &&
        filtersProvider.selectedClients.length <
            filtersProvider.totalClients.length) {
      final label = filtersProvider.selectedClients.length == 1
          ? filtersProvider.selectedClients[0]
          : '${filtersProvider.selectedClients.length} ${loc.clientsSelected}';

      chips.add(
        _buildChip(
          context,
          label,
          const Icon(Icons.devices),
          () {
            logsSvc.scrollToTop(logsListDisplay);
            filtersProvider.resetClients();
            onResetFilters();
          },
        ),
      );
    }

    if (filtersProvider.selectedDomain != null) {
      chips.add(
        _buildChip(
          context,
          filtersProvider.selectedDomain!,
          const Icon(Icons.http_rounded),
          () {
            logsSvc.scrollToTop(logsListDisplay);
            filtersProvider.setSelectedDomain(null);
            onResetFilters();
          },
        ),
      );
    }

    return Wrap(children: chips);
  }

  /// Builds a styled [Chip] widget with a label, an icon as the avatar, and a delete action.
  ///
  /// [label] - The text to display inside the chip.
  /// [icon] - The icon to display as the chip's avatar.
  /// [onDeleted] - The callback function to execute when the chip's delete icon is tapped.
  ///
  /// Returns a [Padding] widget containing the configured [Chip].
  Widget _buildChip(
    BuildContext context,
    String label,
    Icon icon,
    VoidCallback onDeleted,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Text(label),
        avatar: icon,
        onDeleted: onDeleted,
      ),
    );
  }
}
