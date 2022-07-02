// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:droid_hole/widgets/status_filters_modal.dart';

import 'package:droid_hole/providers/filters_provider.dart';
import 'package:droid_hole/functions/format.dart';

class LogsFiltersModal extends StatefulWidget {
  final double statusBarHeight;
  final double bottomNavBarHeight;
  final void Function() filterLogs;

  const LogsFiltersModal({
    Key? key,
    required this.statusBarHeight,
    required this.bottomNavBarHeight,
    required this.filterLogs,
  }) : super(key: key);

  @override
  State<LogsFiltersModal> createState() => _LogsFiltersModalState();
}

class _LogsFiltersModalState extends State<LogsFiltersModal> {
  String? timeError;

  @override
  Widget build(BuildContext context) {
    final filtersProvider = Provider.of<FiltersProvider>(context);

    final width = MediaQuery.of(context).size.width;

    void _openStatusModal() {
      showModalBottomSheet(
        context: context, 
        builder: (context) => StatusFiltersModal(
          statusBarHeight: widget.statusBarHeight,
          bottomNavBarHeight: widget.bottomNavBarHeight,
          statusSelected: filtersProvider.statusSelected,
        ),
        backgroundColor: Colors.transparent,
        isDismissible: true, 
        enableDrag: true,
        isScrollControlled: true,
      );
    }

    String _statusText() {
      switch (filtersProvider.statusSelected.length) {
        case 0:
          return AppLocalizations.of(context)!.noItemsSelected;

        case 14:
          return AppLocalizations.of(context)!.allItemsSelected;

        default:
          return "${filtersProvider.statusSelected.length} ${AppLocalizations.of(context)!.itemsSelected}";
      }
    }

    void _selectTime(String time) async {
      DateTime now = DateTime.now();
      DateTime? dateValue = await showDatePicker(
        context: context, 
        initialDate: now, 
        firstDate: DateTime(now.year, now.month-1, now.day), 
        lastDate: now
      );
      if (dateValue != null) {
        TimeOfDay? timeValue = await showTimePicker(
          context: context, 
          initialTime: TimeOfDay.now(),
          helpText: time == 'from'
            ? AppLocalizations.of(context)!.selectStartTime
            : AppLocalizations.of(context)!.selectEndTime
        );
        if (timeValue != null) {
          DateTime value = DateTime(
            dateValue.year,
            dateValue.month,
            dateValue.day,
            timeValue.hour,
            timeValue.minute,
            dateValue.second
          );
          if (time == 'from') {
            if (filtersProvider.endTime != null && value.isAfter(filtersProvider.endTime!)) {
              setState(() {
                timeError = AppLocalizations.of(context)!.startTimeNotBeforeEndTime;
              });
            }
            else {
              filtersProvider.setStartTime(value);
              setState(() {
                timeError = null;
              });
            }
          }
          else {
            if (filtersProvider.startTime != null && value.isBefore(filtersProvider.startTime!)) {
              setState(() {
                timeError = AppLocalizations.of(context)!.endTimeNotAfterStartTime;
              });
            }
            else {
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
      }
      else {
        return false;
      }
    }

    void _resetFilters() {
      filtersProvider.resetFilters();
    }

    return Container(
      margin: EdgeInsets.only(
        top: widget.statusBarHeight,
        left: 10,
        right: 10,
        bottom: Platform.isIOS ? 30 : 10
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: (width-20)/3),
                Container(
                  width: (width-20)/3,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.filters,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
                Container(
                  width: (width-20)/3,
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: _resetFilters,
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.restore),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.time,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () => _selectTime('from'),
                                  borderRadius: BorderRadius.circular(10),
                                  splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                  highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor
                                      )
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.fromTime,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          filtersProvider.startTime != null 
                                            ? formatTimestamp(filtersProvider.startTime!, "dd/MM/yyyy - HH:mm")
                                            : AppLocalizations.of(context)!.notSelected,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () => _selectTime('to'),
                                  borderRadius: BorderRadius.circular(10),
                                  splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                  highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor
                                      )
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.toTime,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Theme.of(context).primaryColor
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          filtersProvider.endTime != null 
                                            ? formatTimestamp(filtersProvider.endTime!, "dd/MM/yyyy - HH:mm")
                                            : AppLocalizations.of(context)!.notSelected,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12
                                          ),
                                        )
                                      ],
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
                                color: Colors.red
                              ),
                            )
                          ]
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _openStatusModal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.status,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _statusText(),
                                style: const TextStyle(
                                  color: Colors.grey
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.arrow_right)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context), 
                    icon: const Icon(Icons.close),
                    label: Text(AppLocalizations.of(context)!.close),
                  ),
                  const SizedBox(width: 10),
                  TextButton.icon(
                    onPressed: isFilteringValid() == true
                      ? () {
                          widget.filterLogs();
                          Navigator.pop(context);
                        }
                      : null, 
                    icon: const Icon(Icons.check), 
                    label: Text(AppLocalizations.of(context)!.apply),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        isFilteringValid() == true
                          ? Colors.green
                          : Colors.grey
                      ),
                      overlayColor: MaterialStateProperty.all(Colors.green.withOpacity(0.1))
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}