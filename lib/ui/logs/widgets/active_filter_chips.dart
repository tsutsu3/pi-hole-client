import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/logs/viewmodel/logs_viewmodel.dart';

/// A widget that displays active filter chips for the logs screen.
///
/// Each chip allows the user to remove the corresponding filter by tapping on it.
class ActiveFilterChips extends StatelessWidget {
  const ActiveFilterChips({
    required this.logsViewModel,
    required this.onResetFilters,
    required this.onResetTimeFilters,
    this.onScrollToTop,
    super.key,
  });

  final LogsViewModel logsViewModel;
  final VoidCallback onResetFilters;
  final VoidCallback onResetTimeFilters;
  final VoidCallback? onScrollToTop;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final chips = <Widget>[];

    if (logsViewModel.startTime != null || logsViewModel.endTime != null) {
      chips.add(
        _buildChip(
          context,
          loc.time,
          const Icon(Icons.access_time_rounded),
          () {
            logsViewModel.resetTime();
            onResetTimeFilters();
          },
        ),
      );
    }

    if (logsViewModel.statusSelected.length <
        logsViewModel.defaultSelected.length) {
      final label = logsViewModel.statusSelected.length == 1
          ? logsViewModel.statusSelectedString
          : '${logsViewModel.statusSelected.length} ${loc.statusSelected}';

      chips.add(
        _buildChip(context, label, const Icon(Icons.shield), () {
          onScrollToTop?.call();
          logsViewModel.resetStatus();
          onResetFilters();
        }),
      );
    }

    if (logsViewModel.selectedClients.isNotEmpty &&
        logsViewModel.selectedClients.length <
            logsViewModel.totalClients.length) {
      final label = logsViewModel.selectedClients.length == 1
          ? logsViewModel.selectedClients[0]
          : '${logsViewModel.selectedClients.length} ${loc.clientsSelected}';

      chips.add(
        _buildChip(context, label, const Icon(Icons.devices), () {
          onScrollToTop?.call();
          logsViewModel.resetClients();
          onResetFilters();
        }),
      );
    }

    if (logsViewModel.selectedDomain != null) {
      chips.add(
        _buildChip(
          context,
          logsViewModel.selectedDomain!,
          const Icon(Icons.http_rounded),
          () {
            onScrollToTop?.call();
            logsViewModel.setSelectedDomain(null);
            onResetFilters();
          },
        ),
      );
    }

    return Wrap(children: chips);
  }

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
