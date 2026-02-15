import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/models_old/log.dart';
import 'package:pi_hole_client/domain/use_cases/logs_screen_service.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';

/// A widget that displays active filter chips for the logs screen.
///
/// The [ActiveFilterChips] widget shows a set of chips representing the currently
/// applied filters, such as time range, status, selected clients, and selected domain.
/// Each chip allows the user to remove the corresponding filter by tapping on it,
/// which triggers the appropriate reset actions and callbacks.
///
/// Required parameters:
/// - [filtersViewModel]: Provides the current filter states.
/// - [serversViewModel]: Provides server-related information, such as the number of servers shown.
/// - [logsSvc]: Service for handling log-related actions, such as scrolling.
/// - [logsListDisplay]: The current list of logs being displayed.
/// - [onResetFilters]: Callback invoked when general filters are reset.
/// - [onResetTimeFilters]: Callback invoked specifically when time filters are reset.
class ActiveFilterChips extends StatelessWidget {
  const ActiveFilterChips({
    required this.filtersViewModel,
    required this.serversViewModel,
    required this.logsSvc,
    required this.logsListDisplay,
    required this.onResetFilters,
    required this.onResetTimeFilters,
    super.key,
  });

  final FiltersViewModel filtersViewModel;
  final ServersViewModel serversViewModel;
  final LogsScreenService logsSvc;
  final List<Log> logsListDisplay;
  final VoidCallback onResetFilters;
  final VoidCallback onResetTimeFilters;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final chips = <Widget>[];

    if (filtersViewModel.startTime != null || filtersViewModel.endTime != null) {
      chips.add(
        _buildChip(
          context,
          loc.time,
          const Icon(Icons.access_time_rounded),
          () {
            filtersViewModel.resetTime();
            onResetTimeFilters();
          },
        ),
      );
    }

    if (filtersViewModel.statusSelected.length < serversViewModel.numShown - 1) {
      final label = filtersViewModel.statusSelected.length == 1
          ? filtersViewModel.statusSelectedString
          : '${filtersViewModel.statusSelected.length} ${loc.statusSelected}';

      chips.add(
        _buildChip(context, label, const Icon(Icons.shield), () {
          logsSvc.scrollToTop(logsListDisplay);
          filtersViewModel.resetStatus();
          onResetFilters();
        }),
      );
    }

    if (filtersViewModel.selectedClients.isNotEmpty &&
        filtersViewModel.selectedClients.length <
            filtersViewModel.totalClients.length) {
      final label = filtersViewModel.selectedClients.length == 1
          ? filtersViewModel.selectedClients[0]
          : '${filtersViewModel.selectedClients.length} ${loc.clientsSelected}';

      chips.add(
        _buildChip(context, label, const Icon(Icons.devices), () {
          logsSvc.scrollToTop(logsListDisplay);
          filtersViewModel.resetClients();
          onResetFilters();
        }),
      );
    }

    if (filtersViewModel.selectedDomain != null) {
      chips.add(
        _buildChip(
          context,
          filtersViewModel.selectedDomain!,
          const Icon(Icons.http_rounded),
          () {
            logsSvc.scrollToTop(logsListDisplay);
            filtersViewModel.setSelectedDomain(null);
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
      child: Chip(label: Text(label), avatar: icon, onDeleted: onDeleted),
    );
  }
}
