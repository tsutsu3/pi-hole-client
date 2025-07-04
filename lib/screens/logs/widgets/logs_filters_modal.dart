import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/logs/widgets/clients_filters_modal.dart';
import 'package:pi_hole_client/screens/logs/widgets/status_filters_modal.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:provider/provider.dart';

class LogsFiltersModal extends StatefulWidget {
  const LogsFiltersModal({
    required this.statusBarHeight,
    required this.bottomNavBarHeight,
    required this.filterLogs,
    required this.window,
    super.key,
  });

  final double statusBarHeight;
  final double bottomNavBarHeight;
  final void Function() filterLogs;
  final bool window;

  @override
  State<LogsFiltersModal> createState() => _LogsFiltersModalState();
}

class _LogsFiltersModalState extends State<LogsFiltersModal> {
  String? timeError;

  @override
  Widget build(BuildContext context) {
    final filtersProvider = Provider.of<FiltersProvider>(context);
    final serverProvider = Provider.of<ServersProvider>(context);

    final width = MediaQuery.of(context).size.width;

    void openStatusModal() {
      if (width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
          useRootNavigator:
              false, // Prevents unexpected app exit on mobile when pressing back
          builder: (context) => StatusFiltersModal(
            statusBarHeight: widget.statusBarHeight,
            bottomNavBarHeight: widget.bottomNavBarHeight,
            statusSelected: filtersProvider.statusSelected,
            window: true,
          ),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (context) => StatusFiltersModal(
            statusBarHeight: widget.statusBarHeight,
            bottomNavBarHeight: widget.bottomNavBarHeight,
            statusSelected: filtersProvider.statusSelected,
            window: false,
          ),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    void openClientsModal() {
      // TODO: Call client only
      if (filtersProvider.totalClients.isEmpty) {
        context.read<StatusUpdateService>().refreshOnce();
      }
      if (width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
          useRootNavigator:
              false, // Prevents unexpected app exit on mobile when pressing back
          builder: (context) => ClientsFiltersModal(
            statusBarHeight: widget.statusBarHeight,
            bottomNavBarHeight: widget.bottomNavBarHeight,
            selectedClients: filtersProvider.selectedClients,
            window: true,
          ),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (context) => ClientsFiltersModal(
            statusBarHeight: widget.statusBarHeight,
            bottomNavBarHeight: widget.bottomNavBarHeight,
            selectedClients: filtersProvider.selectedClients,
            window: false,
          ),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    String statusText(items, maxItems) {
      if (items == 0) {
        return AppLocalizations.of(context)!.noItemsSelected;
      } else if (items == maxItems) {
        return AppLocalizations.of(context)!.allItemsSelected;
      } else {
        return '$items ${AppLocalizations.of(context)!.itemsSelected}';
      }
    }

    Future<void> selectTime(String time) async {
      final now = DateTime.now();
      final dateValue = await showDatePicker(
        context: context,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        initialDate: now,
        firstDate: DateTime(now.year, now.month - 1, now.day),
        lastDate: now,
      );
      if (!context.mounted) return;

      if (dateValue != null) {
        final timeValue = await showTimePicker(
          context: context,
          useRootNavigator:
              false, // Prevents unexpected app exit on mobile when pressing back
          initialTime: TimeOfDay.now(),
          helpText: time == 'from'
              ? AppLocalizations.of(context)!.selectStartTime
              : AppLocalizations.of(context)!.selectEndTime,
        );
        if (timeValue != null) {
          final value = DateTime(
            dateValue.year,
            dateValue.month,
            dateValue.day,
            timeValue.hour,
            timeValue.minute,
            dateValue.second,
          );
          if (time == 'from') {
            if (filtersProvider.endTime != null &&
                value.isAfter(filtersProvider.endTime!)) {
              setState(() {
                timeError =
                    AppLocalizations.of(context)!.startTimeNotBeforeEndTime;
              });
            } else {
              filtersProvider.setStartTime(value);
              setState(() {
                timeError = null;
              });
            }
          } else {
            if (filtersProvider.startTime != null &&
                value.isBefore(filtersProvider.startTime!)) {
              setState(() {
                timeError =
                    AppLocalizations.of(context)!.endTimeNotAfterStartTime;
              });
            } else {
              filtersProvider.setEndTime(value);
              setState(() {
                timeError = null;
              });
            }
          }
        }
      }
    }

    bool isFilteringValid() {
      if (timeError == null && filtersProvider.statusSelected.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }

    void resetFilters() {
      filtersProvider.resetFilters();
    }

    Widget content() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Icon(
                          Icons.filter_list,
                          size: 24,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          AppLocalizations.of(context)!.filters,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.time,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () => selectTime('from'),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          splashColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withValues(alpha: 0.1),
                                          highlightColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withValues(alpha: 0.1),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .fromTime,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  filtersProvider.startTime !=
                                                          null
                                                      ? formatTimestamp(
                                                          filtersProvider
                                                              .startTime!,
                                                          kUnifiedDateTimeFormat,
                                                        )
                                                      : AppLocalizations.of(
                                                          context,
                                                        )!
                                                          .notSelected,
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () => selectTime('to'),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          splashColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withValues(alpha: 0.1),
                                          highlightColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withValues(alpha: 0.1),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .toTime,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  filtersProvider.endTime !=
                                                          null
                                                      ? formatTimestamp(
                                                          filtersProvider
                                                              .endTime!,
                                                          kUnifiedDateTimeFormat,
                                                        )
                                                      : AppLocalizations.of(
                                                          context,
                                                        )!
                                                          .notSelected,
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (timeError != null) ...[
                                  const SizedBox(height: 5),
                                  Text(
                                    timeError!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.status,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        width: double.maxFinite,
                        child: SegmentedButton<RequestStatus>(
                          segments: [
                            ButtonSegment(
                              value: RequestStatus.all,
                              label: Text(AppLocalizations.of(context)!.all),
                            ),
                            ButtonSegment(
                              value: RequestStatus.allowed,
                              label:
                                  Text(AppLocalizations.of(context)!.allowed),
                            ),
                            ButtonSegment(
                              value: RequestStatus.blocked,
                              label:
                                  Text(AppLocalizations.of(context)!.blocked),
                            ),
                          ],
                          selected: <RequestStatus>{
                            filtersProvider.requestStatus,
                          },
                          onSelectionChanged: (value) => setState(
                            () => filtersProvider.setRequestStatus(value.first),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: openStatusModal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .advancedStatusFiltering,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        statusText(
                                          filtersProvider.statusSelected.length,
                                          serverProvider.numShown,
                                        ),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.arrow_right),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: openClientsModal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.clients,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        statusText(
                                          filtersProvider
                                              .selectedClients.length,
                                          filtersProvider.totalClients.length,
                                        ),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.arrow_right),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.only(bottom: Platform.isIOS ? 20 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: resetFilters,
                    child: Text(AppLocalizations.of(context)!.reset),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.maybePop(context),
                        child: Text(AppLocalizations.of(context)!.close),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: isFilteringValid() == true
                            ? () {
                                widget.filterLogs();
                                Navigator.maybePop(context);
                              }
                            : null,
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(
                            isFilteringValid() == true
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                          ),
                          overlayColor: WidgetStateProperty.all(
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withValues(alpha: 0.1),
                          ),
                        ),
                        child: Text(AppLocalizations.of(context)!.apply),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    if (widget.window == true) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: content(),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).dialogTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: content(),
        ),
      );
    }
  }
}
